import 'package:carezyadminapp/src/services/view/widget/suspension_status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';

class SuspensionSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const SuspensionSystem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    //SuspensionStatusSelector
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
                  "Suspension System",
                  style: PlusJakartaFontPalette.fBlack_16_600,
                )
              ],
            ),
            26.verticalSpace,

            SuspensionStatusSelector(
              title: "Front Left Lower Arm",
              selection: provider.flla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.flla = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Front Left Lower Arm",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingFrontLeftLowerArmController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingFrontLeftLowerArm = data;
                            provider.nextFrontLeftLowerArmChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingFrontLeftLowerArm = null;
                            provider.nextFrontLeftLowerArmChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextFrontLeftLowerArmChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextFrontLeftLowerArmChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Front Right Lower Arm",
              selection: provider.frla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.frla = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Front Right Lower Arm",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingFrontRightLowerArmController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingFrontRightLowerArm = data;
                            provider.nextFrontRightLowerArmChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingFrontRightLowerArm = null;
                            provider.nextFrontRightLowerArmChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextFrontRightLowerArmChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextFrontRightLowerArmChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Rear Left Lower Arm",
              selection: provider.rlla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rlla = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Rear Left Lower Arm",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingRearLeftLowerArmController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingRearLeftLowerArm = data;
                            provider.nextRearLeftLowerArmChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingRearLeftLowerArm = null;
                            provider.nextRearLeftLowerArmChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextRearLeftLowerArmChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextRearLeftLowerArmChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Rear Right Lower Arm",
              selection: provider.rrla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rrla = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Rear Right Lower Arm",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingRearRightLowerArmController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingRearRightLowerArm = data;
                            provider.nextRearRightLowerArmChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingRearRightLowerArm = null;
                            provider.nextRearRightLowerArmChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextRearRightLowerArmChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextRearRightLowerArmChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,

            ////
            SuspensionStatusSelector(
              title: "Upper Arm Front Left",
              selection: provider.uafl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafl = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Upper Arm Front Left",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,         
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingUpperArmFrontLeftController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingUpperArmFrontLeft = data;
                            provider.nextUpperArmFrontLeftChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingUpperArmFrontLeft = null;
                            provider.nextUpperArmFrontLeftChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextUpperArmFrontLeftChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextUpperArmFrontLeftChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Upper Arm Front Right",
              selection: provider.uafr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafr = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Upper Arm Front Right",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingUpperArmFrontRightController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingUpperArmFrontRight = data;
                            provider.nextUpperArmFrontRightChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingUpperArmFrontRight = null;
                            provider.nextUpperArmFrontRightChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextUpperArmFrontRightChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextUpperArmFrontRightChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Trailor Arm Rear",
              selection: provider.tar,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.tar = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Trailor Arm Rear",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller: provider.remainingTrailorArmRearController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingTrailorArmRear = data;
                            provider.nextTrailorArmRearChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingTrailorArmRear = null;
                            provider.nextTrailorArmRearChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextTrailorArmRearChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextTrailorArmRearChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Left Inner",
              selection: provider.abli,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abli = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Axle Boot Left Inner",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingAxleBootLeftInnerController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingAxleBootLeftInner = data;
                            provider.nextAxleBootLeftInnerChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingAxleBootLeftInner = null;
                            provider.nextAxleBootLeftInnerChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextAxleBootLeftInnerChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextAxleBootLeftInnerChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Right Inner",
              selection: provider.abri,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abri = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Axle Boot Right Inner",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingAxleBootRightInnerController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingAxleBootRightInner = data;
                            provider.nextAxleBootRightInnerChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingAxleBootRightInner = null;
                            provider.nextAxleBootRightInnerChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextAxleBootRightInnerChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextAxleBootRightInnerChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Right Outer",
              selection: provider.abro,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abro = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Axle Boot Right Outer",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingAxleBootRightOuterController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingAxleBootRightOuter = data;
                            provider.nextAxleBootRightOuterChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingAxleBootRightOuter = null;
                            provider.nextAxleBootRightOuterChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextAxleBootRightOuterChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextAxleBootRightOuterChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Left Outer",
              selection: provider.ablo,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.ablo = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Axle Boot Left Outer",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingAxleBootLeftOuterController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingAxleBootLeftOuter = data;
                            provider.nextAxleBootLeftOuterChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingAxleBootLeftOuter = null;
                            provider.nextAxleBootLeftOuterChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextAxleBootLeftOuterChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextAxleBootLeftOuterChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Front Left",
              selection: provider.lrfl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfl = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Link Rod Front Left",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingLinkRodFrontLeftController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingLinkRodFrontLeft = data;
                            provider.nextLinkRodFrontLeftChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingLinkRodFrontLeft = null;
                            provider.nextLinkRodFrontLeftChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextLinkRodFrontLeftChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextLinkRodFrontLeftChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Front Right",
              selection: provider.lrfr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfr = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Link Rod Front Right",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingLinkRodFrontRightController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingLinkRodFrontRight = data;
                            provider.nextLinkRodFrontRightChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingLinkRodFrontRight = null;
                            provider.nextLinkRodFrontRightChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextLinkRodFrontRightChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextLinkRodFrontRightChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Rear Left",
              selection: provider.lrrl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrl = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Link Rod Rear Left",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller: provider.remainingLinkRodRearLeftController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingLinkRodRearLeft = data;
                            provider.nextLinkRodRearLeftChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingLinkRodRearLeft = null;
                            provider.nextLinkRodRearLeftChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextLinkRodRearLeftChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextLinkRodRearLeftChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Rear Right",
              selection: provider.lrrr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrr = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Link Rod Rear Right",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingLinkRodRearRightController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingLinkRodRearRight = data;
                            provider.nextLinkRodRearRightChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingLinkRodRearRight = null;
                            provider.nextLinkRodRearRightChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextLinkRodRearRightChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextLinkRodRearRightChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Balance Rod Bush Front",
              selection: provider.brbf,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbf = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Balance Rod Bush Front",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingBalanceRodBushFrontController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingBalanceRodBushFront = data;
                            provider.nextBalanceRodBushFrontChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingBalanceRodBushFront = null;
                            provider.nextBalanceRodBushFrontChangeODOlController
                                .clear();
                          }
                        },
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
                        controller: provider
                            .nextBalanceRodBushFrontChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextBalanceRodBushFrontChangeODO = data;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Balance Rod Bush Rear",
              selection: provider.brbr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbr = s;
                });
              },
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining Balance Rod Bush Rear",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Remaining",
                        controller:
                            provider.remainingBalanceRodBushRearController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          if (data.isNotEmpty) {
                            provider.remainingBalanceRodBushRear = data;
                            provider.nextBalanceRodBushRearChangeODOlController
                                .text = (int.parse(data) +
                                    int.parse(
                                        provider.currentOodometerReading ??
                                            '0'))
                                .toString();
                          } else {
                            provider.remainingBalanceRodBushRear = null;
                            provider.nextBalanceRodBushRearChangeODOlController
                                .clear();
                          }
                        },
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
                        controller:
                            provider.nextBalanceRodBushRearChangeODOlController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.nextBalanceRodBushRearChangeODO = data;
                        },
                      ),
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
