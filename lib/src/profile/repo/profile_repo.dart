import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';
import '../../../res/constants/app_constants.dart';
import '../../../services/get_it.dart';
import '../model/garage_details_model.dart';

abstract class ProfileRepo {
  Future<Either<ResponseError, GarageDetails>> getGarageDetails({
    required String garageId,
  });
}

class ProfileRepoImplements extends ProfileRepo {
  final service = getIt.get<NetWorkBaseServices>();
  @override
  Future<Either<ResponseError, GarageDetails>> getGarageDetails(
      {required String garageId}) {
    return service
        .safe(service.getRequest(
          endPoint: "${AppConstants.garageDetails}/$garageId",
        ))
        .thenRight(service.checkHttpStatus)
        .thenRight(service.parseJson)
        .mapRight((right) => GarageDetails.fromJson(right));
  }
}
