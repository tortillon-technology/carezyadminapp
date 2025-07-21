import 'package:carezyadminapp/src/services/model/service_history_model.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../model/customer_model.dart';
import '../model/service_details_model.dart';
import '../model/service_list_model.dart';

abstract class ServiceRepo {
  Future<Either<ResponseError, dynamic>> addService(
      {required Map<String, dynamic> params});

  Future<Either<ResponseError, CustomerModel>> getCustomers(
      {required String phoneNumber});

  Future<Either<ResponseError, ServiceDetailsModel>> getServiceDetails(
      {required String id});

  Future<Either<ResponseError, ServiceListModel>> getServiceList({
    required String query,
    required int nextPage,
  });

    Future<Either<ResponseError, ServiceHistoryModel>> getServiceHitsory(
      {required String customerId});
}
