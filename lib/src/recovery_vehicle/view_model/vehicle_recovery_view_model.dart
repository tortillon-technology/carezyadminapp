import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/src/recovery_vehicle/repo/vehicle_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../../../services/get_it.dart';
import '../model/vehicle_recovery_details_model.dart';
import '../model/vehicle_recovery_model.dart';

class VehicleRecoveryViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<VehicleRepo>();

  List<Recovery> vehiclesList = [];
  VehicleRecoveryDetails? details;

  Future<bool?> getVehiclesList() async {
    vehiclesList = [];
    updateLoader(LoaderState.loading);
    return await repo.getVehicleLists().fold(
      (left) {
        updateLoader(LoaderState.error);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        final temp = right.results?.data ?? [];
        if (temp.isNotEmpty) {
          vehiclesList.addAll(temp);
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

  Future<bool?> getVehicleRecoveryDetails(int id) async {
    details = null;
    updateDetailsLoader(LoaderState.loading);
    return await repo.getVehicleRecoveryDetails(id: id).fold(
      (left) {
        updateDetailsLoader(LoaderState.error);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        details = right;
        updateDetailsLoader(LoaderState.loaded);
        return isSuccess;
      },
    ).catchError((e) {
      updateDetailsLoader(LoaderState.error);
      return false;
    });
  }

  Future<bool?> delete(int id) async {
    updateDeleteLoader(true);
    return await repo.deleteRecovery(id: id).fold(
      (left) {
        updateDeleteLoader(false);
        return false;
      },
      (right) {
        final isSuccess = right?["status"] ?? false;
        updateDeleteLoader(false);
        return isSuccess;
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

  @override
  updateDetailsLoader(LoaderState state) {
    detailsLoader = state;
    notifyListeners();
  }

  @override
  updateDeleteLoader(bool value) {
    isDeleting = value;
    notifyListeners();
  }
}

mixin Helper {
  LoaderState loaderState = LoaderState.initial;
  LoaderState detailsLoader = LoaderState.initial;
  bool isDeleting = false;
  updateLoader(LoaderState state);
  updateDetailsLoader(LoaderState state);

  updateDeleteLoader(bool value);
}
