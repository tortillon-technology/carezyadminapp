import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
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
                lifeController: provider.lifeCenterLockController,
                remainingController: provider.remainingCenterLockController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextCenterLockChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextCenterLockChangeODOlController.clear();
                  }
                },
                odoController: provider.nextCenterLockChangeODOlController,
              ),
              18.verticalSpace,

              CommonTextFormFieldWithValidator(
                hintText: "Remarks",
                onChanged: (String data) {
                  provider.clRemarks = data;
                },
              ),
              //
              40.verticalSpace,
              StatusSelector(
                title: "Window Lifter",
                selection: provider.windowLifter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.windowLifter = selection;
                  });
                },
                lifeController: provider.lifeWindowLifterController,
                remainingController: provider.remainingWindowLifterController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextWindowLifterChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextWindowLifterChangeODOlController.clear();
                  }
                },
                odoController: provider.nextWindowLifterChangeODOlController,
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
                lifeController: provider.lifeAlignmentController,
                remainingController: provider.remainingAlignmentController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextAlignmentChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextAlignmentChangeODOlController.clear();
                  }
                },
                odoController: provider.nextAlignmentChangeODOlController,
              ),

              40.verticalSpace,

              StatusSelector(
                title: "Wheel Balance",
                selection: provider.wheelBalance,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wheelBalance = selection;
                  });
                },
                lifeController: provider.lifeWheelBalanceController,
                remainingController: provider.remainingWheelBalanceController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextWheelBalanceChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextWheelBalanceChangeODOlController.clear();
                  }
                },
                odoController: provider.nextWheelBalanceChangeODOlController,
              ),
              40.verticalSpace,

              StatusSelector(
                title: "Wiper Blade Front",
                selection: provider.wiperBladeFront,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeFront = selection;
                  });
                },
                showLife: false,
                showRemainingAndNextOdo: false,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Wiper Blade Rear",
                selection: provider.wiperBladeRear,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeRear = selection;
                  });
                },
                showLife: false,
                showRemainingAndNextOdo: false,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Main Battery",
                selection: provider.mainBatterySelection,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.mainBatterySelection = selection;
                  });
                },
                showLife: false,
                showRemainingAndNextOdo: false,
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Battery Ampere",
                onChanged: (String data) {
                  provider.mainBatteryAmpere = data;
                },
              ),
              18.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CommonTextFormFieldWithValidator(
                      hintText: "Battery Brand",
                      onChanged: (String data) {
                        provider.mainBatteryBrand = data;
                      },
                    ),
                  ),
                  18.horizontalSpace,
                  Expanded(
                    child: CommonTextFormFieldWithValidator(
                      hintText: "Battery Type",
                      onChanged: (String data) {
                        provider.mainBatteryType = data;
                      },
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Auxiliary Battery",
                selection: provider.auxiliaryBatterySelection,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.auxiliaryBatterySelection = selection;
                  });
                },
                showLife: false,
                showRemainingAndNextOdo: false,
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Battery Ampere",
                onChanged: (String data) {
                  provider.auxiliaryBatteryAmpere = data;
                },
              ),
              18.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CommonTextFormFieldWithValidator(
                      hintText: "Battery Brand",
                      onChanged: (String data) {
                        provider.auxiliaryBatteryBrand = data;
                      },
                    ),
                  ),
                  18.horizontalSpace,
                  Expanded(
                    child: CommonTextFormFieldWithValidator(
                      hintText: "Battery Type",
                      onChanged: (String data) {
                        provider.auxiliaryBatteryType = data;
                      },
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
