import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/customer/model/customer_list_model.dart';
import 'package:either_dart/either.dart';

import '../../../res/enums/enums.dart';
import '../../../utils/helpers/auto_dispose_view_model.dart';
import '../repo/customer_repo.dart';

class CustomerManageViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<CustomerRepo>();
  List<Customer> customerList = [];
  int nextPage = 1;
  int totalItems = 0;

  bool hasSearchQuery = false;

  check(String query) {
    hasSearchQuery = query.isNotEmpty;
    notifyListeners();
  }

  Future<bool?> getCustomerList({
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

    return await repo
        .getCustomerList(nextPage: nextPage, query: query ?? "")
        .fold(
      (left) {
        updateLoader(isLoad: SearchLoader.error);
        return false;
      },
      (right) {
        final temp = right.results?.data?.customers ?? [];
        if (isSearch && nextPage == 1 && temp.isEmpty) {
          updateLoader(isLoad: SearchLoader.noSearchData);
        } else if (!isSearch && temp.isEmpty && nextPage == 1) {
          updateLoader(isLoad: SearchLoader.noData);
        } else {
          totalItems = right.results?.data?.pagination?.totalItems ?? 0;
          customerList.addAll(temp);

          if (totalItems != customerList.length) {
            nextPage++;
          }
          updateLoader(isLoad: SearchLoader.loaded);
        }
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
    print(isLoad);
    print(isPaginate);
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
