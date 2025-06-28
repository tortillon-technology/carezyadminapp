import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        titleText: "Customer Details",
        systemOverlay: homeSystemOverlay,
        textStyle: BaiFontPalette.fWhite_20_600,
        iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
        backgroundColor: ColorPalette.primaryColor,
        iconColor: Colors.white,
        textSpace: 16,
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: PrimaryButton(
              text: "Add New Service Entry",
              borderRadius: 10.r,
              icon: SvgPicture.asset(
                Assets.svgFile,
                colorFilter:
                    ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteConstants.routeAddServiceScreen);
              },
            ),
          ),
          13.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: PrimaryButton(
              text: "View Service History",
              borderRadius: 10.r,
              isOutlined: true,
              textColor: ColorPalette.primaryColor,
              backgroundColor: Colors.white,
              borderColor: ColorPalette.primaryColor,
              splashColor: ColorPalette.primaryColor.mimicOpacityColor(0.06),
              highlightColor: ColorPalette.primaryColor.mimicOpacityColor(0.04),
              icon: SvgPicture.asset(
                Assets.svgServiceHistory,
                colorFilter: ColorFilter.mode(
                    ColorPalette.primaryColor, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
