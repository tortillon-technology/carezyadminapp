import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/enums/enums.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/helpers/text_input_formatters.dart';

class StatusSelector extends StatefulWidget {
  final Selection? selection;
  final String title;
  final Function(Selection? selection)? onSelection;
  final Function(String percentage)? onPercentageChange;
  final bool showPercentage;
  final bool showRemainingAndNextOdo;
  final bool showLife;
  final TextEditingController? percentageController;
  final TextEditingController? lifeController;
  final TextEditingController? remainingController;
  final TextEditingController? odoController;
  final Function(String data)? onLifeChanged;
  final Function(String data)? onRemainingChanged;

  const StatusSelector({
    super.key,
    this.selection,
    required this.title,
    this.onSelection,
    this.onPercentageChange,
    this.showPercentage = false,
    this.showRemainingAndNextOdo = true,
    this.showLife = true,
    this.percentageController,
    this.lifeController,
    this.remainingController,
    this.odoController,
    this.onLifeChanged,
    this.onRemainingChanged,
  });

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
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
            style:
                PlusJakartaFontPalette.f1C1C1C_14_600.copyWith(fontSize: 16.sp),
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildOption(
                  label: "Changed",
                  isSelected: Selection.changed == widget.selection,
                  onTap: () {
                    bool isTrue = Selection.changed == widget.selection;
                    if (isTrue) {
                      widget.onSelection?.call(null);
                    } else {
                      widget.onSelection?.call(Selection.changed);
                    }
                  },
                ),
              ),
              Expanded(
                child: _buildOption(
                  label: "Not changed",
                  isSelected: Selection.notChanged == widget.selection,
                  onTap: () {
                    bool isTrue = Selection.notChanged == widget.selection;
                    if (isTrue) {
                      widget.onSelection?.call(null);
                    } else {
                      widget.onSelection?.call(Selection.notChanged);
                    }
                  },
                ),
              ),
            ],
          ),
          if (widget.showPercentage) 16.verticalSpace,
          if (widget.showPercentage)
            Row(
              children: [
                SizedBox(
                    width: 120.w,
                    child: CommonTextFormFieldWithValidator(
                      height: 40.h,
                      hintText: "%",
                      inputType: TextInputType.number,
                      controller: widget.percentageController,
                      inputFormatters: [
                        RangeInputFormatter(),
                        TextInputFormats.digitsFormatter,
                      ],
                      contentPadding: EdgeInsets.zero,
                      textAlign: TextAlign.center,
                      style: PlusJakartaFontPalette.fBlack_12_400
                          .copyWith(fontWeight: FontWeight.w600),
                      hintFontStyle: PlusJakartaFontPalette.fBlack_12_400
                          .copyWith(color: HexColor("#6B6B6B")),
                      radius: 6.r,
                      width: 2.r,
                      cursorHeight: 12.h,
                      borderColor: HexColor("#6B6B6B"),
                      filledColor: Colors.white,
                      onChanged: widget.onPercentageChange,
                    )),
                16.horizontalSpace,
                Text(
                  "Percentage",
                  style: PlusJakartaFontPalette.fBlack_14_400,
                ),
              ],
            ),
          if (widget.showLife) 20.verticalSpace,
          if (widget.showLife)
            Text(
              "${widget.title} Life (km)",
              style: PlusJakartaFontPalette.f1C1C1C_14_600,
            ),
          if (widget.showLife) 16.verticalSpace,
          if (widget.showLife)
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
          if (widget.showRemainingAndNextOdo) 20.verticalSpace,
          if (widget.showRemainingAndNextOdo)
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
          10.horizontalSpace,
          Text(
            label,
            style: PlusJakartaFontPalette.fBlack_14_400,
          ),
        ],
      ),
    );
  }
}
