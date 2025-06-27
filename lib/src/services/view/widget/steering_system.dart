import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../view_model/add_service_view_model.dart';

class SteeringSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const SteeringSystem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
                    "Steering System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering Boot Left",
                selection: provider.sbl,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sbl = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering Boot Right",
                selection: provider.sbr,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sbr = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering End Left",
                selection: provider.sel,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.sel = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Steering End Right",
                selection: provider.ser,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.ser = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Ball Joint Left",
                selection: provider.bjl,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.bjl = selection;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Ball Joint Right",
                selection: provider.bjr,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.bjr = selection;
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
