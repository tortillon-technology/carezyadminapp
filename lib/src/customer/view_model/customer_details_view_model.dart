import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/customer/model/health_report_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../model/customer_details_model.dart';

class CustomerDetailsViewModel extends AutoDisposeViewModel {
  final repo = getIt.get<CustomerRepo>();
  LoaderState isLoading = LoaderState.loading;
  bool isReportLoading = false;
  CustomerDetails? customerDetails;

  List<Report> reportList = [];

  updateDetailsLoader(LoaderState value) {
    isLoading = value;
    notifyListeners();
  }

  updateReportLoader(bool value) {
    isReportLoading = value;
    notifyListeners();
  }

  Future<bool?> getCustomerDetails(int customerID) async {
    customerDetails = null;
    updateDetailsLoader(LoaderState.loading);
    return await repo.getCustomerDetails(customerID: customerID).fold(
      (left) {
        updateDetailsLoader(LoaderState.error);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        customerDetails = right.results?.data;
        if (isSuccess) {
          updateDetailsLoader(LoaderState.loaded);
        } else {
          updateDetailsLoader(LoaderState.error);
        }
        return isSuccess;
      },
    ).catchError((e) {
      updateDetailsLoader(LoaderState.error);
      return false;
    });
  }

  Future<bool?> getHealthReports(int customerID) async {
    reportList = [];
    updateReportLoader(true);
    return await repo.getHealthReport(customerID: customerID).fold(
      (left) {
        updateReportLoader(false);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        reportList.addAll(right.results?.data ?? []);
        updateReportLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateReportLoader(false);
      return false;
    });
  }

  bool isDeleting = false;

  updateDeleteLoader(bool value){
    isDeleting = value;
    notifyListeners();
  }

  Future<bool?> delete(int id) async {
    updateDeleteLoader(true);
    return await repo.deleteCustomer(customerID: id).fold(
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
}
