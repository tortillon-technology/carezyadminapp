import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/create_vehicle_recovery_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/recovery_vehicle_details_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/vehicle_recovery_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_switch_state.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/primary_button.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';
import '../../../utils/routes/route_constants.dart';

class RecoveryVehicleScreen extends StatefulWidget {
  const RecoveryVehicleScreen({super.key});

  @override
  State<RecoveryVehicleScreen> createState() => _RecoveryVehicleScreenState();
}

class _RecoveryVehicleScreenState extends State<RecoveryVehicleScreen> {
  late final VehicleRecoveryViewModel viewModel;

  @override
  void initState() {
    viewModel = VehicleRecoveryViewModel();
    afterInit(_load);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  _load() {
    viewModel.getVehiclesList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: HexColor("#F4F4F4"),
        appBar: CommonAppBar(
          titleText: "Recovery Vehicles",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Consumer<VehicleRecoveryViewModel>(
            builder: (context, provider, child) {
          return CommonSwitchState(
            loader: provider.loaderState,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    provider.vehiclesList.length,
                    (index) {
                      bool isNotLast =
                          index != provider.vehiclesList.length - 1;
                      final item = provider.vehiclesList[index];
                      return Container(
                        padding: EdgeInsets.all(16.w),
                        margin: EdgeInsets.only(bottom: isNotLast ? 8.h : 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteConstants.routeRecoveryVehicleDetailsScreen,
                              arguments: RecoveryArguments(
                                  viewModel: viewModel, id: item.id ?? 0),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (item.name ?? "").capitalizeEachLetter(),
                                      style:
                                          PlusJakartaFontPalette.fBlack_14_600,
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      (item.city ?? "").capitalizeEachLetter(),
                                      style:
                                          PlusJakartaFontPalette.f6E6E6E_12_500,
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(Assets.svgArrowRight)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  100.verticalSpace,
                ],
              ),
            ),
          );
        }),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              width: 210.w,
              height: 60.h,
              text: "Add New Vehicle",
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteConstants.routeCreateVehicleRecoveryScreen,
                    arguments: CreateVehicleRecoveryArguments(callBack: _load));
              },
            )
          ],
        ),
      ),
    );
  }
}
