import 'dart:io';

import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/recovery_vehicle/repo/vehicle_repo.dart';

import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../model/country.dart';

class CreateRecoveryViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<VehicleRepo>();

  PageController? pageController;

  final ImagePicker _picker = ImagePicker();
  List<File> imageList = [];

  int currentPageIndex = 0;
  bool enableButton = false;

  Country countryPhone = countries.first;
  Country countryWhatsApp = countries.first;

  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final whatsAppCtrl = TextEditingController();
  final cityCtrl = TextEditingController();

  String? nameError;
  String? addressError;
  String? emailError;
  String? phoneError;
  String? whatsAppError;
  String? cityError;

  @override
  void dispose() {
    nameCtrl.dispose();
    addressCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    whatsAppCtrl.dispose();
    cityCtrl.dispose();
    super.dispose();
  }

  initialize() {
    pageController = PageController();
  }

  update() {
    notifyListeners();
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageList.add(File(pickedFile.path));
      checkImages();
      notifyListeners();
    }
  }

  removeImage(int index) {
    imageList.removeAt(index);
    checkImages();
    notifyListeners();
  }

  updateIndex(int index) {
    currentPageIndex = index;
    switch (index) {
      case 0:
        checkVehicleDetails();
        break;
      case 1:
        checkImages();
        break;
    }
    notifyListeners();
  }

  checkVehicleDetails() {
    enableButton = nameError == null &&
        addressError == null &&
        emailError == null &&
        phoneError == null &&
        whatsAppError == null &&
        cityError == null;
  }

  checkImages() {
    enableButton = imageList.isNotEmpty;
  }

  validateName(String name) {
    nameError = Validators.validateVehicleName(name);
    checkVehicleDetails();
    notifyListeners();
  }

  validateAddress(String name) {
    addressError = Validators.validateAddress(name);
    checkVehicleDetails();
    notifyListeners();
  }

  validateEmail(String name) {
    emailError = Validators.validateEmail(name);
    checkVehicleDetails();
    notifyListeners();
  }

  validatePhone(String name) {
    phoneError = Validators.validatePhone(name);
    checkVehicleDetails();
    notifyListeners();
  }

  validateWhatsApp(String name) {
    whatsAppError = Validators.validatePhone(name);
    checkVehicleDetails();
    notifyListeners();
  }

  validateCity(String name) {
    cityError = Validators.validateCity(name);
    checkVehicleDetails();
    notifyListeners();
  }

  @override
  updateLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool?> createRecoveryVehicle() async {
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

    return repo
        .createVehicleRecovery(
            params: FormData.fromMap({
      'name': nameCtrl.text,
      'address': addressCtrl.text,
      'email': emailCtrl.text,
      'phone_number': countryPhone.dialCode + phoneCtrl.text,
      'whatsapp': countryWhatsApp.dialCode + whatsAppCtrl.text,
      'city': cityCtrl.text,
      'uploaded_images': multipartImages
    }))
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
}

mixin Helper {
  bool isLoading = false;

  updateLoader(bool value);
}
