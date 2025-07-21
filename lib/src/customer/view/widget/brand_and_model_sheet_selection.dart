import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/custom_dropdown_button.dart';
import '../../../../utils/common_widgets/primary_button.dart';
import '../../model/brand_model.dart' as bm;
import '../../model/vehicle_model.dart' as vm;
import '../../view_model/edit_customer_view_model.dart';

void selectNewVehicle({
  required BuildContext context,
  required EditCustomerViewModel viewModel,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return VehicleBrandAndModelSelection(
        viewModel: viewModel,
      );
    },
  );
}

class VehicleBrandAndModelSelection extends StatefulWidget {
  final EditCustomerViewModel viewModel;
  const VehicleBrandAndModelSelection({super.key, required this.viewModel});

  @override
  State<VehicleBrandAndModelSelection> createState() =>
      _VehicleBrandAndModelSelectionState();
}

class _VehicleBrandAndModelSelectionState
    extends State<VehicleBrandAndModelSelection> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child:
          Consumer<EditCustomerViewModel>(builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Row(
                children: [
                  Text(
                    "Select Brand & Model",
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
                ],
              ),
              32.verticalSpace,
              Text(
                "Select Brand",
                style: BaiFontPalette.fBlack_14_600,
              ),
              16.verticalSpace,
              CustomDropdown(
                itemBuilder: (context, item) {
                  bool isSelected = provider.selectedBrand?.id == item.id;
                  return CustomDropdownItem(
                    label: item.nameEn,
                    isSelected: isSelected,
                  );
                },
                items: provider.brandsList,
                selectedLabel: provider.selectedBrand?.nameEn,
                title: "Brand",
                onSelected: (bm.Brand data) {
                  provider.update(
                    callback: () {
                      provider.update(callback: () {
                        provider.selectedBrand = data;
                        provider.getModels(data.id.toString());
                        provider.checkBrandModel();
                      });
                    },
                  );
                },
              ),
              20.verticalSpace,
              Text(
                "Select Model",
                style: BaiFontPalette.fBlack_14_600,
              ),
              16.verticalSpace,
              CustomDropdown(
                itemBuilder: (context, item) {
                  bool isSelected = provider.selectedModel?.id == item.id;
                  return CustomDropdownItem(
                    label: item.nameEn,
                    isSelected: isSelected,
                  );
                },
                items: provider.modelsList,
                isLoading: provider.modelsLoader,
                selectedLabel: provider.selectedModel?.nameEn,
                title: "Model",
                onSelected: (vm.Model data) {
                  provider.update(
                    callback: () {
                      provider.update(callback: () {
                        provider.selectedModel = data;
                        provider.checkBrandModel();
                      });
                    },
                  );
                },
              ),
              30.verticalSpace,
              PrimaryButton(
                text: "Save",
                onPressed: provider.checkSave
                    ? () {
                        provider.update(
                          callback: () {
                            provider.update(callback: () {
                              provider.customerDetails?.model?.id =
                                  provider.selectedModel?.id;
                              provider.customerDetails?.model?.nameEn =
                                  provider.selectedModel?.nameEn;
                              provider.customerDetails?.brand?.id =
                                  provider.selectedBrand?.id;
                              provider.customerDetails?.brand?.nameEn =
                                  provider.selectedBrand?.nameEn;
                              provider.customerDetails?.brand?.logo =
                                  provider.selectedBrand?.logoUrl;
                            });
                          },
                        );
                        Navigator.pop(context);
                      }
                    : null,
              ),
              16.verticalSpace,
            ],
          ),
        );
      }),
    );
  }
}
