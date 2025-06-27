import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/constants/string_constants.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';

class ServiceRecordsScreen extends StatefulWidget {
  const ServiceRecordsScreen({super.key});

  @override
  State<ServiceRecordsScreen> createState() => _ServiceRecordsScreenState();
}

class _ServiceRecordsScreenState extends State<ServiceRecordsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        titleText: Strings.serviceRecords,
        systemOverlay: homeSystemOverlay,
        textStyle: BaiFontPalette.fWhite_20_600,
        iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
        backgroundColor: ColorPalette.primaryColor,
        iconColor: Colors.white,
        textSpace: 16,
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            width: 210.w,
            height: 60.h,
            text: "Add New Service",
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, RouteConstants.routeAddServiceScreen);
            },
          )
        ],
      ),
    );
  }
}
