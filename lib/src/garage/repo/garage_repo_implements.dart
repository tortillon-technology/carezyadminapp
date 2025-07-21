import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/model/garage_customer_model.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:dio/src/form_data.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../../res/constants/app_constants.dart';

class GarageRepoImplements extends GarageRepo {
  final service = getIt.get<NetWorkBaseServices>();

  @override
  Future<Either<ResponseError, GarageModel>> getGarages(
      {required String query, required int nextPage}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.garages}?search=$query",
          // endPoint:
          //     "${AppConstants.garages}?q=$query&page=$nextPage&page_size=10",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => GarageModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, dynamic>> getGarageDetails({required int id}) {
    return service
        .safe(service.getRequest(
          endPoint: "garages/garages-details/$id/",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, GarageCustomerModel>> getGarageCustomers({
    required int garageId,
    required String query,
    required int nextPage,
  }) {
    return service
        .safe(service.getRequest(
          endPoint:
              "garages/$garageId/customers/?search=$query&page=$nextPage&page_size=15",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => GarageCustomerModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, dynamic>> createGarage({
    required FormData params,
  }) {
    return service
        .safe(service.multipartPostRequest(
          endPoint: "garages/garages-list",
          formData: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> deleteGarage({required int id}) {
    return service
        .safe(service.deleteRequest(
          endPoint: "garages/garages-details/$id/",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> deleteImage(
      {required int garageId, required int imageId}) {
    return service
        .safe(service.deleteRequest(
          endPoint: "garages/$garageId/remove-image/$imageId/",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> updateGarage(
      {required FormData params, required int id}) {
    return service
        .safe(service.multipartPatchRequest(
          endPoint: "garages/garages-details/$id/",
          formData: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }
}
