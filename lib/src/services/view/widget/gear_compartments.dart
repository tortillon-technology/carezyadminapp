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
                lifeController: provider.lifeGearOilController,
                remainingController: provider.remainingGearOilController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextGearOilChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextGearOilChangeODOlController.clear();
                  }
                },
                odoController: provider.nextGearOilChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Gear Filter",
                selection: provider.gearFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearFilter = selection;
                  });
                },
                lifeController: provider.lifeGearFilterController,
                remainingController: provider.remainingGearFilterController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextGearFilterChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextGearFilterChangeODOlController.clear();
                  }
                },
                odoController: provider.nextGearFilterChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "4 Wheel Oil",
                selection: provider.fourWheelOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fourWheelOil = selection;
                  });
                },
                lifeController: provider.lifeFourWheelOilController,
                remainingController: provider.remainingFourWheelOilController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextFourWheelOilChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFourWheelOilChangeODOlController.clear();
                  }
                },
                odoController: provider.nextFourWheelOilChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Transmission Control Module",
                selection: provider.transmissionControlModule,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.transmissionControlModule = selection;
                  });
                },
                lifeController:
                    provider.lifeTransmissionControlModuleController,
                remainingController:
                    provider.remainingTransmissionControlOilController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextTransmissionControlOilChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextTransmissionControlOilChangeODOlController
                        .clear();
                  }
                },
                odoController:
                    provider.nextTransmissionControlOilChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Gear Gasket",
                selection: provider.gearGasket,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearGasket = selection;
                  });
                },
                lifeController: provider.lifeGearGasketController,
                remainingController: provider.remainingGearGasketController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextGearGasketChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextGearGasketChangeODOlController.clear();
                  }
                },
                odoController: provider.nextGearGasketChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Gear Mount",
                selection: provider.gearMount,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearMount = selection;
                  });
                },
                lifeController: provider.lifeGearMountController,
                remainingController: provider.remainingGearMountController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextGearMountChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextGearMountChangeODOlController.clear();
                  }
                },
                odoController: provider.nextGearMountChangeODOlController,
              ),
              26.verticalSpace,
              Text(
                "Number of Gear Mounts",
                style: PlusJakartaFontPalette.f1C1C1C_14_600,
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Number",
                inputAction: TextInputAction.done,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
                onChanged: (String data) {
                  provider.noOfGearMounts = data;
                },
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Gear Coolar",
                selection: provider.gearCoolar,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.gearCoolar = selection;
                  });
                },
                lifeController: provider.lifeGearCoolarController,
                remainingController: provider.remainingGearCoolarController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider
                        .nextGearCoolarODOController.text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextGearCoolarODOController.clear();
                  }
                },
                odoController: provider.nextGearCoolarODOController,
              ),
            ],
          );
        }),
      ),
    );
  }
}
