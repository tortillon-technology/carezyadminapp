import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/constants/app_constants.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/local/shared_service.dart';
import '../../../utils/routes/route_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = [
    /*  MenuItem(
        icon: Assets.svgProfile,
        title: 'Edit Profile',
        iconColor: Colors.red,
        onTap: () {
          //Navigator.pushNamed(context, RouteConstants.routeEditProfileScreen);
        },
      ),*/
      MenuItem(
        icon: Assets.svgLanguage,
        title: 'Change Language',
        iconColor: Colors.red,
        onTap: () {
          // Handle language change
        },
      ),
      MenuItem(
        icon: Assets.svgLogout,
        title: 'Logout',
        iconColor: Colors.red,
        onTap: () {
          showLogoutDialog(context);
        },
      ),
    ];
    return Scaffold(
      backgroundColor: HexColor("#F4F4F4"),
      appBar: CommonAppBar(
        titleText: "Settings",
        systemOverlay: homeSystemOverlay,
        textStyle: BaiFontPalette.fWhite_20_600,
        iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
        backgroundColor: ColorPalette.primaryColor,
        iconColor: Colors.white,
        textSpace: 16,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: item.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
              child: Row(
                children: [
                  SvgPicture.asset(item.icon),
                  12.horizontalSpace,
                  Expanded(
                      child: Text(
                    item.title,
                    style: BaiFontPalette.fBlack_16_600.copyWith(
                      color: HexColor('#2F2F2F'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  SvgPicture.asset(Assets.svgArrowRight),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: HexColor('#DFD5C5').withValues(alpha: 0.56),
      builder: (context) => Logout(),
    );
  }
}

class MenuItem {
  final String icon;
  final String title;
  final Color iconColor;
  final VoidCallback onTap;

  MenuItem({
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.onTap,
  });
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure\nyou want to log out?",
              textAlign: TextAlign.center,
              style: BaiFontPalette.fBlack_16_600.copyWith(
                color: HexColor('#2F2F2F'),
                fontWeight: FontWeight.w700,
              ),
            ),
            23.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logout Button
                Expanded(
                  child: PrimaryButton(
                    text: "Logout",
                    height: 50.h,
                    onPressed: () {
                      SharedService.instance.clearData(allowList: {
                        accessTokenKey,
                        refreshTokenKey,
                        garageId
                      });
                      AppConstants.accessToken = '';
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteConstants.routeSignInScreen,
                        (route) => false,
                      );
                    },
                  ),
                ),

                16.horizontalSpace,

                // Cancel Button
                Expanded(
                  child: PrimaryButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    borderWidth: 1,
                    isOutlined: true,
                    height: 50.h,
                    textColor: HexColor('#EC0008'),
                    borderColor: HexColor('#EC0008'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
