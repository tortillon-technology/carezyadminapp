import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class DifferentialCompartments extends StatefulWidget {
  final AddServiceViewModel viewModel;

  const DifferentialCompartments({super.key, required this.viewModel});

  @override
  State<DifferentialCompartments> createState() =>
      _DifferentialCompartmentsState();
}

class _DifferentialCompartmentsState extends State<DifferentialCompartments> {
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
                    "Differential Compartment",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Front Differential Oil",
                selection: provider.frontDifferentialOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.frontDifferentialOil = selection;
                  });
                },
                lifeController: provider.frontDifferentialOilLifeController,
                remainingController:
                    provider.frontDifferentialOilLifeController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextFrontDifferentialOilChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFrontDifferentialOilChangeODOlController
                        .clear();
                  }
                },
                odoController:
                    provider.nextFrontDifferentialOilChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Shaft Status",
                selection: provider.shaftStatus,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.shaftStatus = selection;
                  });
                },
                lifeController: provider.lifeShaftStatusController,
                remainingController: provider.remainingShaftStatusController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextShaftStatusChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextShaftStatusChangeODOlController.clear();
                  }
                },
                odoController: provider.nextShaftStatusChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Shaft Seals",
                selection: provider.shaftSeals,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.shaftSeals = selection;
                  });
                },
                lifeController: provider.lifeShaftSealsController,
                remainingController: provider.remainingShaftSealsController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextShaftSealsChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextShaftSealsChangeODOlController.clear();
                  }
                },
                odoController: provider.nextShaftSealsChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Rear Differential Oil",
                selection: provider.rearDifferentialOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rearDifferentialOil = selection;
                  });
                },
                lifeController: provider.rearDifferentialOilLifeController,
               
                remainingController: provider.rearDifferentialOilLifeController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextRearDifferentialOilChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextRearDifferentialOilChangeODOlController
                        .clear();
                  }
                },
                odoController:
                    provider.nextRearDifferentialOilChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Differential Bushes",
                selection: provider.differentialBushes,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.differentialBushes = selection;
                  });
                },
                lifeController: provider.lifeDifferentialBushesController,
                remainingController:
                    provider.remainingDifferentialBushesController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextDifferentialBushesChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextDifferentialBushesChangeODOlController.clear();
                  }
                },
                odoController:
                    provider.nextDifferentialBushesChangeODOlController,
              ),
            ],
          );
        }),
      ),
    );
  }
}
