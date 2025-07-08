import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/constants/string_constants.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/home/model/home_card_model.dart';
import 'package:carezyadminapp/src/home/view/widget/home_card_widget.dart';
import 'package:carezyadminapp/src/home/view/widget/home_floating_action_button.dart';
import 'package:carezyadminapp/src/home/view/widget/home_services.dart';
import 'package:carezyadminapp/src/home/view/widget/recent_customer.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/helpers/common_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeCardModel> cards = [
    HomeCardModel(
      key: 0,
      svg: Assets.svgGarages,
      title: Strings.totalGarage,
      count: 15,
    ),
    HomeCardModel(
      key: 1,
      svg: Assets.svgCustomers,
      title: Strings.totalCustomers,
      count: 250,
    ),
    HomeCardModel(
      key: 2,
      svg: Assets.svgTodaysServices,
      title: Strings.todaysServices,
      count: 45,
    ),
    HomeCardModel(
      key: 3,
      svg: Assets.svgTotalServices,
      title: Strings.pendingServices,
      count: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        systemOverlayStyle:homeSystemOverlay,
        title: Image.asset(
          Assets.pngProCareSplashLogo,
          width: 140.w,
        ).fadeIn(),
        actions: [
          16.horizontalSpace,
          SvgPicture.asset(Assets.svgSearch),
          24.horizontalSpace,
          SizedBox(
            width: 30.w,
            height: 28.w,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SvgPicture.asset(
                  Assets.svgNotification,
                  width: 24.w,
                  height: 24.w,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "4",
                      style: PlusJakartaFontPalette.fWhite_11_500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          16.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCardWidget(cards: cards),
            Container(
              width: context.sw(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 29.h),
              child: Column(
                children: [
                  HomeServices(),
                  RecentCustomer(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: HomeFloatingActionButton(),
    );
  }
}
