
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:either_dart/either.dart';

import '../../../res/enums/enums.dart';
import '../../../services/get_it.dart';
import '../../../utils/helpers/auto_dispose_view_model.dart';
import '../model/brand_model.dart';
import '../model/customer_details_model.dart';
import '../model/vehicle_model.dart';

class EditCustomerViewModel extends AutoDisposeViewModel {
  final repo = getIt.get<CustomerRepo>();
  LoaderState loaderState = LoaderState.loaded;

  bool hasChange = false;
  bool brandsLoader = false;
  bool modelsLoader = false;
  bool checkSave = false;
  bool updateProfile = false;

  int initialHash = 0;

  CustomerData? customerDetails;

  String? nameError;
  String? emailError;
  String? phoneError;
  String? regNumberError;

  List<Brand> brandsList = [];
  Brand? selectedBrand;
  List<Model> modelsList = [];
  Model? selectedModel;

  getCustomerDetails({CustomerData? data}) {
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
    return await repo.updateProfile(params: {
      // "id": id,
      // "brand": profileDetails?.brand?.id,
      // "model": profileDetails?.model?.id,
      // "name_en": profileDetails?.nameEn,
      // "name_ar": profileDetails?.nameEn,
      // "email": profileDetails?.email,
      // "phone_number": profileDetails?.phoneNumber,
      // "registration_number": profileDetails?.registrationNumber,
    }).fold(
      (left) {
        updateProfileLoader(false);
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
        regNumberError != null;
    hasChange = hasError ? false : (initialHash != customerDetails.hashCode);
  }
}
