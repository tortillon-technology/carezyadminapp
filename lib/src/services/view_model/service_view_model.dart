import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/services/repo/service_repo.dart';
import 'package:either_dart/either.dart';

import '../../../res/enums/enums.dart';
import '../../../utils/helpers/auto_dispose_view_model.dart';
import '../model/service_details_model.dart';
import '../model/service_list_model.dart';

class ServiceViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<ServiceRepo>();

  ServiceDetailsModel? serviceDetails;

  List<Service> serviceList = [];
  int nextPage = 1;
  int totalItems = 0;

  String id = '';

  bool hasSearchQuery = false;

  check(String query) {
    hasSearchQuery = query.isNotEmpty;
    notifyListeners();
  }

  Future<bool?> getServiceList({
    String? query,
    bool isPaginating = false,
    bool isSearch = false,
  }) async {
    if (!isPaginating) {
      serviceList = [];
      totalItems = 0;
      nextPage = 1;
    }
    updateLoader(isLoad: SearchLoader.loading, isPaginate: isPaginating);

    return await repo
        .getServiceList(nextPage: nextPage, query: query ?? "")
        .fold(
      (left) {
        updateLoader(isLoad: SearchLoader.error);
        return false;
      },
      (right) {
        final temp = right.data?.services ?? [];
        if (isSearch && nextPage == 1 && temp.isEmpty) {
          updateLoader(isLoad: SearchLoader.noSearchData);
        } else if (!isSearch && temp.isEmpty && nextPage == 1) {
          updateLoader(isLoad: SearchLoader.noData);
        } else {
          totalItems = right.data?.pagination?.totalCount ?? 0;
          serviceList.addAll(temp);

          if (totalItems != serviceList.length) {
            nextPage++;
          }
          updateLoader(isLoad: SearchLoader.loaded);
        }
        final isSuccess = right.success ?? false;
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(isLoad: SearchLoader.error);
      return false;
    });
  }

  Future<bool?> getServiceDetails() async {
    serviceDetails = null;
    updateServiceDetailsLoader(LoaderState.loading);
    return await repo.getServiceDetails(id: id).fold(
      (left) {
        updateServiceDetailsLoader(LoaderState.error);
        return false;
      },
      (right) {
        serviceDetails = right;
        updateServiceDetailsLoader(LoaderState.loaded);
        return true;
      },
    ).catchError((e) {
      updateServiceDetailsLoader(LoaderState.error);
      return false;
    });
  }

  @override
  updateLoader({required SearchLoader isLoad, bool isPaginate = false}) {
    isPaginating = isPaginate;
    if (isPaginating) {
      notifyListeners();
      return;
    } else {
      isLoading = isLoad;
    }
    notifyListeners();
  }

  @override
  updateServiceDetailsLoader(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }
}

mixin Helper {
  SearchLoader isLoading = SearchLoader.loading;
  LoaderState loaderState = LoaderState.loading;
  bool isPaginating = false;

  updateLoader({required SearchLoader isLoad, bool isPaginate});

  updateServiceDetailsLoader(LoaderState state);
}
