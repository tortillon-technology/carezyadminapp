import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/view_model/customer_view_model.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/string_constants.dart';
import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../utils/common_widgets/custom_dropdown_button.dart';

class SelectGarage extends StatefulWidget {
  final CustomerViewModel viewModel;

  const SelectGarage({super.key, required this.viewModel});

  @override
  State<SelectGarage> createState() => _SelectGarageState();
}

class _SelectGarageState extends State<SelectGarage> {
  @override
  void initState() {
    afterInit(init);
    super.initState();
  }

  init() {
    if (widget.viewModel.garageList.isEmpty &&
        widget.viewModel.arguments == null) {
      widget.viewModel.getGarages();
    } else {
      widget.viewModel.update(callback: () {
        final args = widget.viewModel.arguments;
        widget.viewModel.selectedGarage =
            Garage(id: args?.garageId, name: args?.garageName);
        widget.viewModel.checkGarage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Consumer<CustomerViewModel>(builder: (context, provider, child) {
        final args = widget.viewModel.arguments;
        final hasData = args?.garageId != null && args?.garageName != null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Text(
              Strings.selectGarage,
              style: BaiFontPalette.fBlack_18_600,
            ),
            24.verticalSpace,
            AbsorbPointer(
              absorbing: hasData,
              child: CustomDropdown(
                itemBuilder: (context, item) {
                  bool isSelected = provider.selectedGarage?.id == item.id;
                  return CustomDropdownItem(
                    label: item.name,
                    isSelected: isSelected,
                  );
                },
                items: provider.garageList,
                selectedLabel: provider.selectedGarage?.name,
                title: "Garage",
                color: hasData ? Colors.grey[200] : Colors.white,
                onSelected: (Garage data) {
                  provider.update(
                    callback: () {
                      provider.selectedGarage = data;
                      provider.checkGarage();
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
