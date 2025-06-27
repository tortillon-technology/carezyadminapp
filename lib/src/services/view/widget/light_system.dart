import 'package:carezyadminapp/src/services/view/widget/light_status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class LightSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const LightSystem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    //SuspensionStatusSelector
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Container(
        width: context.sw(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        child:
            Consumer<AddServiceViewModel>(builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Light System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Head Light",
                selection: provider.headLight,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.headLight = selection;
                  });
                },
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Park Light",
                selection: provider.parkLight,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.parkLight = selection;
                  });
                },
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Indicators",
                selection: provider.indicators,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.indicators = selection;
                  });
                },
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Reverse Gear",
                selection: provider.reverseGearLight,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.reverseGearLight = selection;
                  });
                },
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Dim,Bright",
                selection: provider.dimBright,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.dimBright = selection;
                  });
                },
              ),
              26.verticalSpace,
              LightStatusSelector(
                title: "Fog Lamps",
                selection: provider.fogLamps,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fogLamps = selection;
                  });
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
