import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class OtherAccessories extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const OtherAccessories({super.key, required this.viewModel});

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
                    "Other Accessories",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Center Lock",
                selection: provider.centerLock,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.centerLock = selection;
                  });
                },
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Remarks",
                onChanged: (String data) {
                  provider.clRemarks = data;
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Window Lifter",
                selection: provider.windowLifter,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.windowLifter = selection;
                  });
                },
              ),
              18.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Remarks",
                onChanged: (String data) {
                  provider.wlRemarks = data;
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Alignment",
                selection: provider.alignment,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.alignment = selection;
                  });
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Wheel Balance",
                selection: provider.wheelBalance,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wheelBalance = selection;
                  });
                },
              ),
              //
              26.verticalSpace,
              StatusSelector(
                title: "Wiper Blade Front",
                selection: provider.wiperBladeFront,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeFront = selection;
                  });
                },
              ),

              //
              26.verticalSpace,
              StatusSelector(
                title: "Wiper Blade Rear",
                selection: provider.wiperBladeRear,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.wiperBladeRear = selection;
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
