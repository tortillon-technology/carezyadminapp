import 'package:carezyadminapp/data/remote/network_base_services.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
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
}
