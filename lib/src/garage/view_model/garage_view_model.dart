import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/repo/garage_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

class GarageViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<GarageRepo>();
  List<Garages> customerList = [];
  int nextPage = 1;
  int totalItems = 0;

  bool hasSearchQuery = false;

  check(String query) {
    hasSearchQuery = query.isNotEmpty;
    notifyListeners();
  }

  Future<bool?> getGarages({
    String? query,
    bool isPaginating = false,
    bool isSearch = false,
  }) async {
    if (isSearch && !isPaginating) {
      customerList = [];
      totalItems = 0;
      nextPage = 1;
    }
    updateLoader(isLoad: SearchLoader.loading, isPaginate: isPaginating);

    return await repo.getGarages(nextPage: nextPage, query: query ?? "").fold(
      (left) {
        updateLoader(isLoad: SearchLoader.error);
        return false;
      },
      (right) {
        final temp = right.results?.data ?? [];
        // if (isSearch && nextPage == 1 && temp.isEmpty) {
        //   updateLoader(isLoad: SearchLoader.noSearchData);
        // } else if (!isSearch && temp.isEmpty && nextPage == 1) {
        //   updateLoader(isLoad: SearchLoader.noData);
        // } else {
        // totalItems = right.results?.?.totalItems ?? 0;
        customerList.addAll(temp);
        updateLoader(
            isLoad: (query ?? "").isNotEmpty && temp.isEmpty
                ? SearchLoader.noSearchData
                : temp.isEmpty
                    ? SearchLoader.noData
                    : SearchLoader.loaded);
        // if (totalItems != customerList.length) {
        //   nextPage++;
        // }
        //   updateLoader(isLoad: SearchLoader.loaded);
        // }
        final isSuccess = right.status ?? false;
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(isLoad: SearchLoader.error);
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
}

mixin Helper {
  SearchLoader isLoading = SearchLoader.loading;
  bool isPaginating = false;

  updateLoader({required SearchLoader isLoad, bool isPaginate});
}
