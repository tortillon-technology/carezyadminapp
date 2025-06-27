import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../../res/constants/app_constants.dart';
import '../../../services/get_it.dart';
import '../model/brand_model.dart';
import '../model/garage_model.dart';
import '../model/vehicle_model.dart';

class CustomerRepoImplements extends CustomerRepo {
  final service = getIt.get<NetWorkBaseServices>();
  @override
  Future<Either<ResponseError, dynamic>> addCustomer(
      {required Map<String, dynamic> params}) {
    return service
        .safe(service.postRequest(
          endPoint: AppConstants.createCustomer,
          parameters: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, BrandsModel>> getCarBrands() {
    return service
        .safe(service.getRequest(
          endPoint: AppConstants.brands,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((json) => BrandsModel.fromJson(json));
  }

  @override
  Future<Either<ResponseError, VehicleModel>> getCarModel(
      {required String brandId}) {
    return service
        .safe(service.getRequest(
          endPoint: '${AppConstants.models}?brand_id=$brandId',
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => VehicleModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, GarageModel>> getGarages() {
    return service
        .safe(service.getRequest(
          endPoint: AppConstants.garages,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => GarageModel.fromJson(right));
  }
}
