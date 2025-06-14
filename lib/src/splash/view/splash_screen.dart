import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/local/local_base_services.dart';
import '../../../res/constants/app_constants.dart';
import '../../../res/styles/color_palette.dart';
import '../../../services/get_it.dart';
import '../../../utils/routes/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final localData = getIt.get<LocalBaseServices>();

  @override
  void initState() {
    _pushToNextScreen();
    super.initState();
  }

  _pushToNextScreen() async {
    localData.getUserData();
    // SembastServices.instance.getUserData();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (AppConstants.accessToken.isNotEmpty) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteConstants.routeMainScreen,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteConstants.routeEmpty,
            (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: ColorPalette.primaryColor,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: ColorPalette.primaryColor,
          systemNavigationBarColor: ColorPalette.primaryColor),
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SizedBox(
          width: context.sw(),
          height: context.sh(),
          child: Stack(
            children: [
              Align(alignment: Alignment.center, child: Icon(Icons.image))
            ],
          ),
        ),
      ),
    );
  }
}
