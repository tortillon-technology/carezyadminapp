import 'dart:math';

import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../res/constants/string_constants.dart';
import '../../../../utils/routes/route_constants.dart';

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() =>
      _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late AnimationController _fadeTranslateController;

  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isForward = true;

  @override
  void initState() {
    super.initState();

    _initialiseAnimations();
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _fadeTranslateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SlideAndTranslateFloatItem(
            slideAnimation: _slideAnimation,
            fadeAnimation: _fadeAnimation,
            title: Strings.garage,
            icon: Assets.svgGarages,
          ),
          7.verticalSpace,
          SlideAndTranslateFloatItem(
            slideAnimation: _slideAnimation,
            fadeAnimation: _fadeAnimation,
            title: Strings.customer,
            icon: Assets.svgCustomers,
            onTap: () {
              _onFabPressed();
              Navigator.pushNamed(
                  context, RouteConstants.routeAddCustomerScreen);
            },
          ),
          7.verticalSpace,
          InkWell(
            onTap: _onFabPressed,
            child: Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                color: ColorPalette.primaryColor,
                shape: BoxShape.circle,
              ),
              child: AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28.w,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _initialiseAnimations() {
    // Rotation (0° to 90°)
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: pi / 2, // 90 degrees in radians
    ).animate(
        CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut));

    // Fade + Translate
    _fadeTranslateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _fadeTranslateController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3), // Slight downward offset
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _fadeTranslateController, curve: Curves.easeInOut));
  }

  void _onFabPressed() {
    if (_isForward) {
      _rotateController.forward();
      _fadeTranslateController.forward();
    } else {
      _rotateController.reverse();
      _fadeTranslateController.reverse();
    }
    _isForward = !_isForward;
  }
}

class SlideAndTranslateFloatItem extends StatelessWidget {
  const SlideAndTranslateFloatItem({
    super.key,
    required this.slideAnimation,
    required this.fadeAnimation,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;
  final String icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1AEC0008), // #EC00081A
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x17EC0008), // #EC000817
                    offset: Offset(5, 4),
                    blurRadius: 7,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0DEC0008), // #EC00080D
                    offset: Offset(12, 9),
                    blurRadius: 9,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x03EC0008), // #EC000803
                    offset: Offset(22, 17),
                    blurRadius: 11,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(
                        0x00EC0008), // #EC000800 (fully transparent, optional)
                    offset: Offset(34, 26),
                    blurRadius: 12,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: HexColor("#FFC9CB"))),
            width: 140.w,
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                12.horizontalSpace,
                Text(
                  title,
                  style: BaiFontPalette.fWhite_16_600.copyWith(
                    color: ColorPalette.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
