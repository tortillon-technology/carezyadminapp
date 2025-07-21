import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:either_dart/either.dart';

import '../../../res/enums/enums.dart';
import '../../../services/get_it.dart';
import '../../../utils/helpers/auto_dispose_view_model.dart';
import '../model/brand_model.dart' as bm;
import '../model/customer_details_model.dart';
import '../model/vehicle_model.dart' as vm;

class EditCustomerViewModel extends AutoDisposeViewModel {
  final repo = getIt.get<CustomerRepo>();
  LoaderState loaderState = LoaderState.loaded;

  bool hasChange = false;
  bool brandsLoader = false;
  bool modelsLoader = false;
  bool checkSave = false;
  bool updateProfile = false;

  int initialHash = 0;

  CustomerDetails? customerDetails;
  String? errorMessage;
  String? nameError;
  String? emailError;
  String? phoneError;
  String? regNumberError;
  String? drivingError;
  String? vinNumberError;

  List<bm.Brand> brandsList = [];
  bm.Brand? selectedBrand;
  List<vm.Model> modelsList = [];
  vm.Model? selectedModel;

  getCustomerDetails({CustomerDetails? data}) {
    customerDetails = data;
    initialHash = customerDetails.hashCode;
    checkHasChange();
  }

  Future<bool?> getBrands() async {
    brandsList = [];
    selectedBrand = null;
    updateBrandsLoader(true);
    return await repo.getCarBrands().fold(
      (left) {
        updateBrandsLoader(false);
        return false;
      },
      (right) {
        updateBrandsLoader(false);
        brandsList = [];
        final isSuccess = right.status ?? false;
        brandsList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateBrandsLoader(false);
      return false;
    });
  }

  Future<bool?> getModels(String brandId) async {
    modelsList = [];
    selectedModel = null;
    checkSave = false;
    updateModelsLoader(true);
    return await repo.getCarModel(brandId: brandId).fold(
      (left) {
        updateModelsLoader(false);
        return false;
      },
      (right) {
        updateModelsLoader(false);
        modelsList = [];
        final isSuccess = right.status ?? false;
        modelsList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateModelsLoader(false);
      return false;
    });
  }

  Future<bool?> updateProfileData() async {
    updateProfileLoader(true);

    Map<String, dynamic> params = {
      "id": customerDetails?.id,
      "brand": customerDetails?.brand?.id,
      "model": customerDetails?.model?.id,
      "name_en": customerDetails?.nameEn,
      "name_ar": customerDetails?.nameEn,
      "email": customerDetails?.email,
      "phone_number": customerDetails?.phoneNumber,
      "registration_number": customerDetails?.registrationNumber,
      "vin_number": customerDetails?.vinNumber,
      "weekly_mileage_range": customerDetails?.drivingHabit,
    };

    return await repo.updateProfile(params: params).fold(
      (left) {
        updateProfileLoader(false);
        errorMessage = left.message;
        final Map<String, dynamic> errors = left.response?['errors'] ?? [];
        emailError = checkValue(errors, 'email');
        phoneError = checkValue(errors, 'phone_number');
        return false;
      },
      (right) {
        final isSuccess = right?['status'] ?? false;
        if (isSuccess ?? false) {
          initialHash = customerDetails.hashCode;
          checkHasChange();
        } else {
          final Map<String, dynamic> errors = right?['errors'] ?? [];
          emailError = checkValue(errors, 'email');
          phoneError = checkValue(errors, 'phone_number');
        }
        updateProfileLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateProfileLoader(false);
      return false;
    });
  }

  String? checkValue(Map<String, dynamic> data, String key) {
    final containsKey = data.containsKey(key);
    List<dynamic> list = containsKey ? data[key] ?? [] : [];
    return list.isNotEmpty ? list.first : null;
  }

  checkBrandModel() {
    checkSave = selectedBrand != null && selectedModel != null;
  }

  updateLoader(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }

  updateProfileLoader(bool value) {
    updateProfile = value;
    notifyListeners();
  }

  updateBrandsLoader(bool value) {
    brandsLoader = value;
    notifyListeners();
  }

  updateModelsLoader(bool value) {
    modelsLoader = value;
    notifyListeners();
  }

  update({required Function() callback}) {
    callback.call();
    checkHasChange();
    notifyListeners();
  }

  checkHasChange() {
    bool hasError = emailError != null ||
        nameError != null ||
        phoneError != null ||
        regNumberError != null ||
        vinNumberError != null;
    hasChange = hasError ? false : (initialHash != customerDetails.hashCode);
  }
}
