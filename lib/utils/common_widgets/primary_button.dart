import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/styles/color_palette.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isOutlined;

  final Widget? icon;
  final Widget? loader;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double? elevation;

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutlined = false,
    this.icon,
    this.loader,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.borderWidth,
    this.elevation = 0.0,
    this.textStyle,
    this.highlightColor,
    this.splashColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final bool disabled =
        widget.isDisabled || widget.isLoading || widget.onPressed == null;

    final Widget child = widget.isLoading
        ? widget.loader ??
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2.0,
                backgroundColor: Colors.white,
              ),
            )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                widget.icon!,
                SizedBox(width: 8.w),
              ],
              Text(widget.text,
                  style: widget.textStyle ??
                      BaiFontPalette.fWhite_16_600.copyWith(
                          color: widget.textColor ?? ColorPalette.white)),
            ],
          );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
      child: InkWell(
        splashColor: widget.splashColor ??
            Colors.white.mimicOpacityColor(0.2), // Better ripple effect
        highlightColor: widget.highlightColor ??
            Colors.white.mimicOpacityColor(0.1), // On press hold
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
        onTap: disabled ? null : widget.onPressed,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: disabled ? 0.6 : 1.0,
          child: Ink(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 60.h,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
              color: widget.onPressed == null
                  ? ColorPalette.fDDE2E4
                  : widget.backgroundColor ?? ColorPalette.fEC1C24,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              border: widget.isOutlined
                  ? Border.all(
                      color: widget.borderColor ?? ColorPalette.white,
                      width: widget.borderWidth ?? 1.5.w,
                    )
                  : null,
              boxShadow: (widget.elevation ?? 0) > 0
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: widget.elevation ?? 0,
                        offset: Offset(0, widget.elevation ?? 0 / 2),
                      ),
                    ]
                  : [],
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
