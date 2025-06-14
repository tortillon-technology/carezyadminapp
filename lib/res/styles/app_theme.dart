import 'dart:io';

import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTheme {
  static ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: materialPrimary,
      highlightColor: Colors.white.withOpacity(.03),
      splashColor: Colors.white.withOpacity(.06),
      fontFamily: null, //TODO add font
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primaryColor),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(
            allowEnterRouteSnapshotting: false,
          ),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(
            allowEnterRouteSnapshotting: false,
          ),
        },
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: null, //TODO  add font
          systemOverlayStyle: Platform.isIOS
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          iconTheme: const IconThemeData(color: Colors.white)),
      brightness: Brightness.light,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black));

  static Color get barrierColor => Colors.black.withOpacity(.50);

  static const MaterialColor materialPrimary = MaterialColor(
    0XFF6E1746,
    <int, Color>{
      50: ColorPalette.primaryColor,
      100: ColorPalette.primaryColor,
      200: ColorPalette.primaryColor,
      300: ColorPalette.primaryColor,
      400: ColorPalette.primaryColor,
      500: ColorPalette.primaryColor,
      600: ColorPalette.primaryColor,
      700: ColorPalette.primaryColor,
      800: ColorPalette.primaryColor,
      900: ColorPalette.primaryColor,
    },
  );
}
