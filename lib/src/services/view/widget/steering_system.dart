import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class SteeringSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;

  const SteeringSystem({super.key, required this.viewModel});

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
                    "Steering System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering Boot Left",
                selection: provider.sbl,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sbl = selection;
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
                          "Remaining Steering Boot Left",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingSteeringBootLeftController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSteeringBootLeft = data;
                              provider.nextSteeringBootLeftChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingSteeringBootLeft = null;
                              provider.nextSteeringBootLeftChangeODOlController
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
                              provider.nextSteeringBootLeftChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSteeringBootLeftChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering Boot Right",
                selection: provider.sbr,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sbr = selection;
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
                          "Remaining Steering Boot Right",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingSteeringBootRightController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSteeringBootRight = data;
                              provider.nextSteeringBootRightChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingSteeringBootRight = null;
                              provider.nextSteeringBootRightChangeODOlController
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
                              .nextSteeringBootRightChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSteeringBootRightChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering End Left",
                selection: provider.sel,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sel = selection;
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
                          "Remaining Steering End Left",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingSteeringEndLeftController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSteeringEndLeft = data;
                              provider.nextSteeringEndLeftChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingSteeringEndLeft = null;
                              provider.nextSteeringEndLeftChangeODOlController
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
                              provider.nextSteeringEndLeftChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSteeringEndLeftChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering End Right",
                selection: provider.ser,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.ser = selection;
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
                          "Remaining Steering End Right",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingSteeringEndRightController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingSteeringEndRight = data;
                              provider.nextSteeringEndRightChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingSteeringEndRight = null;
                              provider.nextSteeringEndRightChangeODOlController
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
                              provider.nextSteeringEndRightChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextSteeringEndRightChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Ball Joint Left",
                selection: provider.bjl,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.bjl = selection;
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
                          "Remaining Ball Joint Left",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller: provider.remainingBallJointLeftController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingBallJointLeft = data;
                              provider.nextBallJointLeftChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingBallJointLeft = null;
                              provider.nextBallJointLeftChangeODOlController
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
                              provider.nextBallJointLeftChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextBallJointLeftChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Ball Joint Right",
                selection: provider.bjr,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.bjr = selection;
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
                          "Remaining Ball Joint Right",
                          style: PlusJakartaFontPalette.f1C1C1C_14_600,
                        ),
                        16.verticalSpace,
                        CommonTextFormFieldWithValidator(
                          hintText: "Remaining",
                          controller:
                              provider.remainingBallJointRightController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            if (data.isNotEmpty) {
                              provider.remainingBallJointRight = data;
                              provider.nextBallJointRightChangeODOlController
                                  .text = (int.parse(data) +
                                      int.parse(
                                          provider.currentOodometerReading ??
                                              '0'))
                                  .toString();
                            } else {
                              provider.remainingBallJointRight = null;
                              provider.nextBallJointRightChangeODOlController
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
                              provider.nextBallJointRightChangeODOlController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onChanged: (String data) {
                            provider.nextBallJointRightChangeODO = data;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
