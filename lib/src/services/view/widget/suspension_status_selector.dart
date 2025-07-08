import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/enums/enums.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';

class SuspensionStatusSelector extends StatefulWidget {
  final SuspensionSelection? selection;
  final String title;
  final Function(SuspensionSelection? selection)? onSelection;

  const SuspensionStatusSelector({
    super.key,
    this.selection,
    required this.title,
    this.onSelection,
  });

  @override
  State<SuspensionStatusSelector> createState() =>
      _SuspensionStatusSelectorState();
}

class _SuspensionStatusSelectorState extends State<SuspensionStatusSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: PlusJakartaFontPalette.f1C1C1C_14_600,
          ),
          16.verticalSpace,
          _buildOption(
            label: "Changed",
            isSelected: SuspensionSelection.changed == widget.selection,
            onTap: () {
              bool isTrue = SuspensionSelection.changed == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(SuspensionSelection.changed);
              }
            },
          ),
          14.verticalSpace,
          _buildOption(
            label: "Not changed",
            isSelected: SuspensionSelection.notChanged == widget.selection,
            onTap: () {
              bool isTrue = SuspensionSelection.notChanged == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(SuspensionSelection.notChanged);
              }
            },
          ),
          14.verticalSpace,
          _buildOption(
            label: "Bush",
            isSelected: SuspensionSelection.bush == widget.selection,
            onTap: () {
              bool isTrue = SuspensionSelection.bush == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(SuspensionSelection.bush);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AnimatedContainer(
            width: 24.w,
            height: 24.h,
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color:
                  isSelected ? ColorPalette.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: isSelected
                      ? ColorPalette.primaryColor
                      : HexColor("#6B6B6B"),
                  width: 2.r),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              label,
              style: PlusJakartaFontPalette.fBlack_14_400,
            ),
          ),
        ],
      ),
    );
  }
}
