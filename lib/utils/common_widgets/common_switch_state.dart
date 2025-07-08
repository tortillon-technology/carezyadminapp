import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../res/enums/enums.dart';
import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_font_palette.dart';

class CommonSwitchState extends StatelessWidget {
  final LoaderState loader;
  final Widget child;
  final String? error;

  const CommonSwitchState({
    super.key,
    required this.loader,
    required this.child,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return switch (loader) {
      LoaderState.loading || LoaderState.initial => const Center(
            child: CircularProgressIndicator(
          color: ColorPalette.fEC0008,
        )),
      LoaderState.loaded => child,
      LoaderState.error => buildError(context, error: "Error"),
      LoaderState.networkError => buildError(context, error: "Network Error"),
      LoaderState.noData => buildError(context, error: "No data found"),
      LoaderState.hasData => child,
      LoaderState.serverError => buildError(context, error: "Server Error"),
    };
  }

  Widget buildError(BuildContext context, {String? error}) {
    return SizedBox(
      height: context.sh(size: .7),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            error ?? "Error",
            style: PlusJakartaFontPalette.fBlack_14_400,
          )),
        ],
      ),
    );
  }
}
