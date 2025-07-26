import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class AcCompartments extends StatefulWidget {
  final AddServiceViewModel viewModel;

  const AcCompartments({super.key, required this.viewModel});

  @override
  State<AcCompartments> createState() => _AcCompartmentsState();
}

class _AcCompartmentsState extends State<AcCompartments> {
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
                    "AC Compartment",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "AC Gas",
                selection: provider.acGas,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.acGas = selection;
                  });
                },
                lifeController: provider.lifeAcGasController,
                remainingController: provider.remainingAcGasController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider
                        .nextAcGasChangeODOlController.text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextAcGasChangeODOlController.clear();
                  }
                },
                odoController: provider.nextAcGasChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Compressor",
                selection: provider.compressor,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.compressor = selection;
                  });
                },
                lifeController: provider.lifeCompressorController,
                remainingController: provider.remainingCompressorController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextCompressorChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextCompressorChangeODOlController.clear();
                  }
                },
                odoController: provider.nextCompressorChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Condenser",
                selection: provider.condenser,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.condenser = selection;
                  });
                },
                lifeController: provider.lifeCondenserController,
                remainingController: provider.remainingCondenserController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextCondenserChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextCondenserChangeODOlController.clear();
                  }
                },
                odoController: provider.nextCondenserChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Evaporator",
                selection: provider.evaporator,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.evaporator = selection;
                  });
                },
                lifeController: provider.lifeEvaporatorController,
              
                remainingController: provider.remainingEvaporatorController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextEvaporatorChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextEvaporatorChangeODOlController.clear();
                  }
                },
                odoController: provider.nextEvaporatorChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "EX Valve",
                selection: provider.exValve,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.exValve = selection;
                  });
                },
                lifeController: provider.lifeExValveController,
                remainingController: provider.remainingExValveController,
                onRemainingChanged: (String data) {
                  if (data.isNotEmpty) {
                    provider.nextExValveChangeODOlController
                        .text = (int.parse(data) +
                            int.parse(provider.currentOodometerReading ?? '0'))
                        .toString();
                  } else {
                    provider.nextExValveChangeODOlController.clear();
                  }
                },
                odoController: provider.nextExValveChangeODOlController,
              ),
            ],
          );
        }),
      ),
    );
  }
}
