import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/enums/enums.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';

class LightStatusSelector extends StatefulWidget {
  final LightSelection? selection;
  final String title;
  final Function(LightSelection? selection)? onSelection;
    final TextEditingController? lifeController;
  final TextEditingController? remainingController;
  final TextEditingController? odoController;
  final Function(String data)? onLifeChanged;
  final Function(String data)? onRemainingChanged;

  const LightStatusSelector({
    super.key,
    this.selection,
    required this.title,
    this.onSelection,
    this.lifeController,
    this.remainingController,
    this.odoController,
    this.onLifeChanged,
    this.onRemainingChanged,
  });

  @override
  State<LightStatusSelector> createState() => _LightStatusSelectorState();
}

class _LightStatusSelectorState extends State<LightStatusSelector> {
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
          12.verticalSpace,
          _buildOption(
            label: "Changed",
            isSelected: LightSelection.changed == widget.selection,
            onTap: () {
              bool isTrue = LightSelection.changed == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(LightSelection.changed);
              }
            },
          ),
          14.verticalSpace,
          _buildOption(
            label: "Not changed",
            isSelected: LightSelection.notChanged == widget.selection,
            onTap: () {
              bool isTrue = LightSelection.notChanged == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(LightSelection.notChanged);
              }
            },
          ),
          14.verticalSpace,
          _buildOption(
            label: "Lamp Replace",
            isSelected: LightSelection.lampReplace == widget.selection,
            onTap: () {
              bool isTrue = LightSelection.lampReplace == widget.selection;
              if (isTrue) {
                widget.onSelection?.call(null);
              } else {
                widget.onSelection?.call(LightSelection.lampReplace);
              }
            },
          ),
              20.verticalSpace,
          Text(
            "${widget.title} Life (km)",
            style: PlusJakartaFontPalette.f1C1C1C_14_600,
          ),
          16.verticalSpace,
          CommonTextFormFieldWithValidator(
            hintText: "Enter life (km)",
            controller: widget.lifeController,
            inputAction: TextInputAction.next,
            inputType: TextInputType.number,
            inputFormatters: [
              TextInputFormats.digitsFormatter,
            ],
            onChanged: widget.onLifeChanged,
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Remaining Life (km)",
                      style: PlusJakartaFontPalette.f1C1C1C_14_600,
                    ),
                    16.verticalSpace,
                    CommonTextFormFieldWithValidator(
                      hintText: "Remaining",
                      controller: widget.remainingController,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.number,
                      inputFormatters: [
                        TextInputFormats.digitsFormatter,
                      ],
                      onChanged: widget.onRemainingChanged,
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next service on",
                      style: PlusJakartaFontPalette.f1C1C1C_14_600,
                    ),
                    16.verticalSpace,
                    CommonTextFormFieldWithValidator(
                      hintText: "ODO Reading",
                      controller: widget.odoController,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.number,
                      inputFormatters: [
                        TextInputFormats.digitsFormatter,
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
