import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class DifferentialCompartments extends StatefulWidget {
  final AddServiceViewModel viewModel;
  const DifferentialCompartments({super.key, required this.viewModel});

  @override
  State<DifferentialCompartments> createState() =>
      _DifferentialCompartmentsState();
}

class _DifferentialCompartmentsState extends State<DifferentialCompartments> {
  final frontDiffOilLifeController = TextEditingController();
  final nextFrontDiffOilChangeODOlController = TextEditingController();
  final rearDiffOilLifeController = TextEditingController();
  final nextRearDiffOilLifeChangeODOlController = TextEditingController();

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
                          controller: frontDiffOilLifeController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.frontDifferentialOilLife = null;
                            } else {
                              provider.frontDifferentialOilLife = data;
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
                          controller: nextFrontDiffOilChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.nextFrontDifferentialOilChangeODO = null;
                            } else {
                              provider.nextFrontDifferentialOilChangeODO = data;
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
                title: "Shaft Status",
                selection: provider.shaftStatus,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.shaftStatus = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Shaft Seals",
                selection: provider.shaftSeals,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.shaftSeals = selection;
                  });
                },
              ),

              ///
              26.verticalSpace,
              StatusSelector(
                title: "Rear Differential Oil",
                selection: provider.rearDifferentialOil,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rearDifferentialOil = selection;
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
                          controller: rearDiffOilLifeController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.rearDifferentialOilLife = null;
                            } else {
                              provider.rearDifferentialOilLife = data;
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
                          controller: nextRearDiffOilLifeChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isEmpty) {
                              provider.nextRearDifferentialOilChangeODO = null;
                            } else {
                              provider.nextFrontDifferentialOilChangeODO = data;
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
                title: "Differential Bushes",
                selection: provider.differentialBushes,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.differentialBushes = selection;
                  });
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
