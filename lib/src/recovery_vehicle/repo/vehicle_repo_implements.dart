import 'package:carezyadminapp/data/remote/network_base_services.dart';
import 'package:carezyadminapp/src/recovery_vehicle/model/vehicle_recovery_model.dart';
import 'package:carezyadminapp/src/recovery_vehicle/repo/vehicle_repo.dart';
import 'package:dio/src/form_data.dart';
import 'package:either_dart/either.dart';

import '../../../res/constants/app_constants.dart';
import '../../../services/get_it.dart';
import '../model/vehicle_recovery_details_model.dart';

class VehicleRepoImplements extends VehicleRepo {
  final service = getIt.get<NetWorkBaseServices>();
  @override
  Future<Either<ResponseError, VehicleRecoveryModel>> getVehicleLists() {
    return service
        .safe(service.getRequest(
          endPoint: AppConstants.recoveryVehicle,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => VehicleRecoveryModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, VehicleRecoveryDetails>>
      getVehicleRecoveryDetails({required int id}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.recoveryVehicle}/$id",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => VehicleRecoveryDetails.fromJson(right));
  }

  @override
  Future<Either<ResponseError, dynamic>> createVehicleRecovery(
      {required FormData params}) {
    return service
        .safe(service.multipartPostRequest(
          endPoint: AppConstants.createRecovery,
          formData: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> deleteRecovery({required int id}) {
    return service
        .safe(service.deleteRequest(
          endPoint: "garages/recovery-vehicles/$id/",
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
          endPoint:
              "garages/recovery-vehicles/$garageId/remove-image/$imageId/",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> updateVehicle(
      {required FormData params, required int id}) {
    return service
        .safe(service.multipartPatchRequest(
          endPoint: "garages/recovery-vehicles/$id/",
          formData: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }
}
