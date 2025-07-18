import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';

abstract class GarageRepo {
  Future<Either<ResponseError, GarageModel>> getGarages({
    required String query,
    required int nextPage,
  });
}
