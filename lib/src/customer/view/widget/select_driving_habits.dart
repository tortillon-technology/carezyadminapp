import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/string_constants.dart';
import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../view_model/customer_view_model.dart';

class SelectDrivingHabits extends StatefulWidget {
  const SelectDrivingHabits({super.key});

  @override
  State<SelectDrivingHabits> createState() => _SelectDrivingHabitsState();
}

class _SelectDrivingHabitsState extends State<SelectDrivingHabits> {
  @override
  Widget build(BuildContext context) {
    List<String> kms = [
      "10-50 Km/week|10-50",
      "50-100 Km/week|50-100",
      "100-500 Km/week|100-500",
      "More than 500 km / week|500"
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Consumer<CustomerViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Text(
              Strings.selectYourDrivingHabits,
              style: BaiFontPalette.fBlack_18_600,
            ),
            14.verticalSpace,
            Text(
              Strings.howFarDoYou,
              style: BaiFontPalette.fBlack_16_500
                  .copyWith(color: HexColor("#464646")),
            ),
            32.verticalSpace,
            ...List.generate(
              kms.length,
              (index) {
                bool isNotLast = kms.length - 1 != index;
                bool isSelected =
                    provider.drivingRange == kms[index].split('|').last;
                return InkWell(
                  onTap: () {
                    provider.update(
                      callback: () {
                        provider.drivingRange = kms[index].split('|').last;
                        provider.checkDrivingRange();
                      },
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: context.sw(),
                    margin: EdgeInsets.only(bottom: isNotLast ? 14.h : 0),
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: isSelected
                          ? HexColor('#FFF7F3')
                          : HexColor("#FFFFFF"),
                      border: Border.all(
                        color: isSelected
                            ? HexColor('#EC0008')
                            : HexColor("#E8E8E8"),
                      ),
                    ),
                    child: Text(
                      kms[index].split('|').first,
                      style: PlusJakartaFontPalette.fBlack_16_600,
                    ),
                  ),
                );
              },
            )
          ],
        );
      }),
    );
  }
}
