

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../utils/common_widgets/primary_button.dart';
import '../../../../utils/helpers/hex_color.dart';

void  customerDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: HexColor('#DFD5C5').withValues(alpha: 0.56),
    builder: (context) => CustomerDeleteDialog(),
  );
}

class CustomerDeleteDialog extends StatelessWidget {
  const CustomerDeleteDialog({super.key});

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
              "Are you sure you want\nto delete this customer?",
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
                    text: "Delete",
                    height: 50.h,
                    onPressed: () {
                      // SharedService.instance.clearData(allowList: {
                      //   accessTokenKey,
                      //   refreshTokenKey,
                      //   garageId
                      // });
                      // AppConstants.accessToken = '';
                      // Navigator.pushNamedAndRemoveUntil(
                      //   context,
                      //   RouteConstants.routeSignInScreen,
                      //       (route) => false,
                      // );
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