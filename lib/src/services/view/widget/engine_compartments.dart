import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class EngineCompartment extends StatefulWidget {
  final AddServiceViewModel viewModel;
  const EngineCompartment({super.key, required this.viewModel});

  @override
  State<EngineCompartment> createState() => _EngineCompartmentState();
}

class _EngineCompartmentState extends State<EngineCompartment> {
  final oilLifeController = TextEditingController();
  final nextOilChangeODOlController = TextEditingController();
  final noOfEngineMountsController = TextEditingController();

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
                    "Engine Compartment",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,

              StatusSelector(
                title: "Engine Oil",
                selection: provider.engineOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineOil = selection;
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
                            provider.oilLife = data;
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
                            provider.nextOilChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Oil Filter",
                selection: provider.oilFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.oilFilter = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Air Filter",
                selection: provider.airFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.airFilter = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "AC Filter",
                selection: provider.acFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.acFilter = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Spark Plug",
                selection: provider.sparkPlug,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sparkPlug = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Ignition Coil",
                selection: provider.ignitionCoil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.ignitionCoil = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Valve Cower Gasket",
                selection: provider.valveCowerGasket,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.valveCowerGasket = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Plug Seal",
                selection: provider.plugSeal,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.plugSeal = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Engine Belt",
                selection: provider.engineBelt,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineBelt = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Engine Belt Tentioner",
                selection: provider.engineBeltTentioner,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineBeltTentioner = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "IDL Pulley",
                selection: provider.idlPulley,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.idlPulley = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Injectors",
                selection: provider.injectors,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.injectors = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Self Motor",
                selection: provider.selfMotor,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.selfMotor = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Engine Mount",
                selection: provider.engineMount,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineMount = selection;
                  });
                },
              ),
              //  26.verticalSpace,
              26.verticalSpace,
              Text(
                "Number of Engine Mounts",
                style: PlusJakartaFontPalette.f1C1C1C_14_600,
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Number",
                controller: noOfEngineMountsController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
                onChanged: (String data) {
                  if (data.isEmpty) {
                    provider.numberOfEngineMounts = null;
                  } else {
                    provider.numberOfEngineMounts = data;
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
