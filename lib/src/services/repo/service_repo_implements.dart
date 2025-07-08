import 'package:carezyadminapp/data/remote/network_base_services.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
import 'package:carezyadminapp/src/services/model/service_details_model.dart';
import 'package:carezyadminapp/src/services/model/service_list_model.dart';
import 'package:carezyadminapp/src/services/repo/service_repo.dart';
import 'package:either_dart/either.dart';

import '../../../res/constants/app_constants.dart';
import '../../../services/get_it.dart';

class ServiceRepoImplements extends ServiceRepo {
  final service = getIt.get<NetWorkBaseServices>();

  @override
  Future<Either<ResponseError, dynamic>> addService(
      {required Map<String, dynamic> params}) {
    return service
        .safe(service.postRequest(
          endPoint: AppConstants.addService,
          parameters: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => right);
  }

  @override
  Future<Either<ResponseError, CustomerModel>> getCustomers(
      {required String phoneNumber}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.getCustomer}?phone_number=$phoneNumber",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => CustomerModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, ServiceListModel>> getServiceList(
      {required String query, required int nextPage}) {
    return service
        .safe(service.getRequest(
          endPoint:
              "${AppConstants.serviceList}?search=$query&page=$nextPage&page_size=10",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => ServiceListModel.fromJson(right));
  }

  @override
  Future<Either<ResponseError, ServiceDetailsModel>> getServiceDetails(
      {required String id}) {
    return service
        .safe(service.getRequest(
            endPoint: AppConstants.serviceDetails, parameters: {"id": id}))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => ServiceDetailsModel.fromJson(right));
  }
}
