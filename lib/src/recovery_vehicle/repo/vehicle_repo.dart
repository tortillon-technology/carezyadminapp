import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../model/vehicle_recovery_details_model.dart';
import '../model/vehicle_recovery_model.dart';

abstract class VehicleRepo {
  Future<Either<ResponseError, VehicleRecoveryModel>> getVehicleLists();
  Future<Either<ResponseError, VehicleRecoveryDetails>>
      getVehicleRecoveryDetails({required int id});

  Future<Either<ResponseError, dynamic>> deleteRecovery({required int id});
  Future<Either<ResponseError, dynamic>> createVehicleRecovery(
      {required FormData params});
      
        Future<Either<ResponseError, dynamic>> updateVehicle(
      {required FormData params,required int id});

  Future<Either<ResponseError, dynamic>> deleteImage(
      {required int garageId, required int imageId});
}
