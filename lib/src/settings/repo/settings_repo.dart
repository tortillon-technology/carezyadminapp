import 'package:either_dart/either.dart';

import '../../../data/remote/network_base_services.dart';

abstract class SettingsRepo {
  Future<Either<ResponseError, dynamic>> logout();
}