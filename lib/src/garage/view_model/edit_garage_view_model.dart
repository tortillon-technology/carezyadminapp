import 'dart:developer';
import 'dart:io';

import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class EditGarageViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<GarageRepo>();

  int initialHash = 0;

  Garages? details;

  bool hasChange = false;

  final ImagePicker _picker = ImagePicker();
  List<File> imageList = [];

  String? errorMessage;

  String? nameError;
  String? emailError;
  String? phoneError;
  String? whatsAppError;
  String? regNumberError;

  String? countryError;
  String? stateError;
  String? locationError;
  String? addressError;
  String? cityError;
  String? pinCodeError;

  String? descriptionError;

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

  getDetails({Garages? data}) {
    details = Garages(
        name: data?.name,
        email: data?.email,
        phoneNumber: data?.phoneNumber,
        whatsappNumber: data?.whatsappNumber,
        city: data?.city,
        address: data?.address,
        id: data?.id,
        state: data?.state,
        country: data?.country,
        pincode: data?.pincode,
        description: data?.description,
        garageRegistrationNumber: data?.garageRegistrationNumber,
        location: data?.location,
        images: data?.images
            ?.map((e) => GarageImage(id: e.id, image: e.imageUrl))
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
        regNumberError != null ||
        addressError != null ||
        cityError != null ||
        stateError != null ||
        locationError != null ||
        pinCodeError != null ||
        countryError != null ||
        descriptionError != null;
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
      'email': details?.email,
      'phone_number': details?.phoneNumber,
      'whatsapp_number': details?.whatsappNumber,
      'garage_registration_number': details?.garageRegistrationNumber,
      'country': details?.country,
      'pincode': details?.pincode,
      'address': details?.address,
      'city': details?.city,
      'state': details?.state,
      'location': details?.location,
      'description': details?.description,
    };

    if (imageList.isNotEmpty) {
      data['uploaded_images'] = multipartImages;
    }

    return repo
        .updateGarage(
      params: FormData.fromMap(data),
      id: details?.id ?? 0,
    )
        .fold((left) {
      try {
        errorMessage = left.response?['message'];
        final Map<String, dynamic> errors = left.response?['errors'] ?? [];
        emailError = checkValue(errors, 'email');
        phoneError = checkValue(errors, 'phone_number');
        whatsAppError = checkValue(errors, 'whatsapp_number');
        descriptionError = checkValue(errors, 'description');
        pinCodeError = checkValue(errors, 'pincode');
        checkHasChange();
      } catch (e) {}
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

  String? checkValue(Map<String, dynamic> data, String key) {
    final containsKey = data.containsKey(key);
    List<dynamic> list = containsKey ? data[key] ?? [] : [];
    return list.isNotEmpty ? list.first : null;
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
