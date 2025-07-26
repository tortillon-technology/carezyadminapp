
import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  List<String> items = [
    '5000',
    '10000',
    '15000',
    '20000',
    '25000',
    '30000',
    '35000',
    '40000',
    '45000',
    '50000',
    '60000',
    '70000',
    '80000',
    '90000',
  ];

  void _openBottomSheet(
    BuildContext context, {
    required String title,
    required Function(String d) onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => StatefulBuilder(builder: (context, newState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.verticalSpace,
            Row(
              children: [
                16.horizontalSpace,
                Text(
                  "Select $title (km)",
                  style: PlusJakartaFontPalette.fBlack_12_600
                      .copyWith(fontSize: 18.sp),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(100.r),
                  child: Ink(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ),
                16.horizontalSpace,
              ],
            ),
            24.verticalSpace,
            Container(
              constraints: BoxConstraints(
                  maxHeight: items.length >= 8
                      ? context.sh(size: 0.8)
                      : context.sh(size: 0.4),
                  minHeight: context.sh(size: 0.4)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (items.isNotEmpty)
                      ...List.generate(items.length, (index) {
                        final item = items[index];
                        bool isSelected =
                            item == nextServiceReadingController.text;
                        return InkWell(
                          onTap: () {
                            nextServiceReadingController.text = item;
                            onSelected.call(item);
                            newState(() {});
                            Future.delayed(Duration(milliseconds: 300), () {
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                          child: CustomDropdownItem(
                            isSelected: isSelected,
                            label: item,
                          ),
                        );
                      })
                    else
                      Center(
                        child: Text(
                          "No $title items Found",
                          style: PlusJakartaFontPalette.f616161_14_400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            32.verticalSpace
          ],
        );
      }),
    );
  }

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
                          },
                          onChanged: (String data) {
                            provider.currentOodometerReading = data;
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
                          provider.nextOilChangeODOlController.clear();

                          // If input is empty, clear everything and return
                          if (data.isEmpty) {
                            provider.nextServiceReading = null;
                            provider.setValuesForAllRemainingFields();
                            return;
                          }

                          // Set the next service reading
                          provider.nextServiceReading = data;

                          // Check if we have valid current odometer and oil life data
                          if (_hasValidData(provider)) {
                            _calculateOilService(provider);
                          }

                          provider.setValuesForAllRemainingFields();
                          //
                        },
                        suffix: InkWell(
                          onTap: () {
                            _openBottomSheet(
                              context,
                              title: "Componet Life",
                              onSelected: (data) {
                                provider.remainingOilController.clear();
                                provider.remainingOil = null;
                                provider.nextOilChangeODOlController.clear();

                                // If input is empty, clear everything and return
                                if (data.isEmpty) {
                                  provider.nextServiceReading = null;
                                  provider.setValuesForAllRemainingFields();
                                  return;
                                }

                                // Set the next service reading
                                provider.nextServiceReading = data;

                                // Check if we have valid current odometer and oil life data
                                if (_hasValidData(provider)) {
                                  _calculateOilService(provider);
                                }

                                provider.setValuesForAllRemainingFields();
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              Assets.svgIosArrowDown,
                            ),
                          ),
                        ),
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

  // Helper method to check if we have valid data
  bool _hasValidData(AddServiceViewModel provider) {
    return (provider.currentOodometerReading?.isNotEmpty ?? false) &&
        (provider.nextServiceReading?.isNotEmpty ?? false) &&
        (provider.oilLife?.isNotEmpty ?? false);
  }

// Helper method to calculate oil service
  void _calculateOilService(AddServiceViewModel provider) {
    final currentOdo = int.parse(provider.currentOodometerReading!);
    final nextService = int.parse(provider.nextServiceReading!);
    final oilLifeKm = int.parse(provider.oilLife!);

    if (currentOdo < nextService) {
      // Normal case: Service is in the future
      final remainingKm = nextService - currentOdo;
      provider.remainingOilController.text = '$remainingKm';
      provider.nextOilChangeODOlController.text = '$nextService';
      provider.remainingOil = remainingKm.toString();
    } else {
      // Overdue case: Service was missed, calculate next service
      final nextOilChange = currentOdo + oilLifeKm;
      provider.nextOilChangeODOlController.text = '$nextOilChange';
      provider.remainingOilController.text = '$oilLifeKm';
      provider.remainingOil = provider.oilLife;
    }
  }
}
