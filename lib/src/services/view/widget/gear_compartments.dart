import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class GearCompartments extends StatefulWidget {
  final AddServiceViewModel viewModel;
  const GearCompartments({super.key, required this.viewModel});

  @override
  State<GearCompartments> createState() => _GearCompartmentsState();
}

class _GearCompartmentsState extends State<GearCompartments> {
  final oilLifeController = TextEditingController();
  final nextOilChangeODOlController = TextEditingController();
  final fourWheelOilLifeController = TextEditingController();
  final nextFourWheelOilChangeODOlController = TextEditingController();
  final noOfGearMountsController = TextEditingController();

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
                    "Gear Compartment",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Gear Oil",
                selection: provider.gearOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearOil = selection;
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
                          "Oil Life (km)",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Enter oil life (km)",
                          controller: oilLifeController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.gearOilLife = null;
                            } else {
                              provider.gearOilLife = data;
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
                          controller: nextOilChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.nextGearOilChangeODO = null;
                            } else {
                              provider.nextGearOilChangeODO = data;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Gear Filter",
                selection: provider.gearFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearFilter = selection;
                  });
                },
              ),
              26.verticalSpace,

              //
              StatusSelector(
                title: "4 Wheel Oil",
                selection: provider.fourWheelOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fourWheelOil = selection;
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
                          "Oil Life (km)",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Enter oil life (km)",
                          controller: fourWheelOilLifeController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.fourOilLife = null;
                            } else {
                              provider.fourOilLife = data;
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
                          controller: nextFourWheelOilChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.nextFourOilChangeODO = null;
                            } else {
                              provider.nextFourOilChangeODO = data;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Transmission Control Module",
                selection: provider.transmissionControlModule,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.transmissionControlModule = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Gear Gasket",
                selection: provider.gearGasket,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearGasket = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Gear Mount",
                selection: provider.gearMount,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearMount = selection;
                  });
                },
              ),
              //  26.verticalSpace,
              26.verticalSpace,
              Text(
                "Number of Gear Mounts",
                style: PlusJakartaFontPalette.f1C1C1C_14_600,
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Number",
                controller: noOfGearMountsController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
                onChanged: (String data) {
                  if (data.isEmpty) {
                    provider.noOfGearMounts = null;
                  } else {
                    provider.noOfGearMounts = data;
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
