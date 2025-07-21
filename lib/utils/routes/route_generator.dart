import 'package:carezyadminapp/src/customer/view/customer_details_screen.dart';
import 'package:carezyadminapp/src/garage/view/add_garage_screen.dart';
import 'package:carezyadminapp/src/garage/view/edit_garage_screen.dart';
import 'package:carezyadminapp/src/garage/view/garage_customer_details_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/create_vehicle_recovery_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/edit_recovery_vehicle_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/recovery_vehicle_screen.dart';
import 'package:carezyadminapp/src/services/view/service_history_details.dart';
import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/src/services/view_model/service_view_model.dart';
import 'package:carezyadminapp/src/settings/view/settings_screen.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/cupertino.dart';

import '../../src/auth/view/signin_screen.dart';
import '../../src/customer/view/add_customer_screen.dart';
import '../../src/customer/view/customer_management_screen.dart';
import '../../src/customer/view/edit_customer_detail_screen.dart';
import '../../src/garage/view/garage_details_screen.dart';
import '../../src/garage/view/garage_management_screen.dart';
import '../../src/home/view/home_screen.dart';
import '../../src/recovery_vehicle/view/recovery_vehicle_details_screen.dart';
import '../../src/services/view/add_service_screen.dart';
import '../../src/services/view/search_customer_screen.dart';
import '../../src/services/view/service_details_screen.dart';
import '../../src/services/view/service_records_screen.dart';
import '../../src/splash/view/splash_screen.dart';
import '../common_widgets/empty_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route generateRoute(
    RouteSettings settings,
  ) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.routeInitial:
        return _buildRoute(RouteConstants.routeInitial, const SplashScreen());
      case RouteConstants.routeSignInScreen:
        return _buildRoute(
            RouteConstants.routeSignInScreen, const SignInScreen());
      case RouteConstants.routeHomeScreen:
        return _buildRoute(RouteConstants.routeHomeScreen, const HomeScreen());
      //
      case RouteConstants.routeCustomerManagementScreen:
        return _buildRoute(RouteConstants.routeCustomerManagementScreen,
            const CustomerManagementScreen());
      case RouteConstants.routeAddCustomerScreen:
        return _buildRoute(
            RouteConstants.routeAddCustomerScreen,
            AddCustomerScreen(
              arguments: args as AddCustArguments?,
            ));

      case RouteConstants.routeGarageCustomerDetailsScreen:
        return _buildRoute(
            RouteConstants.routeGarageCustomerDetailsScreen,
            GarageCustomerDetailsScreen(
              arguments: args as GarageCustArguments,
            ));
      case RouteConstants.routeAddGarageScreen:
        return _buildRoute(
            RouteConstants.routeAddGarageScreen,
            AddGarageScreen(
              callback: args as Function()?,
            ));
      case RouteConstants.routeEditGarageScreen:
        return _buildRoute(
            RouteConstants.routeEditGarageScreen,
            EditGarageScreen(
              arguments: args as EditGarageArguments,
            ));
      //
      case RouteConstants.routeCustomerDetailsScreen:
        return _buildRoute(
            RouteConstants.routeCustomerDetailsScreen,
            CustomerDetailsScreen(
              arguments: args as CustDetailsArguments,
            ));
      //
      case RouteConstants.routeServiceRecordsScreen:
        return _buildRoute(RouteConstants.routeServiceRecordsScreen,
            const ServiceRecordsScreen());
      case RouteConstants.routeServiceDetailsScreen:
        return _buildRoute(
            RouteConstants.routeServiceDetailsScreen,
            ServiceDetailsScreen(
              viewModel: args as ServiceViewModel,
            ));
      case RouteConstants.routeAddServiceScreen:
        return _buildRoute(
            RouteConstants.routeAddServiceScreen, const AddServiceScreen());
      case RouteConstants.routeSearchCustomerScreen:
        return _buildRoute(
            RouteConstants.routeSearchCustomerScreen,
            SearchCustomerScreen(
              viewModel: args as AddServiceViewModel,
            ));

      case RouteConstants.routeServiceHistoryDetailsScreen:
        return _buildRoute(
            RouteConstants.routeServiceHistoryDetailsScreen,
            ServiceHistoryDetailsScreen(
              id: args as String,
            ));

      ///
      case RouteConstants.routeRecoveryVehicleScreen:
        return _buildRoute(RouteConstants.routeRecoveryVehicleScreen,
            const RecoveryVehicleScreen());
      case RouteConstants.routeRecoveryVehicleDetailsScreen:
        return _buildRoute(
            RouteConstants.routeRecoveryVehicleDetailsScreen,
            RecoveryVehicleDetailsScreen(
              arguments: args as RecoveryArguments,
            ));

      case RouteConstants.routeCreateVehicleRecoveryScreen:
        return _buildRoute(
            RouteConstants.routeCreateVehicleRecoveryScreen,
            CreateVehicleRecoveryScreen(
              arguments: args as CreateVehicleRecoveryArguments,
            ));
      case RouteConstants.routeEditRecoveryVehicleScreen:
        return _buildRoute(
            RouteConstants.routeEditRecoveryVehicleScreen,
            EditRecoveryVehicleScreen(
              arguments: args as EditRecoveryVehicleArguments,
            ));

      ///
      case RouteConstants.routeSettingsScreen:
        return _buildRoute(
            RouteConstants.routeSettingsScreen, const SettingsScreen());
      case RouteConstants.routeEditCustomerDetailsScreen:
        return _buildRoute(
            RouteConstants.routeEditCustomerDetailsScreen,
            EditCustomerDetailsScreen(
              arguments: args as EditCustArguments,
            ));
      //garage GarageManagementScreen
      case RouteConstants.routeGarageManagementScreen:
        return _buildRoute(RouteConstants.routeGarageManagementScreen,
            GarageManagementScreen());

      case RouteConstants.routeGarageDetailsScreen:
        return _buildRoute(
            RouteConstants.routeGarageDetailsScreen,
            GarageDetailsScreen(
              arguments: args as GarageArguments,
            ));
      default:
        return _buildRoute(RouteConstants.routeEmpty, const EmptyScreen());
    }
  }
}

Route _buildRoute(String route, Widget widget,
    {bool enableFullScreen = false}) {
  return CupertinoPageRoute(
      fullscreenDialog: enableFullScreen,
      settings: RouteSettings(name: route),
      builder: (_) => widget);
}
