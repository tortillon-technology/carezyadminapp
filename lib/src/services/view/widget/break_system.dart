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
                lifeController: provider.lifeFrontLeftBreakDiscController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.flbdPercentage = percentage;
                  });
                },
                remainingController:
                    provider.remainingFrontLeftBreakDiscController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextFrontLeftBreakDiscChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFrontLeftBreakDiscChangeODOlController.clear();
                  }
                },
                odoController:
                    provider.nextFrontLeftBreakDiscChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Front Right Break Disc",
                showPercentage: true,
                selection: provider.frBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.frBreakDisc = selection;
                  });
                },
                lifeController: provider.lifeFrontRightBreakDiscController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.frbdPercentage = percentage;
                  });
                },
                remainingController:
                    provider.remainingFrontRightBreakDiscController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextFrontRightBreakDiscChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFrontRightBreakDiscChangeODOlController
                        .clear();
                  }
                },
                odoController:
                    provider.nextFrontRightBreakDiscChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Rear Left Break Disc",
                showPercentage: true,
                lifeController: provider.lifeRearLeftBreakDiscController,
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
                remainingController:
                    provider.remainingRearLeftBreakDiscController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextRearLeftBreakDiscChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextRearLeftBreakDiscChangeODOlController.clear();
                  }
                },
                odoController:
                    provider.nextRearLeftBreakDiscChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Rear Right Break Disc",
                showPercentage: true,
                selection: provider.rrBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rrBreakDisc = selection;
                  });
                },
                lifeController: provider.lifeRearRightBreakDiscController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rrbdPercentage = percentage;
                  });
                },
                remainingController:
                    provider.remainingRearRightBreakDiscController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextRearRightBreakDiscChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextRearRightBreakDiscChangeODOlController.clear();
                  }
                },
                odoController:
                    provider.nextRearRightBreakDiscChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Front Break Pad",
                showPercentage: true,
                selection: provider.fbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fbPad = selection;
                  });
                },
                lifeController: provider.lifeFrontBreakPadController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.fbPadPercentage = percentage;
                  });
                },
                remainingController: provider.remainingFrontBreakPadController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextFrontBreakPadChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextFrontBreakPadChangeODOlController.clear();
                  }
                },
                odoController: provider.nextFrontBreakPadChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Rear Break Pad",
                showPercentage: true,
                selection: provider.rbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbPad = selection;
                  });
                },
                lifeController: provider.lifeRearBreakPadController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbPadPercentage = percentage;
                  });
                },
                remainingController: provider.remainingRearBreakPadController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextRearBreakPadChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextRearBreakPadChangeODOlController.clear();
                  }
                },
                odoController: provider.nextRearBreakPadChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Rear Break Shoe",
                showPercentage: true,
                selection: provider.rbShoe,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbShoe = selection;
                  });
                },
                lifeController: provider.lifeRearBreakShoeController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbShoePercentage = percentage;
                  });
                },
                remainingController: provider.remainingRearBreakShoeController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextRearBreakShoeChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextRearBreakShoeChangeODOlController.clear();
                  }
                },
                odoController: provider.nextRearBreakShoeChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Break Fluid",
                showPercentage: true,
                selection: provider.breakFluid,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.breakFluid = selection;
                  });
                },
                lifeController: provider.lifeBreakFluidController,
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.breakFluidPercentage = percentage;
                  });
                },
                remainingController: provider.remainingBreakFluidController,
                onRemainingChanged: (data) {
                  if (data.isNotEmpty) {
                    provider.nextBreakFluidChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextBreakFluidChangeODOlController.clear();
                  }
                },
                odoController: provider.nextBreakFluidChangeODOlController,
              ),
            ],
          );
        }),
      ),
    );
  }
}
