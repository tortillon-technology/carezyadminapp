import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/common_widgets/common_text_form.dart';
import '../../../../utils/routes/route_constants.dart';

class SearchCustomer extends StatelessWidget {
  final AddServiceViewModel viewModel;

  const SearchCustomer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select User by Phone Number",
            style: PlusJakartaFontPalette.f1C1C1C_14_600,
          ),
          16.verticalSpace,
          CommonTextFormFieldWithValidator(
            hintText: "Search  pho.no",
            readOnly: true,
            suffix: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset(
                Assets.svgSearch,
                width: 24.w,
                colorFilter: ColorFilter.mode(
                    ColorPalette.primaryColor, BlendMode.srcIn),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, RouteConstants.routeSearchCustomerScreen,
                  arguments: viewModel);
            },
          ),
        ],
      ),
    );
  }
}
