import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/common_widgets/custom_dropdown_button.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../../customer/model/garage_model.dart';

class CustomerAndVehicle extends StatefulWidget {
  final AddServiceViewModel viewModel;
  const CustomerAndVehicle({super.key, required this.viewModel});

  @override
  State<CustomerAndVehicle> createState() => _CustomerAndVehicleState();
}

class _CustomerAndVehicleState extends State<CustomerAndVehicle> {
  final nextServiceReadingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        child: Consumer<AddServiceViewModel>(
          builder: (context, provider, child) {
            bool hasName = (provider.selectedCustomer?.nameEn ?? "").isNotEmpty;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Garage",
                  style: PlusJakartaFontPalette.f1C1C1C_14_600,
                ),
                16.verticalSpace,
                if (provider.isGarageLoader)
                  Container(
                    width: context.sw(),
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: HexColor('#E8E8E8')),
                  )
                else
                  CustomDropdown(
                    itemBuilder: (context, item) {
                      bool isSelected = provider.selectedGarage?.id == item.id;
                      return CustomDropdownItem(
                        label: item.name,
                        isSelected: isSelected,
                      );
                    },
                    items: provider.garageList,
                    title: "Garage",
                    selectedLabel: provider.selectedGarage?.name,
                    onSelected: (Garage data) {
                      provider.update(
                        callBack: () {
                          provider.selectedGarage = data;
                        },
                      );
                      provider.checkAddButtonEnable();
                    },
                  ),

                ////
                20.verticalSpace,
                Text(
                  "Customer Name",
                  style: PlusJakartaFontPalette.f1C1C1C_14_600,
                ),
                16.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.routeSearchCustomerScreen,
                        arguments: widget.viewModel);
                  },
                  child: Container(
                    height: 60.h,
                    width: context.sw(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: HexColor('#FAFAFA'),
                        border: Border.all(
                          color: HexColor('#E8E8E8'),
                        )),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          provider.selectedCustomer?.nameEn ?? "Name",
                          style: hasName
                              ? PlusJakartaFontPalette.fBlack_14_600
                              : PlusJakartaFontPalette.f616161_14_400,
                        )),
                      ],
                    ),
                  ),
                ),
                //Added
                if (provider.currentOodometerReading != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        "Current ODO Reading",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      if (provider.isOodoReadingLoading)
                        Container(
                          width: context.sw(),
                          height: 60.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: HexColor('#E8E8E8')),
                        )
                      else
                        CommonTextFormFieldWithValidator(
                          hintText: "Current ODO",
                          controller: provider.currentODOController,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.number,
                          inputFormatters: [
                            TextInputFormats.digitsFormatter,
                          ],
                          onTap: () {
                            provider.nextServiceReading = null;
                            nextServiceReadingController.clear();
                          },
                          onChanged: (String data) {
                            provider.currentOodometerReading = data;
                          },
                        ),
                      20.verticalSpace,
                      Text(
                        "Oil Life (km)",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Enter oil life (km)",
                        controller: provider.oilLifeController,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onTap: () {
                          provider.nextServiceReading = null;
                          nextServiceReadingController.clear();
                        },
                        onChanged: (String data) {
                          provider.oilLife = data;
                        },
                      ),
                      20.verticalSpace,
                      Text(
                        "Next Service Reading",
                        style: PlusJakartaFontPalette.f1C1C1C_14_600,
                      ),
                      16.verticalSpace,
                      CommonTextFormFieldWithValidator(
                        hintText: "Next Service (km)",
                        controller: nextServiceReadingController,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          TextInputFormats.digitsFormatter,
                        ],
                        onChanged: (String data) {
                          provider.remainingOilController.clear();
                          provider.remainingOil = null;

                          if (data.isEmpty) {
                            provider.nextServiceReading = null;
                            //
                            provider.nextOilChangeODO = null;
                            provider.nextOilChangeODOlController.clear();
                            //
                          } else {
                            provider.nextServiceReading = data;
                            //---
                            if ((provider.currentOodometerReading?.isNotEmpty ??
                                    false) &&
                                (provider.nextServiceReading?.isNotEmpty ??
                                    false)) {
                              if ((int.parse(provider.currentOodometerReading
                                      .toString())) <
                                  ((int.parse(provider.nextServiceReading
                                      .toString())))) {
                                //! 80000 < 85000

                                if (provider.oilLife?.isNotEmpty ?? false) {
                                  final nextOilChange = ((int.parse(
                                          provider.nextServiceReading //! 85000
                                              .toString()))) -
                                      ((int.parse(provider
                                          .currentOodometerReading //!80000
                                          .toString())));

                                  provider.remainingOilController.text =
                                      '$nextOilChange';
                                  provider.remainingOil = '$nextOilChange';
                                  provider.nextOilChangeODO = '$nextOilChange';
                                  provider.nextOilChangeODOlController.text =
                                      provider.nextServiceReading ?? '__';
                                }
                              }

                              // * correct
                              if ((int.parse(provider.currentOodometerReading
                                      .toString())) >
                                  ((int.parse(provider.nextServiceReading
                                      .toString())))) {
                                if (provider.oilLife?.isNotEmpty ?? false) {
                                  final nextOilChange = ((int.parse(provider
                                          .currentOodometerReading
                                          .toString()))) +
                                      ((int.parse(
                                          provider.oilLife.toString())));
                                  provider.nextOilChangeODOlController.text =
                                      '$nextOilChange';
                                  provider.nextOilChangeODO = '$nextOilChange';
                                  provider.remainingOilController.text =
                                      provider.oilLife ?? '__';
                                  provider.remainingOil = provider.oilLife;
                                }
                              }
                            }
                          }
                          provider.setValuesForAllRemainingFields();
                          //
                        },
                      ),
                    ],
                  )

                //--------------
              ],
            );
          },
        ),
      ),
    );
  }
}
