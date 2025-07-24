import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/services/view_model/service_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/common_switch_state.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final ServiceViewModel viewModel;

  const ServiceDetailsScreen({super.key, required this.viewModel});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    afterInit(_initialise);
    super.initState();
  }

  _initialise() {
    widget.viewModel.getServiceDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: Scaffold(
        backgroundColor: HexColor("#F4F4F4"),
        appBar: CommonAppBar(
          titleText: "Service Details",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Consumer<ServiceViewModel>(builder: (context, provider, child) {
          final data = provider.serviceDetails?.results?.data;
          final srvNumber = data?.serviceNumber ?? "";
          final vehicle = data?.vehicleName ?? "";
          final regNumber = data?.registrationNumber ?? "";
          final serviceDate = data?.serviceDate ?? "";
          final vinNumber = data?.vinNumber ?? "";
          return CommonSwitchState(
            loader: provider.loaderState,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  elevation: 0.2,
                  color: Colors.white,
                  margin: EdgeInsets.all(20.w),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Service number',
                                  style: PlusJakartaFontPalette.f6E6E6E_14_500
                                      .copyWith(color: HexColor("#707070")),
                                ),
                                Text(
                                  srvNumber,
                                  style: BaiFontPalette.fBlack_16_600.copyWith(
                                      color: HexColor("#2F2F2F"),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Text(
                              serviceDate,
                              style: PlusJakartaFontPalette.f6E6E6E_14_500
                                  .copyWith(
                                      color: HexColor("#EC0008"),
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        22.verticalSpace,

                        Text(
                          'Vehicle',
                          style: PlusJakartaFontPalette.f6E6E6E_14_500
                              .copyWith(color: HexColor("#707070")),
                        ),
                        Text(
                          vehicle,
                          style: BaiFontPalette.fBlack_16_600.copyWith(
                              color: HexColor("#2F2F2F"),
                              fontWeight: FontWeight.w700),
                        ),

                        22.verticalSpace,
                        Text(
                          'Reg No',
                          style: PlusJakartaFontPalette.f6E6E6E_14_500
                              .copyWith(color: HexColor("#707070")),
                        ),
                        Text(
                          regNumber,
                          style: BaiFontPalette.fBlack_16_600.copyWith(
                              color: HexColor("#2F2F2F"),
                              fontWeight: FontWeight.w700),
                        ),

                        22.verticalSpace,
                        Text(
                          'VIN Number',
                          style: PlusJakartaFontPalette.f6E6E6E_14_500
                              .copyWith(color: HexColor("#707070")),
                        ),
                        Text(
                          vinNumber,
                          style: BaiFontPalette.fBlack_16_600.copyWith(
                              color: HexColor("#2F2F2F"),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
