import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../generated/assets.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/common_widgets/custom_dropdown_button.dart';
import '../../../customer/model/garage_model.dart';

class CustomerAndVehicle extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const CustomerAndVehicle({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
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
                        arguments: viewModel);
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
