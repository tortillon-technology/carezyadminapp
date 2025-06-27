import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../model/customer_model.dart';

abstract class ServiceRepo {
  Future<Either<ResponseError, dynamic>> addService(
      {required Map<String, dynamic> params});
  Future<Either<ResponseError, CustomerModel>> getCustomers(
      {required String phoneNumber});
}
