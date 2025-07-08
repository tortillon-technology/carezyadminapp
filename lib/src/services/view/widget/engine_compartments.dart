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
                          "Remaining Oil (km)",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingOilController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.remainingOil = data;
                          },
                          onTap: () {
                            provider.nextOilChangeODOlController.clear();
                            provider.nextOilChangeODO = null;
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
                          controller: provider.nextOilChangeODOlController,
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
              // Newly Added
              26.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Oil Filter",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingOilFilterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingOilFilter = data;
                              provider.nextOilFilterChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingOilFilter = null;
                              provider.nextOilFilterChangeODOlController
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
                              provider.nextOilFilterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextOilFilterChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //------

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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Air Filter",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingAirFilterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingAirFilter = data;
                              provider.nextAirFilterChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingAirFilter = null;
                              provider.nextAirFilterChangeODOlController
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
                              provider.nextAirFilterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextAirFilterChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //------
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
              //
              26.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining AC Filter",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingAcFilterController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingAcFilter = data;
                              provider.nextAcFilterChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingAcFilter = null;
                              provider.nextAcFilterChangeODOlController.clear();
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
                          controller: provider.nextAcFilterChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextAirFilterChangeODO = data;
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
                title: "Spark Plug",
                selection: provider.sparkPlug,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sparkPlug = selection;
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
                          "Remaining Spark Plug",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingSparkPlugController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSparkPlug = data;
                              provider.nextSparkPlugChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingSparkPlug = null;
                              provider.nextSparkPlugChangeODOlController
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
                              provider.nextSparkPlugChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSparkPlugChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Ignition Coil",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingIgnitionCoilController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingIgnitionCoil = data;
                              provider.nextIgnitionCoilChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingIgnitionCoil = null;
                              provider.nextIgnitionCoilChangeODOlController
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
                              provider.nextIgnitionCoilChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextIgnitionCoilChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Plug Seal",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingPlugSealController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingPlugSeal = data;
                              provider.nextPlugSealChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingPlugSeal = null;
                              provider.nextPlugSealChangeODOlController.clear();
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
                          controller: provider.nextPlugSealChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextPlugSealChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Engine Belt",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingEngineBeltController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingEngineBelt = data;
                              provider.nextEngineBeltChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingEngineBelt = null;
                              provider.nextEngineBeltChangeODOlController
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
                              provider.nextEngineBeltChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextEngineBeltChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Engine Belt Tentioner",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingEngineBeltTentionerController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingEngineBeltTentioner = data;
                              provider
                                  .nextEngineBeltTentionerChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingEngineBeltTentioner = null;
                              provider
                                  .nextEngineBeltTentionerChangeODOlController
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
                          controller: provider
                              .nextEngineBeltTentionerChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextEngineBeltTentionerChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining IDL Pulley",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingIDLPulleyController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingIDLPulley = data;
                              provider.nextIDLPulleyChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingIDLPulley = null;
                              provider.nextIDLPulleyChangeODOlController
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
                              provider.nextIDLPulleyChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextIDLPulleyChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Injectors",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingInjectorsController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingInjectors = data;
                              provider.nextInjectorsChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingInjectors = null;
                              provider.nextInjectorsChangeODOlController
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
                              provider.nextInjectorsChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextInjectorsChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Self Motor",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingSelfMotorController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSelfMotor = data;
                              provider.nextSelfMotorChangeODOlController.text =
                                  (int.parse(data) +
                                          int.parse(provider
                                                  .currentOodometerReading ??
                                              '0'))
                                      .toString();
                            } else {
                              provider.remainingSelfMotor = null;
                              provider.nextSelfMotorChangeODOlController
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
                              provider.nextSelfMotorChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSelfMotorChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              26.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remaining Engine Mount",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingEngineMotorController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingEngineMotor = data;
                              provider.nextEngineMotorChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingEngineMotor = null;
                              provider.nextEngineMotorChangeODOlController
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
                              provider.nextEngineMotorChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextEngineMotorrChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
