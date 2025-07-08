import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class FuelSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;

  const FuelSystem({super.key, required this.viewModel});

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
                    "Fuel System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Fuel Pump",
                selection: provider.fuelPump,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fuelPump = selection;
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
                          "Remaining Fuel Pump",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingFuelPumpController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingFuelPump = data;
                              provider.nextFuelPumpChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingFuelPump = null;
                              provider.nextFuelPumpChangeODOlController.clear();
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
                          controller: provider.nextFuelPumpChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextFuelPumpChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Fuel Filter",
                selection: provider.fuelFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fuelFilter = selection;
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
                          "Remaining Fuel Filter",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingFuelFilterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingFuelFilter = data;
                              provider.nextFuelFilterChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingFuelFilter = null;
                              provider.nextFuelFilterChangeODOlController
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
                              provider.nextFuelFilterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextFuelFilterChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Canister",
                selection: provider.canister,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.canister = selection;
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
                          "Remaining Canister",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingCanisterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingCanister = data;
                              provider.nextCanisterChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingCanister = null;
                              provider.nextCanisterChangeODOlController.clear();
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
                          controller: provider.nextCanisterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextCanisterChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Fuel Tank",
                selection: provider.fuelTank,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fuelTank = selection;
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
                          "Remaining Fuel Tank",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingFuelTankController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingFuelTank = data;
                              provider.nextFuelTankChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingFuelTank = null;
                              provider.nextFuelTankChangeODOlController.clear();
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
                          controller: provider.nextFuelTankChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextFuelTankChangeODO = data;
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
