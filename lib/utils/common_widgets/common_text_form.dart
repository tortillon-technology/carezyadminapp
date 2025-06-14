



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/inter_font.dart';

class CommonTextFormFieldWithValidator extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool isObscure;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? hintFontStyle;
  final Function? onChanged;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool autoFocus;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final TextStyle? style;
  final TextInputType? inputType;
  final Function? onTap;
  final FocusNode? focusNode;
  final String? title;
  final TextInputAction? inputAction;
  final double? heightBetweenTitleAndTextField;
  final bool? isCollapsed;
  final Color? titleColor;
  final Color? filledColor;
  final double? height;
  final double? cursorHeight;
  final double? cursorWidth;
  final bool showBorder;
  final bool expands;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? titleStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final Widget? suffixStackWidget;
  final bool isLoading;
  final Widget? loadingWidget;
  final bool showObscureIcon;

  const CommonTextFormFieldWithValidator({
    super.key,
    this.hintText = '',
    this.prefix,
    this.validator,
    this.hintFontStyle,
    this.autoFocus = false,
    this.isObscure = false,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.contentPadding,
    this.readOnly = false,
    this.style,
    this.errorText,
    this.inputType,
    this.suffix,
    this.focusNode,
    this.onTap,
    this.title,
    this.inputAction,
    this.isCollapsed,
    this.heightBetweenTitleAndTextField,
    this.titleColor,
    this.filledColor,
    this.showBorder = true,
    this.expands = false,
    this.height,
    this.cursorHeight,
    this.cursorWidth,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.textAlign = TextAlign.start,
    this.titleStyle,
    this.suffixStackWidget,
    this.isLoading = false,
    this.showObscureIcon = true,
    this.loadingWidget,
  });

  @override
  State<CommonTextFormFieldWithValidator> createState() =>
      _CommonTextFormFieldWithValidatorState();
}

class _CommonTextFormFieldWithValidatorState
    extends State<CommonTextFormFieldWithValidator> {
  final ValueNotifier<bool> enableObscure = ValueNotifier<bool>(true);
  final ValueNotifier<bool?> isFocusNotifier = ValueNotifier<bool?>(null);

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    widget.focusNode?.dispose();
    isFocusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    isFocusNotifier.value = widget.focusNode?.hasFocus;
  }

  double _getDefaultContentPadding() {
    final scaledFontSize = MediaQuery.textScalerOf(context).scale(14.sp);
    if (scaledFontSize < 14) {
      return 16.5.h;
    } else if (scaledFontSize == 14 || scaledFontSize < 15) {
      return 22.h;
    } else {
      return 12.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    _getDefaultContentPadding();
    final outlinedErrorBorder = widget.showBorder
        ? OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.fDDE2E4, width: 1.r),
            borderRadius: BorderRadius.circular(8.r))
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide:  BorderSide(color: ColorPalette.
transparent));
    final outlinedBorder = widget.errorText != null
        ? outlinedErrorBorder
        : widget.showBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.fDDE2E4, width: 1.r),
                borderRadius: BorderRadius.circular(12.r))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: ColorPalette.transparent));
    final outlinedFocusedBorder = widget.errorText != null
        ? outlinedErrorBorder
        : widget.showBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.black, width: 1.r),
                borderRadius: BorderRadius.circular(12.r))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: ColorPalette.transparent));

    return ValueListenableBuilder<bool>(
        valueListenable: enableObscure,
        builder: (context, check, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.title != null && widget.title != '')
                ValueListenableBuilder<bool?>(
                    valueListenable: isFocusNotifier,
                    builder: (context, hasFocus, child) {
                      return Text(
                        widget.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: widget.titleStyle ??
                            InterFontPalette.fBlack_12_600
                                .copyWith(color: ColorPalette.black),
                      );
                    }),
              if (widget.title != null && widget.title != '')
                (widget.heightBetweenTitleAndTextField ?? 4).verticalSpace,
              Stack(
                children: [
                  SizedBox(
                    height: widget.height ??60.h,
                    child: TextFormField(
                      
                      readOnly: widget.readOnly,
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      obscuringCharacter: '•',
                      keyboardType: widget.inputType,
                      cursorWidth: widget.cursorWidth ?? 2.0,
                      cursorHeight: widget.cursorHeight,
                      textAlign: widget.textAlign,
                      textAlignVertical:
                          widget.textAlignVertical ?? TextAlignVertical.center,
                      expands: widget.expands,
                      onTap: widget.onTap != null
                          ? () {
                              widget.onTap!();
                            }
                          : null,
                      style: widget.style ?? InterFontPalette.fBlack_14_500,
                      onChanged: widget.onChanged != null
                          ? (val) => widget.onChanged!(val)
                          : null,
                      validator: widget.validator == null
                          ? (val) {
                              return null;
                            }
                          : (val) {
                              return widget.validator!(val);
                            },
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: widget.isObscure ? check : false,
                      inputFormatters: widget.inputFormatters,
                      maxLength: widget.maxLength,
                      minLines: widget.expands ? null : widget.minLines,
                      maxLines: widget.expands ? null : widget.maxLines,
                      autofocus: widget.autoFocus,
                      cursorColor: ColorPalette.black,
                      textInputAction: widget.inputAction,
decoration: InputDecoration(
                        prefixIcon: widget.prefixIcon,
                        border: outlinedBorder,
                        enabledBorder: outlinedBorder,
                        focusedBorder: outlinedFocusedBorder,
                        focusedErrorBorder: outlinedErrorBorder,
                        contentPadding: widget.contentPadding ??
                            EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: _getDefaultContentPadding()),
                        errorBorder: outlinedErrorBorder,
                        errorStyle: const TextStyle(),
                        hintText: widget.hintText,
                        hintStyle: widget.hintFontStyle ??
                            InterFontPalette.f616161_14_400,
                        filled: true,
                        fillColor: widget.filledColor ?? ColorPalette.fFAFAFA,
                        prefix: widget.prefix,
                        isDense: true,
                        isCollapsed: widget.isCollapsed ?? true,
                        prefixIconConstraints: widget.prefixIconConstraints,
                        suffixIcon: widget.isObscure
                            ? _obscureBtn(
                                showObscureIcon: widget.showObscureIcon)
                            : widget.suffix,
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.errorText != null) 3.verticalSpace,
              if (widget.errorText != null)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.errorText ?? "",
                        maxLines: 2,
                        style: InterFontPalette.fFF3B30_12_400,
                      ),
                    ),
                  ],
                ),
            ],
          );
        });
  }

  Widget? _obscureBtn({bool showObscureIcon = true}) {
    return showObscureIcon
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(6.w),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      enableObscure.value = !enableObscure.value;
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: Icon(
                        !enableObscure.value
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                        size: 21.w,
                        color: ColorPalette.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : null;
  }
}