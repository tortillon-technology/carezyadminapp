import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class BreakSystem extends StatefulWidget {
  final AddServiceViewModel viewModel;

  const BreakSystem({super.key, required this.viewModel});

  @override
  State<BreakSystem> createState() => _BreakSystemState();
}

class _BreakSystemState extends State<BreakSystem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: Container(
        width: context.sw(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        child:
            Consumer<AddServiceViewModel>(builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Break System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Front Left Break Disc",
                showPercentage: true,
                selection: provider.flBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.flBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.flbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Front Left Break Disc",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller:
              //                 provider.remainingFrontLeftBreakDiscController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingFrontLeftBreakDisc = data;
              //                 provider
              //                     .nextFrontLeftBreakDiscChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingFrontLeftBreakDisc = null;
              //                 provider
              //                     .nextFrontLeftBreakDiscChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller: provider
              //                 .nextFrontLeftBreakDiscChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextFrontLeftBreakDiscChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Front Right Break Disc",
                showPercentage: true,
                selection: provider.frBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.frBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.frbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Front Right Break Disc",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller:
              //                 provider.remainingFrontRightBreakDiscController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingFrontRightBreakDisc = data;
              //                 provider
              //                     .nextFrontRightBreakDiscChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingFrontRightBreakDisc = null;
              //                 provider
              //                     .nextFrontRightBreakDiscChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller: provider
              //                 .nextFrontRightBreakDiscChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextFrontRightBreakDiscChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Rear Left Break Disc",
                showPercentage: true,
                selection: provider.rlBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rlBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rlbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Rear Left Break Disc",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller:
              //                 provider.remainingRearLeftBreakDiscController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingRearLeftBreakDisc = data;
              //                 provider.nextRearLeftBreakDiscChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingRearLeftBreakDisc = null;
              //                 provider.nextRearLeftBreakDiscChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller: provider
              //                 .nextRearLeftBreakDiscChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextRearLeftBreakDiscChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Rear Right Break Disc",
                showPercentage: true,
                selection: provider.rrBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rrBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rrbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Rear Right Break Disc",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller:
              //                 provider.remainingRearRightBreakDiscController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingRearRightBreakDisc = data;
              //                 provider
              //                     .nextRearRightBreakDiscChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingRearRightBreakDisc = null;
              //                 provider
              //                     .nextRearRightBreakDiscChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller: provider
              //                 .nextRearRightBreakDiscChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextRearRightBreakDiscChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Front Break Pad",
                showPercentage: true,
                selection: provider.fbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fbPad = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.fbPadPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Front Break Pad",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller: provider.remainingFrontBreakPadController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingFrontBreakPad = data;
              //                 provider.nextFrontBreakPadChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingFrontBreakPad = null;
              //                 provider.nextFrontBreakPadChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller:
              //                 provider.nextFrontBreakPadChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextFrontBreakPadChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Rear Break Pad",
                showPercentage: true,
                selection: provider.rbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbPad = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbPadPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Rear Break Pad",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller: provider.remainingRearBreakPadController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingRearBreakPad = data;
              //                 provider.nextRearBreakPadChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingRearBreakPad = null;
              //                 provider.nextRearBreakPadChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller:
              //                 provider.nextRearBreakPadChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextRearBreakPadChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Rear Break Shoe",
                showPercentage: true,
                selection: provider.rbShoe,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbShoe = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbShoePercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Rear Break Shoe",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller: provider.remainingRearBreakShoeController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingRearBreakShoe = data;
              //                 provider.nextRearBreakShoeChangeODOlController
              //                     .text = (int.parse(data) +
              //                         int.parse(
              //                             provider.currentOodometerReading ??
              //                                 '0'))
              //                     .toString();
              //               } else {
              //                 provider.remainingRearBreakShoe = null;
              //                 provider.nextRearBreakShoeChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller:
              //                 provider.nextRearBreakShoeChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextRearBreakShoeChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // 26.verticalSpace,
              StatusSelector(
                title: "Break Fluid",
                showPercentage: true,
                selection: provider.breakFluid,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.breakFluid = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.breakFluidPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Remaining Break Fluid",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "Remaining",
              //             controller: provider.remainingBreakFluidController,
              //             inputAction: TextInputAction.next,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               if (data.isNotEmpty) {
              //                 provider.remainingBreakFluid = data;
              //                 provider.nextBreakFluidChangeODOlController.text =
              //                     (int.parse(data) +
              //                             int.parse(provider
              //                                     .currentOodometerReading ??
              //                                 '0'))
              //                         .toString();
              //               } else {
              //                 provider.remainingBreakFluid = null;
              //                 provider.nextBreakFluidChangeODOlController
              //                     .clear();
              //               }
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //     16.horizontalSpace,
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Next service on",
              //             style: PlusJakartaFontPalette.f1C1C1C_14_600,
              //           ),
              //           16.verticalSpace,
              //           CommonTextFormFieldWithValidator(
              //             hintText: "ODO Reading",
              //             controller:
              //                 provider.nextBreakFluidChangeODOlController,
              //             inputAction: TextInputAction.done,
              //             inputType: TextInputType.number,
              //             inputFormatters: [
              //               TextInputFormats.digitsFormatter,
              //             ],
              //             onChanged: (String data) {
              //               provider.nextBreakFluidChangeODO = data;
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ],
          );
        }),
      ),
    );
  }
}
