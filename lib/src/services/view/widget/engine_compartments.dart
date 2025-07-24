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
  final noOfEngineMountsController = TextEditingController();
  final nextServiceReadingController = TextEditingController();
  final engineCoolantController = TextEditingController();

  String nextOdo(String data) {
    int currentReadingInt = int.parse(data);
    final result = (currentReadingInt +
            int.parse(widget.viewModel.currentOodometerReading ?? '0'))
        .toString();
    return data.isEmpty ? "" : result;
  }

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
                    style: PlusJakartaFontPalette.fBlack_16_600
                        .copyWith(fontSize: 18.sp),
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
                onLifeChanged: (String data) {
                  provider.oilLife = data;
                },
                remainingController: provider.remainingOilController,
                onRemainingChanged: (data) {
                  provider.nextOilChangeODOlController.text = nextOdo(data);
                },
                odoController: provider.nextOilChangeODOlController,
              ),

              40.verticalSpace,

              /////////

              StatusSelector(
                title: "Oil Filter",
                selection: provider.oilFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.oilFilter = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.oilFilterLife = data;
                },
                remainingController: provider.remainingOilFilterController,
                onRemainingChanged: (data) {
                  provider.oilFilterOdoController.text = nextOdo(data);
                },
                odoController: provider.oilFilterOdoController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Air Filter",
                selection: provider.airFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.airFilter = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.airFilterLife = data;
                },
                remainingController: provider.remainingAirFilterController,
                onRemainingChanged: (data) {
                  provider.nextAirFilterChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextAirFilterChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "AC Filter",
                selection: provider.acFilter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.acFilter = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.acFilterLife = data;
                },
                remainingController: provider.remainingAcFilterController,
                onRemainingChanged: (data) {
                  provider.nextAcFilterChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextAcFilterChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Spark Plug",
                selection: provider.sparkPlug,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sparkPlug = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.sparkPlugLife = data;
                },
                remainingController: provider.remainingSparkPlugController,
                onRemainingChanged: (data) {
                  provider.nextSparkPlugChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextSparkPlugChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Ignition Coil",
                selection: provider.ignitionCoil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.ignitionCoil = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.ignitionCoilLife = data;
                },
                remainingController: provider.remainingIgnitionCoilController,
                onRemainingChanged: (data) {
                  provider.nextIgnitionCoilChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextIgnitionCoilChangeODOlController,
              ),

              40.verticalSpace,

              StatusSelector(
                title: "Valve Cower Gasket",
                selection: provider.valveCowerGasket,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.valveCowerGasket = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.valveCowerGasketLife = data;
                },
                remainingController:
                    provider.remainingValveCowerGasketController,
                onRemainingChanged: (data) {
                  provider.nextValveCowerGasketChangeODOlController.text =
                      nextOdo(data);
                },
                odoController:
                    provider.nextValveCowerGasketChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Plug Seal",
                selection: provider.plugSeal,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.plugSeal = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.plugSealLife = data;
                },
                remainingController: provider.remainingPlugSealController,
                onRemainingChanged: (data) {
                  provider.nextPlugSealChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextPlugSealChangeODOlController,
              ),

              40.verticalSpace,

              StatusSelector(
                title: "Engine Belt",
                selection: provider.engineBelt,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineBelt = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineBeltLife = data;
                },
                remainingController: provider.remainingEngineBeltController,
                onRemainingChanged: (data) {
                  provider.nextEngineBeltChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextEngineBeltChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Engine Belt Tentioner",
                selection: provider.engineBeltTentioner,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineBeltTentioner = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineBeltTentionerLife = data;
                },
                remainingController:
                    provider.remainingEngineBeltTentionerController,
                onRemainingChanged: (data) {
                  provider.nextEngineBeltTentionerChangeODOlController.text =
                      nextOdo(data);
                },
                odoController:
                    provider.nextEngineBeltTentionerChangeODOlController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "IDL Pulley",
                selection: provider.idlPulley,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.idlPulley = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.idlPulleyLife = data;
                },
                remainingController: provider.remainingIDLPulleyController,
                onRemainingChanged: (data) {
                  provider.nextIDLPulleyChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextIDLPulleyChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Injectors",
                selection: provider.injectors,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.injectors = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.injectorsLife = data;
                },
                remainingController: provider.remainingInjectorsController,
                onRemainingChanged: (data) {
                  provider.nextInjectorsChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextInjectorsChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Self Motor",
                selection: provider.selfMotor,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.selfMotor = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.selfMotorLife = data;
                },
                remainingController: provider.remainingSelfMotorController,
                onRemainingChanged: (data) {
                  provider.nextSelfMotorChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextSelfMotorChangeODOlController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Radiator",
                selection: provider.radiator,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.radiator = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.radiatorLife = data;
                },
                remainingController: provider.remainingRadiatorController,
                onRemainingChanged: (data) {
                  provider.nextRadiatorController.text = nextOdo(data);
                },
                odoController: provider.nextRadiatorController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Radiator Hose",
                selection: provider.radiatorHose,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.radiatorHose = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.radiatorHoseLife = data;
                },
                remainingController: provider.remainingRadiatorHoseController,
                onRemainingChanged: (data) {
                  provider.nextRadiatorHoseController.text = nextOdo(data);
                },
                odoController: provider.nextRadiatorHoseController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Thermostat",
                selection: provider.thermostat,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.thermostat = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.thermostatLife = data;
                },
                remainingController: provider.remainingThermostatController,
                onRemainingChanged: (data) {
                  provider.nextThermostatController.text = nextOdo(data);
                },
                odoController: provider.nextThermostatController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Coolant",
                selection: provider.engineColant,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineColant = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineCoolantLife = data;
                },
                remainingController: provider.remainingCoolantController,
                onRemainingChanged: (data) {
                  provider.nextCoolantController.text = nextOdo(data);
                },
                odoController: provider.nextCoolantController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Engine Coolar",
                selection: provider.engineCoolar,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineCoolar = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineCoolarLife = data;
                },
                remainingController: provider.remainingEngineCoolarController,
                onRemainingChanged: (data) {
                  provider.nextEngineCoolarController.text = nextOdo(data);
                },
                odoController: provider.nextEngineCoolarController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Radiator Cap",
                selection: provider.radiatorCap,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.radiatorCap = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.radiatorCapLife = data;
                },
                remainingController: provider.remainingRadiatorCapController,
                onRemainingChanged: (data) {
                  provider.nextRadiatorCapController.text = nextOdo(data);
                },
                odoController: provider.nextRadiatorCapController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Coolant Spare Tank",
                selection: provider.coolantSpareTank,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.coolantSpareTank = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.coolantSpareTankLife = data;
                },
                remainingController:
                    provider.remainingCoolantSpareTankController,
                onRemainingChanged: (data) {
                  provider.nextCoolantSpareTankController.text = nextOdo(data);
                },
                odoController: provider.nextCoolantSpareTankController,
              ),
              40.verticalSpace,
              StatusSelector(
                title: "Radiator Fan Motor",
                selection: provider.radiatorFanMotor,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.radiatorFanMotor = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.radiatorFanMotorLife = data;
                },
                remainingController:
                    provider.remainingRadiatorFanMotorController,
                onRemainingChanged: (data) {
                  provider.nextRadiatorFanMotorController.text = nextOdo(data);
                },
                odoController: provider.nextRadiatorFanMotorController,
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Engine Coolant Level",
                selection: provider.engineCoolantLevel,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineCoolantLevel = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineCoolantLevelLife = data;
                },
                remainingController:
                    provider.remainingEngineCoolantLevelController,
                onRemainingChanged: (data) {
                  provider.nextEngineCoolantLevelController.text =
                      nextOdo(data);
                },
                odoController: provider.nextEngineCoolantLevelController,
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Coolant Percentage",
                controller: engineCoolantController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
                onChanged: (data) {
                  provider.engineCoolantLevelPercentage = data;
                },
              ),

              40.verticalSpace,
              StatusSelector(
                title: "Engine Mount",
                selection: provider.engineMount,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.engineMount = selection;
                  });
                },
                onLifeChanged: (String data) {
                  provider.engineMountLife = data;
                },
                remainingController: provider.remainingEngineMountController,
                onRemainingChanged: (data) {
                  provider.nextEngineMountChangeODOlController.text =
                      nextOdo(data);
                },
                odoController: provider.nextEngineMountChangeODOlController,
              ),

              26.verticalSpace,

              //////////
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
                  provider.numberOfEngineMounts = data;
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
