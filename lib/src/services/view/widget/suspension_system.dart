import 'package:carezyadminapp/src/services/view/widget/suspension_status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class SuspensionSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const SuspensionSystem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    //SuspensionStatusSelector
    return Container(
      width: context.sw(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Consumer<AddServiceViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Suspension System",
                  style: PlusJakartaFontPalette.fBlack_16_600,
                )
              ],
            ),
            26.verticalSpace,

            SuspensionStatusSelector(
              title: "Front Left Lower Arm",
              selection: provider.flla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.flla = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Front Right Lower Arm",
              selection: provider.frla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.frla = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Rear Left Lower Arm",
              selection: provider.rlla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rlla = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Rear Right Lower Arm",
              selection: provider.rrla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rrla = s;
                });
              },
            ),
            26.verticalSpace,

            ////
            SuspensionStatusSelector(
              title: "Upper Arm Front Left",
              selection: provider.uafl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafl = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Upper Arm Front Right",
              selection: provider.uafr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafr = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Trailor Arm Rear",
              selection: provider.tar,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.tar = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Left Inner",
              selection: provider.abli,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abli = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Right Inner",
              selection: provider.abri,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abri = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Right Outer",
              selection: provider.abro,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abro = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Axle Boot Left Outer",
              selection: provider.ablo,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.ablo = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Front Left",
              selection: provider.lrfl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfl = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Front Right",
              selection: provider.lrfr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfr = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Rear Left",
              selection: provider.lrrl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrl = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Link Rod Rear Right",
              selection: provider.lrrr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrr = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Balance Rod Bush Front",
              selection: provider.brbf,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbf = s;
                });
              },
            ),
            26.verticalSpace,
            SuspensionStatusSelector(
              title: "Balance Rod Bush Rear",
              selection: provider.brbr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbr = s;
                });
              },
            ),
          ],
        );
      }),
    );
  }
}
