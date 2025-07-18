import 'package:carezyadminapp/data/local/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../res/constants/string_constants.dart';
import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../utils/helpers/hex_color.dart';
import '../../../../utils/routes/route_constants.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({super.key});

  final List<Map> services = const [
    {
      "svg": Assets.svgCustomerManagement,
      "title": Strings.customerManagement,
      "route": RouteConstants.routeCustomerManagementScreen,
    },
    {
      "svg": Assets.svgGarageManagement,
      "title": Strings.garageManagement,
      "route": RouteConstants.routeGarageManagementScreen
    },
    {
      "svg": Assets.svgServiceRecords,
      "title": Strings.serviceRecords,
      "route": RouteConstants.routeServiceRecordsScreen,
    },
    {
      "svg": Assets.svgNotificationManagement,
      "title": Strings.notificationManagement,
    },
    {
      "svg": Assets.svgNotificationManagement,
      "title": Strings.recoveryVehicles,
      "route": RouteConstants.routeRecoveryVehicleScreen
    },
    {
      "svg": Assets.svgSettings,
      "title": Strings.settings,
      'route': RouteConstants.routeSettingsScreen,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: services.length,
      separatorBuilder: (context, index) => 8.verticalSpace,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (services[index]['route'] != null) {
                Navigator.pushNamed(context, services[index]['route']);
              } else {
                // SharedService.instance
                //     .clearData(allowList: {accessTokenKey, refreshTokenKey});
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   RouteConstants.routeSignInScreen,
                //   (route) => false,
                // );
              }
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Ink(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: HexColor("#EBEBEB")),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x17FFB3B3), // alpha first in Flutter (ARGB)
                      offset: Offset(3, 3),
                      blurRadius: 5,
                      spreadRadius: 0,
                    )
                  ]),
              child: Row(
                children: [
                  SvgPicture.asset(services[index]['svg']),
                  14.horizontalSpace,
                  Expanded(
                    child: Text(
                      services[index]['title'],
                      style: BaiFontPalette.fBlack_16_600,
                    ),
                  ),
                  SvgPicture.asset(Assets.svgArrowRight),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
