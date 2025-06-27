import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../model/auth_response_model.dart';

abstract class AuthRepo {
  Future<Either<ResponseError, AuthResponseModel>> signIn(
      {required Map<String, dynamic> params});
}
