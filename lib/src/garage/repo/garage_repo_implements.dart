import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../../res/constants/app_constants.dart';

class GarageRepoImplements extends GarageRepo {
  final service = getIt.get<NetWorkBaseServices>();

  @override
  Future<Either<ResponseError, GarageModel>> getGarages(
      {required String query, required int nextPage}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.garages}?search=$query",
          // endPoint:
          //     "${AppConstants.garages}?q=$query&page=$nextPage&page_size=10",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => GarageModel.fromJson(right));
  }
}
