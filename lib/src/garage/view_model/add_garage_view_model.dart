import 'dart:io';

import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:carezyadminapp/src/recovery_vehicle/model/country.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class AddGarageViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<GarageRepo>();

  PageController? pageController;

  final ImagePicker _picker = ImagePicker();
  List<File> imageList = [];

  int currentPageIndex = 0;
  bool enableButton = false;

  Country countryPhone = countries.first;
  Country countryWhatsApp = countries.first;

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final whatsAppCtrl = TextEditingController();
  final regNumberCtrl = TextEditingController();

  final countryCtrl = TextEditingController();
  final stateCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final pinCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();

  final descriptionCtrl = TextEditingController();

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
        checkLocationDetails();
        break;
      case 2:
        checkDescription();
        break;
      case 3:
        enableButton = true;
        break;
    }
    notifyListeners();
  }

  checkVehicleDetails() {
    enableButton = nameError == null &&
        nameCtrl.text.isNotEmpty &&
        emailError == null &&
        emailCtrl.text.isNotEmpty &&
        phoneError == null &&
        phoneCtrl.text.isNotEmpty &&
        whatsAppError == null &&
        whatsAppCtrl.text.isNotEmpty &&
        regNumberError == null &&
        regNumberCtrl.text.isNotEmpty;
  }

  checkLocationDetails() {
    enableButton = countryError == null &&
        countryCtrl.text.isNotEmpty &&
        stateError == null &&
        stateCtrl.text.isNotEmpty &&
        locationError == null &&
        locationCtrl.text.isNotEmpty &&
        addressError == null &&
        addressCtrl.text.isNotEmpty &&
        cityError == null &&
        cityCtrl.text.isNotEmpty &&
        pinCodeError == null &&
        pinCodeCtrl.text.isNotEmpty;
  }

  checkDescription() {
    enableButton = descriptionError == null && descriptionCtrl.text.isNotEmpty;
  }

  checkImages() {
    enableButton = imageList.isNotEmpty;
  }

  validateName(String name) {
    nameError = Validators.validateVehicleName(name);
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

  validateGarageRegNumber(String name) {
    regNumberError = Validators.validateRegNumber(name);
    checkVehicleDetails();
    notifyListeners();
  }

  ///

  validateAddress(String name) {
    addressError = Validators.validateCommon(name, "Address");
    checkLocationDetails();
    notifyListeners();
  }

  validateCounrty(String name) {
    countryError = Validators.validateCommon(name, "Country");
    checkLocationDetails();
    notifyListeners();
  }

  validateState(String name) {
    stateError = Validators.validateCommon(name, "State");
    checkLocationDetails();
    notifyListeners();
  }

  validateLocation(String name) {
    locationError = Validators.validateCommon(name, "Location");
    checkLocationDetails();
    notifyListeners();
  }

  validateCity(String name) {
    cityError = Validators.validateCommon(name, "City");
    checkLocationDetails();
    notifyListeners();
  }

  validatePin(String name) {
    pinCodeError = Validators.validateCommon(name, "Pin Code");
    checkLocationDetails();
    notifyListeners();
  }

  ///
  validateDescription(String name) {
    descriptionError = Validators.validateCommon(name, "Description");
    checkDescription();
    notifyListeners();
  }

  @override
  updateLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String? checkValue(Map<String, dynamic> data, String key) {
    final containsKey = data.containsKey(key);
    List<dynamic> list = containsKey ? data[key] ?? [] : [];
    return list.isNotEmpty ? list.first : null;
  }

  Future<bool?> createGarage() async {
    updateLoader(true);
    errorMessage = null;
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
        .createGarage(
            params: FormData.fromMap({
      'name': nameCtrl.text,
      'email': emailCtrl.text,
      'phone_number': countryPhone.dialCode + phoneCtrl.text,
      'whatsapp_number': countryWhatsApp.dialCode + whatsAppCtrl.text,
      'garage_registration_number': regNumberCtrl.text,
      'country': countryCtrl.text,
      'pincode': pinCodeCtrl.text,
      'address': addressCtrl.text,
      'city': cityCtrl.text,
      'state': stateCtrl.text,
      'location': locationCtrl.text,
      'description': descriptionCtrl.text,
      'uploaded_images': multipartImages
    }))
        .fold((left) {
      try {
        errorMessage = left.response?['message'];
        final Map<String, dynamic> errors = left.response?['errors'] ?? [];
        emailError = checkValue(errors, 'email');
        phoneError = checkValue(errors, 'phone_number');
        whatsAppError = checkValue(errors, 'whatsapp_number');
        descriptionError = checkValue(errors, 'description');
        pinCodeError = checkValue(errors, 'pincode');
        if (emailError != null || phoneError != null || whatsAppError != null) {
          pageController?.animateToPage(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          updateLoader(false);
          return false;
        } else if (pinCodeError != null) {
          pageController?.animateToPage(1,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          updateLoader(false);
          return false;
        }
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
}

mixin Helper {
  bool isLoading = false;

  updateLoader(bool value);
}
