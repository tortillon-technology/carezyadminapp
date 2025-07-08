import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/assets.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';

class GarageManagementScreen extends StatefulWidget {
  const GarageManagementScreen({super.key});

  @override
  State<GarageManagementScreen> createState() => _GarageManagementScreenState();
}

class _GarageManagementScreenState extends State<GarageManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F4F4F4"),
      appBar: CommonAppBar(
        titleText: "Garage Management",
        systemOverlay: homeSystemOverlay,
        textStyle: BaiFontPalette.fWhite_20_600,
        iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
        backgroundColor: ColorPalette.primaryColor,
        iconColor: Colors.white,
        textSpace: 16,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            11.verticalSpace,
            CommonTextFormFieldWithValidator(
              radius: 10.r,
              hintText: "Search Garage Name/ Reg.No",
              suffix: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: SvgPicture.asset(
                  Assets.svgSearch,
                  colorFilter: ColorFilter.mode(
                      ColorPalette.primaryColor, BlendMode.srcIn),
                ),
              ),
            ),
            18.verticalSpace,
            Text(
              'Garages',
              style: BaiFontPalette.fBlack_18_600,
            ),
            10.verticalSpace,
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  ...List.generate(
                    100,
                    (index) {
                      bool isLast = index == 99;
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          margin: EdgeInsets.only(bottom: isLast ? 0 : 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "M.R.T Workshop",
                                      style:
                                          PlusJakartaFontPalette.fBlack_14_600,
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      "Tesla EV Model 3",
                                      style:
                                          PlusJakartaFontPalette.f6E6E6E_12_500,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "12A168",
                                style: PlusJakartaFontPalette.f6E6E6E_14_500,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  100.verticalSpace,
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            width: 210.w,
            height: 60.h,
            text: "Add New Garage",
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
