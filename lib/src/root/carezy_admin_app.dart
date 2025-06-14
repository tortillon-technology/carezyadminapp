import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../res/styles/app_theme.dart';
import '../../utils/helpers/multi_provider.dart';
import '../../utils/routes/route_constants.dart';
import '../../utils/routes/route_generator.dart';

class CarezyAdminApp extends StatelessWidget {
  const CarezyAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MultiProvider(
        providers: MultiProviderClass.providerLists,
        child: MaterialApp(
          title: 'CAREZY ADMIN APP',
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery.withClampedTextScaling(
              minScaleFactor: 0.75,
              maxScaleFactor: 1.4,
              child: child ?? const SizedBox(),
            );
          },
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: RouteConstants.routeInitial,
          theme: AppTheme.themeData,
        ),
      ),
    );
  }
}
