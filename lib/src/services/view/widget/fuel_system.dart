import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
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
                onLifeChanged: (data) {
                  provider.fuelPumpLife = data;
                },
                remainingController: provider.remainingFuelPumpController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextFuelPumpChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFuelPumpChangeODOlController.clear();
                  }
                },
                odoController: provider.nextFuelPumpChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Fuel Filter",
                selection: provider.fuelFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fuelFilter = selection;
                  });
                },
                onLifeChanged: (data) {
                  provider.fuelFilterLife = data;
                },
                remainingController: provider.remainingFuelFilterController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextFuelFilterChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFuelFilterChangeODOlController.clear();
                  }
                },
                odoController: provider.nextFuelFilterChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Canister",
                selection: provider.canister,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.canister = selection;
                  });
                },
                onLifeChanged: (data) {
                  provider.canisterLife = data;
                },
                remainingController: provider.remainingCanisterController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextCanisterChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextCanisterChangeODOlController.clear();
                  }
                },
                odoController: provider.nextCanisterChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Fuel Tank",
                selection: provider.fuelTank,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fuelTank = selection;
                  });
                },
                onLifeChanged: (data) {
                  provider.fuelTankLife = data;
                },
                remainingController: provider.remainingFuelTankController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextFuelTankChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFuelTankChangeODOlController.clear();
                  }
                },
                odoController: provider.nextFuelTankChangeODOlController,
              ),
            ],
          );
        }),
      ),
    );
  }
}
