import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class TyrePressure extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const TyrePressure({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sw(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Consumer<AddServiceViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tyre Pressure",
                  style: PlusJakartaFontPalette.fBlack_16_600,
                )
              ],
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Front Right",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Pressure",
                        onChanged: (data) {
                          if (data.isEmpty) {
                            provider.frPressure = null;
                          } else {
                            provider.frPressure = data;
                          }
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                      ),
                      16.verticalSpace,
                      // Text(
                      //   "Remaining Front Right",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "Remaining",
                      //   controller:
                      //       provider.remainingTyrePressureFrontRightController,
                      //   inputAction: TextInputAction.next,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     if (data.isNotEmpty) {
                      //       provider.remainingTyrePressureFrontRight = data;
                      //       provider
                      //           .nextTyrePressureFrontRightChangeODOlController
                      //           .text = (int.parse(data) +
                      //               int.parse(
                      //                   provider.currentOodometerReading ??
                      //                       '0'))
                      //           .toString();
                      //     } else {
                      //       provider.remainingTyrePressureFrontRight = null;
                      //       provider
                      //           .nextTyrePressureFrontRightChangeODOlController
                      //           .clear();
                      //     }
                      //   },
                      // ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Next service on",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "ODO Reading",
                      //   controller: provider
                      //       .nextTyrePressureFrontRightChangeODOlController,
                      //   inputAction: TextInputAction.done,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     provider.nextTyrePressureFrontRightChangeODO = data;
                      //   },
                      // ),
                    ],
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Front Left",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Pressure",
                        onChanged: (data) {
                          if (data.isEmpty) {
                            provider.flPressure = null;
                          } else {
                            provider.flPressure = data;
                          }
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                      ),
                      16.verticalSpace,
                      // Text(
                      //   "Remaining Front Left",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "Remaining",
                      //   controller:
                      //       provider.remainingTyrePressureFrontLeftController,
                      //   inputAction: TextInputAction.next,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     if (data.isNotEmpty) {
                      //       provider.remainingTyrePressureFrontLeft = data;
                      //       provider
                      //           .nextTyrePressureFrontLeftChangeODOlController
                      //           .text = (int.parse(data) +
                      //               int.parse(
                      //                   provider.currentOodometerReading ??
                      //                       '0'))
                      //           .toString();
                      //     } else {
                      //       provider.remainingTyrePressureFrontLeft = null;
                      //       provider
                      //           .nextTyrePressureFrontLeftChangeODOlController
                      //           .clear();
                      //     }
                      //   },
                      // ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Next service on",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "ODO Reading",
                      //   controller: provider
                      //       .nextTyrePressureFrontLeftChangeODOlController,
                      //   inputAction: TextInputAction.done,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     provider.nextTyrePressureFrontLeftChangeODO = data;
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rear Right",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Pressure",
                        onChanged: (data) {
                          if (data.isEmpty) {
                            provider.rrPressure = null;
                          } else {
                            provider.rrPressure = data;
                          }
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                      ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Remaining Rear Right",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "Remaining",
                      //   controller:
                      //       provider.remainingTyrePressureRearRightController,
                      //   inputAction: TextInputAction.next,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     if (data.isNotEmpty) {
                      //       provider.remainingTyrePressureRearRight = data;
                      //       provider
                      //           .nextTyrePressureRearRightChangeODOlController
                      //           .text = (int.parse(data) +
                      //               int.parse(
                      //                   provider.currentOodometerReading ??
                      //                       '0'))
                      //           .toString();
                      //     } else {
                      //       provider.remainingTyrePressureRearRight = null;
                      //       provider
                      //           .nextTyrePressureRearRightChangeODOlController
                      //           .clear();
                      //     }
                      //   },
                      // ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Next service on",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "ODO Reading",
                      //   controller: provider
                      //       .nextTyrePressureRearRightChangeODOlController,
                      //   inputAction: TextInputAction.done,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     provider.nextTyrePressureRearRightChangeODO = data;
                      //   },
                      // ),
                    ],
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rear Left",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Pressure",
                        onChanged: (data) {
                          if (data.isEmpty) {
                            provider.rlPressure = null;
                          } else {
                            provider.rlPressure = data;
                          }
                        },
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                      ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Remaining Rear Left",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "Remaining",
                      //   controller:
                      //       provider.remainingTyrePressureRearLeftController,
                      //   inputAction: TextInputAction.next,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     if (data.isNotEmpty) {
                      //       provider.remainingTyrePressureRearLeft = data;
                      //       provider
                      //           .nextTyrePressureRearLeftChangeODOlController
                      //           .text = (int.parse(data) +
                      //               int.parse(
                      //                   provider.currentOodometerReading ??
                      //                       '0'))
                      //           .toString();
                      //     } else {
                      //       provider.remainingTyrePressureRearLeft = null;
                      //       provider
                      //           .nextTyrePressureRearLeftChangeODOlController
                      //           .clear();
                      //     }
                      //   },
                      // ),
                      // 16.verticalSpace,
                      // Text(
                      //   "Next service on",
                      //   style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      // ),
                      // 16.verticalSpace,
                      // CommonTextFormFieldWithValidator(
                      //   hintText: "ODO Reading",
                      //   controller: provider
                      //       .nextTyrePressureRearLeftChangeODOlController,
                      //   inputAction: TextInputAction.done,
                      //   inputType: TextInputType.number,
                      //   inputFormatters: [
                      //     TextInputFormats.digitsFormatter,
                      //   ],
                      //   onChanged: (data) {
                      //     provider.nextTyrePressureRearLeftChangeODO = data;
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
