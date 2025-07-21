import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../../../services/get_it.dart';
import '../model/service_history_model.dart';
import '../repo/service_repo.dart';

class ServiceHistoryViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<ServiceRepo>();

  List<ServiceHistory> serviceLists = [];

  Future<bool?> getServiceDetails(String customerId) async {
    serviceLists = [];
    updateLoader(LoaderState.loading);
    return await repo.getServiceHitsory(customerId: customerId).fold(
      (left) {
        updateLoader(LoaderState.error);
        return false;
      },
      (right) {
        final list = right.results?.data?.serviceHistory ?? [];
        serviceLists.addAll(list);
        if (list.isNotEmpty) {
          updateLoader(LoaderState.loaded);
        } else {
          updateLoader(LoaderState.noData);
        }
        return true;
      },
    ).catchError((e) {
      updateLoader(LoaderState.error);
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
