import 'package:carezyadminapp/res/constants/string_constants.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/routes/route_constants.dart';

class RecentCustomer extends StatelessWidget {
  const RecentCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sw(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          37.verticalSpace,
          Text(
            Strings.recentCustomer,
            style: BaiFontPalette.fBlack_18_600,
          ),
          20.verticalSpace,
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.pushNamed(
                    //     context, RouteConstants.routeCustomerDetailsScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor("#FAFAFA"),
                        borderRadius: BorderRadius.circular(16.r)),
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Emma Wilson",
                                style: PlusJakartaFontPalette.fBlack_14_600,
                              ),
                              4.verticalSpace,
                              Text(
                                "Tesla EV Model 3",
                                style: PlusJakartaFontPalette.f6E6E6E_15_500,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Service",
                              style: PlusJakartaFontPalette.fBlack_12_400,
                            ),
                            Text(
                              "Apr 28 2025",
                              style: PlusJakartaFontPalette.fBlack_12_600,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 8.verticalSpace,
              itemCount: 20)
        ],
      ),
    );
  }
}
