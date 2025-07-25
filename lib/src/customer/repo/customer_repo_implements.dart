import 'package:carezyadminapp/src/customer/model/customer_details_model.dart';
import 'package:carezyadminapp/src/customer/model/customer_list_model.dart';
import 'package:carezyadminapp/src/customer/model/health_report_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/src/services/model/oodo_model.dart';
import 'package:dio/dio.dart';
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

  @override
  Future<Either<ResponseError, CustomerListModel>> getCustomerList(
      {required String query, required int nextPage}) {
    return service
        .safe(service.getRequest(
          endPoint:
              "${AppConstants.customerList}?q=$query&page=$nextPage&page_size=10",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => CustomerListModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, OdoModel>> getOodoReading(
      {required int customerID}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.oodoReading}?customer_id=$customerID",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => OdoModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, dynamic>> uploadPdf(
      {required FormData formData}) {
    return service
        .safe(service.multipartPostRequest(
          endPoint: AppConstants.uploadReport,
          formData: formData,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, CustomerModel>> getCustomerDetails(
      {required int customerID}) {
    return service
        .safe(service.getRequest(
          endPoint: "customer/customers-detail?customer_id=$customerID",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => CustomerModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, HealthReport>> getHealthReport(
      {required int customerID}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.healthReportList}$customerID",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => HealthReport.fromJson(right));
  }

  @override
  Future<Either<ResponseError, dynamic>> updateProfile(
      {required Map<String, dynamic> params}) {
    return service
        .safe(service.putRequest(
            endPoint: "customer/customer-profile", parameters: params))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, dynamic>> deleteCustomer(
      {required int customerID}) {
    return service
        .safe(service.postRequest(
            endPoint: "customer/delete-customer-profile",
            parameters: {
              "ids": [customerID]
            }))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }
}
