import 'package:carezyadminapp/src/customer/model/customer_details_model.dart';
import 'package:carezyadminapp/src/customer/model/health_report_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../services/model/oodo_model.dart';
import '../model/brand_model.dart';
import '../model/customer_list_model.dart';
import '../model/garage_model.dart';
import '../model/vehicle_model.dart';

abstract class CustomerRepo {
  Future<Either<ResponseError, dynamic>> addCustomer(
      {required Map<String, dynamic> params});

  Future<Either<ResponseError, BrandsModel>> getCarBrands();

  Future<Either<ResponseError, VehicleModel>> getCarModel(
      {required String brandId});

  Future<Either<ResponseError, GarageModel>> getGarages();

  Future<Either<ResponseError, OdoModel>> getOodoReading(
      {required int customerID});

  Future<Either<ResponseError, CustomerListModel>> getCustomerList({
    required String query,
    required int nextPage,
  });

  Future<Either<ResponseError, dynamic>> uploadPdf({
    required FormData formData,
  });

  Future<Either<ResponseError, CustomerModel>> getCustomerDetails(
      {required int customerID});

  Future<Either<ResponseError, HealthReport>> getHealthReport(
      {required int customerID});

  Future<Either<ResponseError, dynamic>> updateProfile(
      {required Map<String, dynamic> params});

  Future<Either<ResponseError, dynamic>> deleteCustomer(
      {required int customerID});
}
