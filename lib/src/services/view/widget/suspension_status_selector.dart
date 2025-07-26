import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/custom_dropdown_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/enums/enums.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';

class SuspensionStatusSelector extends StatefulWidget {
  final SuspensionSelection? selection;
  final String title;
  final Function(SuspensionSelection? selection)? onSelection;
  final TextEditingController? lifeController;
  final TextEditingController? remainingController;
  final TextEditingController? odoController;
  final Function(String data)? onLifeChanged;
  final Function(String data)? onRemainingChanged;

  const SuspensionStatusSelector({
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
  State<SuspensionStatusSelector> createState() =>
      _SuspensionStatusSelectorState();
}

class _SuspensionStatusSelectorState extends State<SuspensionStatusSelector> {
  List<String> items = [
    '5000',
    '10000',
    '15000',
    '20000',
    '25000',
    '30000',
    '35000',
    '40000',
    '45000',
    '50000',
    '60000',
    '70000',
    '80000',
    '90000',
  ];

  void _openBottomSheet(
    BuildContext context, {
    required String title,
    required int key,
  }) {
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
                  "Select $title (km)",
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
                        bool isSelected = key == 1
                            ? item == widget.lifeController?.text
                            : item == widget.remainingController?.text;
                        return InkWell(
                          onTap: () {
                            if (key == 1) {
                              widget.lifeController?.text = item;
                            } else {
                              widget.onRemainingChanged?.call(item);
                              widget.remainingController?.text = item;
                            }
                            newState(() {});
                            Future.delayed(Duration(milliseconds: 300), () {
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                          child: CustomDropdownItem(
                            isSelected: isSelected,
                            label: item,
                          ),
                        );
                      })
                    else
                      Center(
                        child: Text(
                          "No $title items Found",
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
            suffix: InkWell(
              onTap: () {
                _openBottomSheet(
                  context,
                  title: "Componet Life",
                  key: 1,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  Assets.svgIosArrowDown,
                ),
              ),
            ),
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
                      suffix: InkWell(
                        onTap: () {
                          _openBottomSheet(
                            context,
                            title: "Remaining Life",
                            key: 2,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            Assets.svgIosArrowDown,
                          ),
                        ),
                      ),
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
