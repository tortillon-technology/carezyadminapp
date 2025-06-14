import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../res/styles/color_palette.dart';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

void afterInit(Function function) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    function.call();
  });
}

SystemUiOverlayStyle get systemOverlayStyle => Platform.isAndroid
    ? const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ColorPalette.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: ColorPalette.white,
        systemNavigationBarColor: ColorPalette.white)
    : const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark);
