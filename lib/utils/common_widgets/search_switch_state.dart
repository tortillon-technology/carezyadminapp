import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../res/enums/enums.dart';
import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_font_palette.dart';

class SearchSwitchState extends StatelessWidget {
  final SearchLoader loader;
  final Widget child;
  final String? error;

  const SearchSwitchState({
    super.key,
    required this.loader,
    required this.child,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return switch (loader) {
      SearchLoader.loading => SizedBox(
          width: context.sw(),
          height: context.sh(size: 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: ColorPalette.fEC0008,
              ),
            ],
          ),
        ),
      SearchLoader.loaded => child,
      SearchLoader.error => buildError(context, error: "Error"),
      SearchLoader.noSearchData => buildError(context, error: "No search data"),
      SearchLoader.noData => buildError(context, error: "No data found"),
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
