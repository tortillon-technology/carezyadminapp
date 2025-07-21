import 'package:carezyadminapp/src/customer/model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/string_constants.dart';
import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../utils/common_widgets/custom_dropdown_button.dart';
import '../../view_model/customer_view_model.dart';

class SelectModel extends StatefulWidget {
  const SelectModel({super.key});

  @override
  State<SelectModel> createState() => _SelectModelState();
}

class _SelectModelState extends State<SelectModel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Consumer<CustomerViewModel>(builder: (context, provider, child) {
        print(provider.modelsList);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Text(
              Strings.selectModel,
              style: BaiFontPalette.fBlack_18_600,
            ),
            24.verticalSpace,
            CustomDropdown(
              itemBuilder: (context, item) {
                bool isSelected = provider.selectedModel?.id == item.id;
                return CustomDropdownItem(
                  label: item.nameEn,
                  isSelected: isSelected,
                );
              },
              items: provider.modelsList,
              selectedLabel: provider.selectedModel?.nameEn,
              title: "Model",
              onSelected: (Model data) {
                provider.update(
                  callback: () {
                    provider.selectedModel = data;
                    provider.checkModel();
                  },
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
