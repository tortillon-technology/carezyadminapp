import 'package:carezyadminapp/data/local/shared_service.dart';
import 'package:carezyadminapp/src/profile/repo/profile_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../../../services/get_it.dart';

class ProfileViewModel extends AutoDisposeViewModel {
  final repo = getIt.get<ProfileRepo>();
  Future<bool?> getGarageDetail() async {
    String? id = await SharedService.instance.getData(key: garageId);

    return await repo.getGarageDetails(garageId: id).fold(
      (left) {
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        return isSuccess;
      },
    ).catchError((e) {
      return false;
    });
  }
}
