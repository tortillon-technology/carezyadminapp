import 'package:carezyadminapp/src/customer/model/brand_model.dart';
import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../services/get_it.dart';
import '../model/vehicle_model.dart';
import '../view/add_customer_screen.dart';

class CustomerViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<CustomerRepo>();

  PageController? pageController;

  int currentPageIndex = 0;
  bool enableButton = false;

  AddCustArguments? arguments;

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final vehicleCtrl = TextEditingController();
  final odoCtrl = TextEditingController();
  final vinCtrl = TextEditingController();

  String? fullName;
  String? emailId;
  String? phoneNumber;
  String? vehicleNumber;
  String? odoMeter;
  String? vinNumber;
  String? drivingRange;

  String? fullNameErrorText;
  String? emailIdErrorText;
  String? phoneNumberErrorText;
  String? vehicleNumberErrorText;
  String? odoMeterErrorText;
  String? vinNumberErrorText;

  List<Brand> brandsList = [];
  Brand? selectedBrand;
  List<Model> modelsList = [];
  Model? selectedModel;
  List<Garage> garageList = [];
  Garage? selectedGarage;

  initialize(AddCustArguments? args) {
    arguments = args;
    pageController = PageController();
  }

  updateIndex(int index) {
    currentPageIndex = index;
    switch (index) {
      case 0:
        checkCustomerDetails();
        break;
      case 1:
        checkMakers();
        break;
      case 2:
        checkModel();
        break;
      case 3:
        checkDrivingRange();
        break;
      case 4:
        checkGarage();
        break;
    }
    notifyListeners();
  }

  checkCustomerDetails() {
    enableButton = fullNameErrorText == null &&
        fullName != null &&
        emailIdErrorText == null &&
        emailId != null &&
        phoneNumberErrorText == null &&
        phoneNumber != null &&
        vehicleNumberErrorText == null &&
        vehicleNumber != null &&
        odoMeterErrorText == null &&
        odoMeter != null &&
        vinNumberErrorText == null &&
        vinNumber != null;
  }

  checkMakers() {
    enableButton = selectedBrand != null;
  }

  checkModel() {
    enableButton = selectedModel != null;
  }

  checkDrivingRange() {
    enableButton = drivingRange != null;
  }

  checkGarage() {
    enableButton = selectedGarage != null;
  }

  validateName(String name) {
    fullNameErrorText = Validators.validateName(name);
    fullName = null;
    if (fullNameErrorText == null) {
      fullName = name;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  validateEmail(String emailID) {
    emailIdErrorText = Validators.validateEmail(emailID);
    emailId = null;
    if (emailIdErrorText == null) {
      emailId = emailID;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  validatePhone(String phone) {
    phoneNumberErrorText = Validators.validatePhone(phone);
    phoneNumber = null;
    if (phoneNumberErrorText == null) {
      phoneNumber = phone;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  validateVehicleNumber(String vehicle) {
    vehicleNumberErrorText = Validators.validateVehicleNumber(vehicle);
    vehicleNumber = null;
    if (vehicleNumberErrorText == null) {
      vehicleNumber = vehicle;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  validateODOMeter(String odo) {
    odoMeterErrorText = Validators.validateODOMeter(odo);
    odoMeter = null;
    if (odoMeterErrorText == null) {
      odoMeter = odo;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  validateVIN(String vin) {
    vinNumberErrorText = Validators.validateVIN(vin);
    vinNumber = null;
    if (vinNumberErrorText == null) {
      vinNumber = vin;
    }
    checkCustomerDetails();
    notifyListeners();
  }

  Future<bool?> getBrands() async {
    brandsList = [];
    selectedGarage = null;
    updateLoader(true);
    return await repo.getCarBrands().fold(
      (left) {
        updateLoader(false);
        return false;
      },
      (right) {
        updateLoader(false);
        brandsList = [];
        final isSuccess = right.status ?? false;
        brandsList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  Future<bool?> getModels(String brandId) async {
    modelsList = [];
    selectedModel = null;
    updateLoader(true);
    return await repo.getCarModel(brandId: brandId).fold(
      (left) {
        updateLoader(false);
        return false;
      },
      (right) {
        updateLoader(false);
        modelsList = [];
        final isSuccess = right.status ?? false;
        modelsList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  Future<bool?> getGarages() async {
    garageList = [];
    selectedGarage = null;
    updateLoader(true);
    return await repo.getGarages().fold(
      (left) {
        updateLoader(false);
        return false;
      },
      (right) {
        updateLoader(false);
        garageList = [];
        final isSuccess = right.status ?? false;
        garageList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  Future<bool?> addCustomer() async {
    updateLoader(true);
    return await repo.addCustomer(params: {
      "name_en": fullName,
      "email": emailId,
      "phone_number": phoneNumber,
      "vehicle_number": vehicleNumber,
      "odometer_reading": odoMeter,
      "brand_id": selectedBrand?.id,
      "model_id": selectedModel?.id,
      "weekly_mileage_range": drivingRange,
      "vin_number": vinNumber,
      "vehicle_name": selectedModel?.nameEn,
      "garage_id": selectedGarage?.id
    }).fold(
      (left) {
        try {
          final Map<String, dynamic> errors = left.response?['errors'] ?? [];
          emailIdErrorText = checkValue(errors, 'email');
          phoneNumberErrorText = checkValue(errors, 'phone_number');
          if (emailIdErrorText != null || phoneNumberErrorText != null) {
            pageController?.animateToPage(0,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
        } catch (e) {}

        updateLoader(false);
        return false;
      },
      (right) {
        updateLoader(false);
        final isSuccess = right['status'] ?? false;
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  String? checkValue(Map<String, dynamic> data, String key) {
    final containsKey = data.containsKey(key);
    List<dynamic> list = containsKey ? data[key] ?? [] : [];
    return list.isNotEmpty ? list.first : null;
  }

  update({required Function() callback}) {
    callback.call();
    notifyListeners();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  updateLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isLoading = false;

  updateLoader(bool value);
}
