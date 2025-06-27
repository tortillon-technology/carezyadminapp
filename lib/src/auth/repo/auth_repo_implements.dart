import 'package:carezyadminapp/res/constants/app_constants.dart';
import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/auth/repo/auth_repo.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../model/auth_response_model.dart';

class AuthRepoImplements extends AuthRepo {
  @override
  Future<Either<ResponseError, AuthResponseModel>> signIn({
    required Map<String, dynamic> params,
  }) {
    final service = getIt.get<NetWorkBaseServices>();
    return service
        .safe(service.postRequest(
          endPoint: AppConstants.signIn,
          parameters: params,
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => AuthResponseModel.fromJson(right));
  }
}
