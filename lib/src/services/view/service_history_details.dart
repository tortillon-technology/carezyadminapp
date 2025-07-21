import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/common_switch_state.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/helpers/hex_color.dart';
import '../view_model/service_history_view_model.dart';

class ServiceHistoryDetailsScreen extends StatefulWidget {
  final String id;
  const ServiceHistoryDetailsScreen({super.key, required this.id});

  @override
  State<ServiceHistoryDetailsScreen> createState() =>
      _ServiceHistoryDetailsScreenState();
}

class _ServiceHistoryDetailsScreenState
    extends State<ServiceHistoryDetailsScreen> {
  late final ServiceHistoryViewModel viewModel;

  @override
  void initState() {
    viewModel = ServiceHistoryViewModel();
    afterInit(init);
    super.initState();
  }

  init() {
    viewModel.getServiceDetails(widget.id);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allServices = [
      "All Services",
      "Maintenance",
      "Engine",
      "Transmission",
      "Brake System"
    ];
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: HexColor("#F4F4F4"),
        appBar: CommonAppBar(
          titleText: "Service History",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Consumer<ServiceHistoryViewModel>(
            builder: (context, provider, child) {
          return CommonSwitchState(
            loader: provider.loaderState,
            child: Column(
              children: [
                23.verticalSpace,
                // SizedBox(
                //   height: 34.h,
                //   child: ListView.builder(
                //     itemCount: allServices.length,
                //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         margin: EdgeInsets.only(right: 8.w),
                //         padding: EdgeInsets.symmetric(horizontal: 12.w),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           color: index == 0 ? HexColor("#EC0008") : Colors.white,
                //           borderRadius: BorderRadius.circular(10.r),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Color(0x1A453132), // #4531321A (10% opacity)
                //               offset: Offset(0, 0),
                //               blurRadius: 1,
                //               spreadRadius: 0,
                //             ),
                //             BoxShadow(
                //               color: Color(0x17534F4F), // #534F4F17 (9% opacity)
                //               offset: Offset(0, 1),
                //               blurRadius: 1,
                //               spreadRadius: 0,
                //             ),
                //           ],
                //         ),
                //         child: Text(
                //           allServices[index],
                //           style: index == 0
                //               ? BaiFontPalette.fBlack_14_600
                //                   .copyWith(color: Colors.white)
                //               : BaiFontPalette.fBlack_14_600
                //                   .copyWith(color: HexColor('#2F2F2F')),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // 23.verticalSpace,
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.serviceLists.length,
                    itemBuilder: (context, index) {
                      final services = [
                        "Maintenance",
                        "Engine",
                        "Transmission",
                        "Brake System"
                      ];

                      final data = provider.serviceLists[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r)),
                        elevation: 0.2,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.serviceDate ?? "",
                                    style: PlusJakartaFontPalette.f6E6E6E_14_500
                                        .copyWith(
                                            color: HexColor("#EC0008"),
                                            fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    data.serviceNumber ?? "",
                                    style: PlusJakartaFontPalette.fBlack_12_600
                                        .copyWith(color: HexColor('#404142')),
                                  ),
                                ],
                              ),
                              18.verticalSpace,
                              Text(
                                data.serviceName ?? "",
                                style: BaiFontPalette.fBlack_16_600.copyWith(
                                    color: HexColor("#2F2F2F"),
                                    fontWeight: FontWeight.w700),
                              ),
                              12.verticalSpace,
                              Text(
                                data.description ?? "",
                                style: PlusJakartaFontPalette.f777777_13_600
                                    .copyWith(
                                        color: HexColor("#6E6E6E"),
                                        fontWeight: FontWeight.w500),
                              ),

                              16.verticalSpace,
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  ...List.generate(
                                    data.services.length,
                                    (i) {
                                      final ser = data.services[i];
                                      return Container(
                                        padding: EdgeInsets.all(8.w),
                                        margin: EdgeInsets.only(
                                            right: 8.w, bottom: 8.w),
                                        decoration: BoxDecoration(
                                          color: HexColor('#FFF7F0'),
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                        ),
                                        child: Text(
                                          ser,
                                          style: PlusJakartaFontPalette
                                              .f8E2A2E_13_500,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
