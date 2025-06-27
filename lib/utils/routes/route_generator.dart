import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/cupertino.dart';

import '../../src/auth/view/signin_screen.dart';
import '../../src/customer/view/add_customer_screen.dart';
import '../../src/home/view/home_screen.dart';
import '../../src/services/view/add_service_screen.dart';
import '../../src/services/view/search_customer_screen.dart';
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
      case RouteConstants.routeAddCustomerScreen:
        return _buildRoute(
            RouteConstants.routeAddCustomerScreen, const AddCustomerScreen());
      case RouteConstants.routeServiceRecordsScreen:
        return _buildRoute(RouteConstants.routeServiceRecordsScreen,
            const ServiceRecordsScreen());
      case RouteConstants.routeAddServiceScreen:
        return _buildRoute(
            RouteConstants.routeAddServiceScreen, const AddServiceScreen());
      case RouteConstants.routeSearchCustomerScreen:
        return _buildRoute(
            RouteConstants.routeSearchCustomerScreen,
            SearchCustomerScreen(
              viewModel: args as AddServiceViewModel,
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
