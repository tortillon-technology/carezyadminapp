import 'package:carezyadminapp/data/local/shared_service.dart';
import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/constants/app_constants.dart';
import '../../../res/styles/color_palette.dart';
import '../../../utils/routes/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _pushToNextScreen();
    super.initState();
  }

  _pushToNextScreen() async {
    AppConstants.accessToken =
        await SharedService.instance.getData(key: accessTokenKey);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (AppConstants.accessToken.isNotEmpty) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteConstants.routeHomeScreen,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteConstants.routeSignInScreen,
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
            alignment: Alignment.center,
            children: [
              Positioned(
                  right: 58.w,
                  left: 57.w,
                  child: Image.asset(Assets.pngProCareSplashLogo).fadeIn())
            ],
          ),
        ),
      ),
    );
  }
}
