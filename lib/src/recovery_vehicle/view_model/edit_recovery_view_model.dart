import 'dart:io';

import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/recovery_vehicle/model/edit_recovery_data.dart';
import 'package:carezyadminapp/src/recovery_vehicle/model/vehicle_recovery_details_model.dart';
import 'package:carezyadminapp/src/recovery_vehicle/repo/vehicle_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class EditRecoveryViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<VehicleRepo>();

  int initialHash = 0;

  EditRecoveryData? details;

  bool hasChange = false;

  final ImagePicker _picker = ImagePicker();
  List<File> imageList = [];

  String? nameError;
  String? emailError;
  String? phoneError;
  String? whatsAppError;
  String? cityError;
  String? addressError;

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageList.add(File(pickedFile.path));
      checkHasChange();
      notifyListeners();
    }
  }

  removeImage(int index) {
    imageList.removeAt(index);
    checkHasChange();
    notifyListeners();
  }

  getDetails({RecoveryDetails? data}) {
    details = EditRecoveryData(
        name: data?.name,
        email: data?.email,
        phoneNumber: data?.phoneNumber,
        whatsapp: data?.whatsapp,
        city: data?.city,
        address: data?.address,
        id: data?.id,
        images: data?.images
            ?.map((e) => Banner(id: e.id, image: e.image))
            .toList());

    initialHash = details.hashCode;

    checkHasChange();
    notifyListeners();
  }

  checkHasChange() {
    bool hasError = emailError != null ||
        nameError != null ||
        phoneError != null ||
        whatsAppError != null ||
        addressError != null;
    hasChange = hasError
        ? false
        : (initialHash != details.hashCode || imageList.isNotEmpty);
  }

  update({required Function() callback}) {
    callback.call();
    checkHasChange();
    notifyListeners();
  }

  Future<bool?> delete(int id) async {
    updateDeleteLoader(true);

    return await repo.deleteImage(garageId: details?.id ?? 0, imageId: id).fold(
      (left) {
        updateDeleteLoader(false);
        return false;
      },
      (right) {
        details?.images?.removeWhere((element) => element.id == id);
        final isSuccess = right?["status"] ?? false;
        updateDeleteLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateDeleteLoader(false);
      return false;
    });
  }

  Future<bool?> updateData() async {
    updateLoader(true);

    List<MultipartFile> multipartImages = [];

    for (var image in imageList) {
      final mimeType = lookupMimeType(image.path) ?? 'image/jpeg';
      final mediaType = MediaType.parse(mimeType);

      multipartImages.add(await MultipartFile.fromFile(
        image.path,
        contentType: mediaType,
        filename: image.path.split("/").last,
      ));
    }

    Map<String, dynamic> data = {
      'name': details?.name,
      'address': details?.address,
      'email': details?.email,
      'phone_number': details?.phoneNumber,
      'whatsapp': details?.whatsapp,
      'city': details?.city,
    };

    if (imageList.isNotEmpty) {
      data['uploaded_images'] = multipartImages;
    }

    return repo
        .updateVehicle(
      params: FormData.fromMap(data),
      id: details?.id ?? 0,
    )
        .fold((left) {
      updateLoader(false);
      return false;
    }, (right) {
      updateLoader(false);
      bool? isSuccess = right['status'] ?? false;
      return isSuccess;
    }).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  @override
  updateDeleteLoader(bool value) {
    isDeleting = value;
    notifyListeners();
  }

  @override
  updateLoader(bool value) {
    updateDetails = value;
    notifyListeners();
  }
}

mixin Helper {
  bool updateDetails = false;
  bool isDeleting = false;
  updateLoader(bool value);
  updateDeleteLoader(bool value);
}
