import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class OtherAccessories extends StatelessWidget {
  final AddServiceViewModel viewModel;

  const OtherAccessories({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
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
                    "Other Accessories",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Center Lock",
                selection: provider.centerLock,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.centerLock = selection;
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
                          "Remaining Center Lock",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingCenterLockController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingCenterLock = data;
                              provider.nextCenterLockChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingCenterLock = null;
                              provider.nextCenterLockChangeODOlController
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
                              provider.nextCenterLockChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextCenterLockChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Remarks",
                onChanged: (String data) {
                  provider.clRemarks = data;
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Window Lifter",
                selection: provider.windowLifter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.windowLifter = selection;
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
                          "Remaining Window Lifter",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingWindowLifterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingWindowLifter = data;
                              provider.nextWindowLifterChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingWindowLifter = null;
                              provider.nextWindowLifterChangeODOlController
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
                              provider.nextWindowLifterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextWindowLifterChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Remarks",
                onChanged: (String data) {
                  provider.wlRemarks = data;
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Alignment",
                selection: provider.alignment,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.alignment = selection;
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
                          "Remaining Alignment",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingAlignmentController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingAlignment = data;
                              provider.nextAlignmentChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingAlignment = null;
                              provider.nextAlignmentChangeODOlController
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
                              provider.nextAlignmentChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextAlignmentChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Wheel Balance",
                selection: provider.wheelBalance,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wheelBalance = selection;
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
                          "Remaining Wheel Balance",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingWheelBalanceController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingWheelBalance = data;
                              provider.nextWheelBalanceChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingWheelBalance = null;
                              provider.nextWheelBalanceChangeODOlController
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
                              provider.nextWheelBalanceChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextWheelBalanceChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Wiper Blade Front",
                selection: provider.wiperBladeFront,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeFront = selection;
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
                          "Remaining Wiper Blade Front",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingWiperBladeFrontController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingWiperBladeFront = data;
                              provider.nextWiperBladeFrontChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingWiperBladeFront = null;
                              provider.nextWiperBladeFrontChangeODOlController
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
                              provider.nextWiperBladeFrontChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextWiperBladeFrontChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Wiper Blade Rear",
                selection: provider.wiperBladeRear,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeRear = selection;
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
                          "Remaining Wiper Blade Rear",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingWiperBladeRearController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingWiperBladeRear = data;
                              provider.nextWiperBladeRearChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingWiperBladeRear = null;
                              provider.nextWiperBladeRearChangeODOlController
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
                              provider.nextWiperBladeRearChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextWiperBladeRearChangeODO = data;
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
      ),
    );
  }
}
