import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../../res/styles/fonts/plus_jakarta_font_palette.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSelected;
  final String? selectedLabel;
  final String? errorText;
  final String? title;
  final bool isLoading;

  const CustomDropdown(
      {super.key,
      required this.items,
      required this.itemBuilder,
      required this.onSelected,
      this.selectedLabel,
      this.errorText,
        this.isLoading = false,
      this.title});

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => StatefulBuilder(builder: (context, newState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.verticalSpace,
            Row(
              children: [
                16.horizontalSpace,
                Text(
                  "Select ${title ?? ""}",
                  style: PlusJakartaFontPalette.fBlack_12_600
                      .copyWith(fontSize: 18.sp),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(100.r),
                  child: Ink(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ),
                16.horizontalSpace,
              ],
            ),
            24.verticalSpace,
            Container(
              constraints: BoxConstraints(
                  maxHeight: items.length >= 8
                      ? context.sh(size: 0.8)
                      : context.sh(size: 0.4),
                  minHeight: context.sh(size: 0.4)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (items.isNotEmpty)
                      ...List.generate(items.length, (index) {
                        final item = items[index];
                        return InkWell(
                          onTap: () {
                            onSelected(item);
                            newState(() {});
                            Future.delayed(Duration(milliseconds: 300), () {
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                          child: itemBuilder(context, item),
                        );
                      })
                    else
                      Center(
                        child: Text(
                          "No ${title ?? "items"} Found",
                          style: PlusJakartaFontPalette.f616161_14_400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            32.verticalSpace
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool selected = (selectedLabel ?? "").isNotEmpty;
    bool hasError = errorText != null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _openBottomSheet(context),
          child: Container(
            height: 60.h,
            width: context.sw(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: HexColor('#FAFAFA'),
                border: Border.all(
                  color: hasError ? HexColor("FF3B30") : HexColor('#E8E8E8'),
                )),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  selectedLabel ?? "Select garage name",
                  style: selected
                      ? PlusJakartaFontPalette.fBlack_14_600
                      : PlusJakartaFontPalette.f616161_14_400,
                )),
                SvgPicture.asset(
                  Assets.svgIosArrowDown,
                  width: 24.w,
                )
              ],
            ),
          ),
        ),
        if (hasError) 3.verticalSpace,
        if (hasError)
          Row(
            children: [
              Expanded(
                child: Text(
                  errorText ?? "",
                  maxLines: 2,
                  style: PlusJakartaFontPalette.fBlack_12_400
                      .copyWith(color: HexColor("FF3B30")),
                ),
              ),
            ],
          ),
        if (isLoading) 3.verticalSpace,
        if (isLoading)
          LinearProgressIndicator(
            color: ColorPalette.primaryColor,
          ),
      ],
    );
  }
}

class CustomDropdownItem extends StatelessWidget {
  final String? label;
  final bool isSelected;

  const CustomDropdownItem({super.key, this.isSelected = false, this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: context.sw(),
      child: Row(
        children: [
          16.horizontalSpace,
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color:
                  isSelected ? ColorPalette.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: isSelected
                  ? null
                  : Border.all(color: HexColor("#6B6B6B"), width: 2.r),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          16.horizontalSpace,
          Text(
            label ?? "",
            style: PlusJakartaFontPalette.fBlack_14_600,
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
