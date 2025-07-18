import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/customer/model/health_report_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../model/customer_details_model.dart';

class CustomerDetailsViewModel extends AutoDisposeViewModel {
  final repo = getIt.get<CustomerRepo>();
  bool isLoading = false;
  bool isReportLoading = false;
  CustomerDetails? customerDetails;

  List<Report> reportList = [];

  updateDetailsLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  updateReportLoader(bool value) {
    isReportLoading = value;
    notifyListeners();
  }

  Future<bool?> getCustomerDetails(int customerID) async {
    customerDetails = null;
    updateDetailsLoader(true);
    return await repo.getCustomerDetails(customerID: customerID).fold(
      (left) {
        updateDetailsLoader(false);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        customerDetails = right;
        updateDetailsLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateDetailsLoader(false);
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
}
