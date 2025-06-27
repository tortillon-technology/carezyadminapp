import 'package:carezyadminapp/src/services/view/widget/status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class BreakSystem extends StatefulWidget {
  final AddServiceViewModel viewModel;
  const BreakSystem({super.key, required this.viewModel});

  @override
  State<BreakSystem> createState() => _BreakSystemState();
}

class _BreakSystemState extends State<BreakSystem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
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
                    "Break System",
                    style: PlusJakartaFontPalette.fBlack_16_600,
                  )
                ],
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Front Left Break Disc",
                showPercentage: true,
                selection: provider.flBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.flBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.flbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Front Right Break Disc",
                showPercentage: true,
                selection: provider.frBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.frBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.frbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Rear Left Break Disc",
                showPercentage: true,
                selection: provider.rlBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rlBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rlbdPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Rear Right Break Disc",
                showPercentage: true,
                selection: provider.rrBreakDisc,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rrBreakDisc = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rrbdPercentage = percentage;
                  });
                },
              ),
              //

              26.verticalSpace,
              StatusSelector(
                title: "Front Break Pad",
                showPercentage: true,
                selection: provider.fbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.fbPad = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.fbPadPercentage = percentage;
                  });
                },
              ),
              26.verticalSpace,
              StatusSelector(
                title: "Rear Break Pad",
                showPercentage: true,
                selection: provider.rbPad,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbPad = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbPadPercentage = percentage;
                  });
                },
              ),

              26.verticalSpace,
              StatusSelector(
                title: "Rear Break Shoe",
                showPercentage: true,
                selection: provider.rbShoe,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.rbShoe = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.rbShoePercentage = percentage;
                  });
                },
              ),

              26.verticalSpace,
              StatusSelector(
                title: "Break Fluid",
                showPercentage: true,
                selection: provider.breakFluid,
                onSelection: (selection) {
                  provider.update(callBack: () {
                    provider.breakFluid = selection;
                  });
                },
                onPercentageChange: (percentage) {
                  provider.update(callBack: () {
                    provider.breakFluidPercentage = percentage;
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
