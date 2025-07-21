import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

class GarageDetailsViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<GarageRepo>();

  bool isDeleting = false;

  Garages? garages;

  Future<bool?> getGarageDetails({required int id}) async {
    updateLoader(LoaderState.loading);
    return await repo.getGarageDetails(id: id).fold(
      (left) {
        updateLoader(LoaderState.error);
        return false;
      },
      (right) {
        final isSuccess = right?['status'] ?? false;
        final data = right?['results']?['data'];
        if (isSuccess) {
          garages = Garages.fromJson(data);
          updateLoader(LoaderState.loaded);
        } else {
          updateLoader(LoaderState.noData);
        }
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(LoaderState.error);
      return false;
    });
  }

  updateDeleteLoader(bool value) {
    isDeleting = value;
    notifyListeners();
  }

  Future<bool?> delete(int id) async {
    updateDeleteLoader(true);
    return await repo.deleteGarage(id: id).fold(
      (left) {
        updateDeleteLoader(false);
        return false;
      },
      (right) {
        updateDeleteLoader(false);
        return true;
      },
    ).catchError((e) {
      updateDeleteLoader(false);
      return false;
    });
  }

  @override
  updateLoader(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }
}

mixin Helper {
  LoaderState loaderState = LoaderState.loading;

  updateLoader(LoaderState state);
}
