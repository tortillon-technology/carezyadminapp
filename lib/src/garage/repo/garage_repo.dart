import 'package:carezyadminapp/src/garage/model/garage_customer_model.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';

abstract class GarageRepo {
  Future<Either<ResponseError, GarageModel>> getGarages({
    required String query,
    required int nextPage,
  });

  Future<Either<ResponseError, dynamic>> getGarageDetails({
    required int id,
  });

  Future<Either<ResponseError, dynamic>> deleteGarage({
    required int id,
  });

  Future<Either<ResponseError, GarageCustomerModel>> getGarageCustomers({
    required int garageId,
    required String query,
    required int nextPage,
  });

  Future<Either<ResponseError, dynamic>> createGarage({
    required FormData params,
  });

  Future<Either<ResponseError, dynamic>> deleteImage({
    required int garageId,
    required int imageId,
  });

   Future<Either<ResponseError, dynamic>> updateGarage({
    required FormData params,
    required int id
  });

}
