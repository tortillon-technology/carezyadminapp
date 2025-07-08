import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../../res/styles/fonts/bai_font_palette.dart';
import '../helpers/common_functions.dart';
import '../helpers/hex_color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function()? onBackTap;
  final Color? backgroundColor;
  final Color? iconBgColor;
  final Color? iconColor;
  final SystemUiOverlayStyle? systemOverlay;
  final double? textSpace;

  const CommonAppBar({
    super.key,
    this.actions,
    this.onBackTap,
    this.backgroundColor,
    this.titleText,
    this.iconBgColor,
    this.iconColor,
    this.systemOverlay,
    this.textStyle,
    this.textSpace,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      systemOverlayStyle: systemOverlay ?? systemOverlayStyle,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 20.w,
      leading: SizedBox.shrink(),
      title: Row(
        children: [
          InkWell(
            onTap: onBackTap ??
                () {
                  Navigator.pop(context);
                },
            borderRadius: BorderRadius.circular(100.r),
            child: Ink(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBgColor ?? HexColor("#F5F5F5")),
              child: Center(
                child: SvgPicture.asset(
                  Assets.svgBackArrow,
                  colorFilter: ColorFilter.mode(
                      iconColor ?? Colors.black, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          (textSpace ?? 10).horizontalSpace,
          if (titleText != null)
            Text(
              titleText ?? "",
              style: textStyle ?? BaiFontPalette.fBlack_24_600,
            )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
