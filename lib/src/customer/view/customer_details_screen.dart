import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/customer/model/customer_details_model.dart';
import 'package:carezyadminapp/src/customer/model/health_report_model.dart';
import 'package:carezyadminapp/src/customer/view_model/customer_details_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:tuple/tuple.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';
import 'edit_customer_detail_screen.dart';
import 'widget/customer_delete_dialog.dart';
import 'widget/pdf_bottom_sheet_uploader.dart';

class CustDetailsArguments {
  final String customerId;
  final Function()? callBack;

  CustDetailsArguments({this.callBack, required this.customerId});
}

class CustomerDetailsScreen extends StatefulWidget {
  final CustDetailsArguments arguments;
  const CustomerDetailsScreen({super.key, required this.arguments});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  void showPdfUploadSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => PdfBottomSheetUploader(
        customerId: widget.arguments.customerId,
        onSuccess: () async {
          viewModel.getHealthReports(int.parse(widget.arguments.customerId));
          await Future.delayed(Duration(milliseconds: 200));
          toastification.show(
              title: Text(
                "Health Report Uploaded Successfully",
                style: PlusJakartaFontPalette.fBlack_12_400.copyWith(
                  color: Colors.green,
                ),
              ),
              autoCloseDuration: const Duration(seconds: 5),
              style: ToastificationStyle.simple,
              alignment: Alignment.bottomCenter,
              type: ToastificationType.success,
              borderSide: BorderSide(
                color: Colors.green,
              ));
        },
      ),
    );
  }

  late final CustomerDetailsViewModel viewModel;

  @override
  void initState() {
    viewModel = CustomerDetailsViewModel();
    afterInit(_load);
    super.initState();
  }

  _load() {
    viewModel.getCustomerDetails(int.parse(widget.arguments.customerId));
    viewModel.getHealthReports(int.parse(widget.arguments.customerId));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          titleText: "Customer Details",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
          actions: [
            Selector<CustomerDetailsViewModel, LoaderState>(
                selector: (context, p1) => p1.isLoading,
                builder: (context, loader, child) {
                  bool isLoaded = loader == LoaderState.loaded;
                  return !isLoaded
                      ? SizedBox.shrink()
                      : PopupMenuButton<String>(
                          color: Colors.white,
                          icon: Icon(Icons.more_vert,
                              color: Colors.white, size: 24.sp),
                          onSelected: (value) {
                            if (value == 'edit') {
                              Navigator.pushNamed(
                                context,
                                RouteConstants.routeEditCustomerDetailsScreen,
                                arguments: EditCustArguments(
                                  customerData: viewModel.customerDetails,
                                  callBack: () {
                                    widget.arguments.callBack?.call();
                                    viewModel.getCustomerDetails(
                                        int.parse(widget.arguments.customerId));
                                  },
                                ),
                              );
                            } else if (value == 'delete') {
                              customerDeleteDialog(context, onDelete: () async {
                                bool? isSuccess = await viewModel.delete(
                                    int.parse(widget.arguments.customerId));
                                if ((isSuccess ?? false) && context.mounted) {
                                  widget.arguments.callBack?.call();
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: Text('Edit Details',
                                  style: TextStyle(fontSize: 14.sp)),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Delete',
                                  style: TextStyle(fontSize: 14.sp)),
                            ),
                          ],
                        );
                }),
          ],
        ),
        body: Selector<CustomerDetailsViewModel, bool>(
            selector: (_, p1) => p1.isDeleting,
            builder: (_, isDeleting, child) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: Column(
                      children: [
                        Selector<CustomerDetailsViewModel,
                                Tuple2<CustomerDetails?, LoaderState>>(
                            selector: (_, p1) =>
                                Tuple2(p1.customerDetails, p1.isLoading),
                            builder: (_, data, child) {
                              final details = data.item1;

                              if (data.item2 == LoaderState.loading) {
                                return Column(
                                  children: [
                                    ...List.generate(
                                        5,
                                        (index) => Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.h),
                                              child: Container(
                                                height: 76.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: HexColor("#F4F4F4"),
                                                ),
                                              ),
                                            ))
                                  ],
                                );
                              } else if (data.item2 == LoaderState.error) {
                                return SizedBox(
                                    height: context.sh(size: .7),
                                    child: Center(
                                      child: Text(
                                        "No data",
                                        style: PlusJakartaFontPalette
                                            .fBlack_14_600,
                                      ),
                                    ));
                              } else {
                                return Column(
                                  children: [
                                    buildInfoTile("Name", details?.nameEn),
                                    buildInfoTile("Email", details?.email),
                                    buildInfoTile(
                                        "Phone Number", details?.phoneNumber),
                                    buildInfoTile(
                                        "Vehicle", details?.model?.nameEn),
                                    buildInfoTile(
                                        "Reg No.", details?.registrationNumber),
                                    buildInfoTile(
                                        "VIN Number", details?.vinNumber),
                                    buildInfoTile("Driving Habits",
                                        "${details?.drivingHabit ?? "0"} Km/week"),
                                  ],
                                );
                              }
                            }),
                        20.verticalSpace,
                        Selector<CustomerDetailsViewModel,
                            Tuple2<List<Report>, bool>>(
                          selector: (_, p1) =>
                              Tuple2(p1.reportList, p1.isReportLoading),
                          builder: (_, data, child) {
                            final reportList = data.item1;
                            return data.item2
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                          5,
                                          (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.h),
                                                child: Container(
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    color: HexColor("#F4F4F4"),
                                                  ),
                                                ),
                                              ))
                                    ],
                                  )
                                : reportList.isEmpty
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: context.sw(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Health Reports",
                                                style: BaiFontPalette
                                                    .fBlack_18_600),
                                            16.verticalSpace,
                                            ...List.generate(
                                              reportList.length,
                                              (index) {
                                                bool isNotLast = index !=
                                                    reportList.length - 1;
                                                final reportName =
                                                    reportList[index]
                                                        .reportName;
                                                final date = reportList[index]
                                                    .uploadedDate;
                                                return Container(
                                                  padding: EdgeInsets.all(16.w),
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          isNotLast ? 8.h : 0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: HexColor(
                                                            "#F6E5E5")),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 40.w,
                                                        height: 40.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: HexColor(
                                                                    '#FFF0E9')),
                                                        alignment:
                                                            Alignment.center,
                                                        child: SvgPicture.asset(
                                                          Assets.svgPdf,
                                                          width: 16.w,
                                                        ),
                                                      ),
                                                      12.horizontalSpace,
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            reportName ?? '',
                                                            style: PlusJakartaFontPalette
                                                                .f1C1C1C_14_600
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          ),
                                                          Text(
                                                            date ?? '',
                                                            style: PlusJakartaFontPalette
                                                                .f777777_13_600
                                                                .copyWith(
                                                                    color: HexColor(
                                                                        '#6E6E6E'),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (isDeleting)
                    Container(
                      height: context.sh(),
                      width: context.sw(),
                      color: Colors.black38,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    )
                ],
              );
            }),
        bottomNavigationBar: Selector<CustomerDetailsViewModel, LoaderState>(
            selector: (p0, selector) => selector.isLoading,
            builder: (context, loader, child) {
              bool isLoaded = loader == LoaderState.loaded;
              return isLoaded
                  ? SafeArea(
                      bottom: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: PrimaryButton(
                              text: "Upload Health Report",
                              borderRadius: 10.r,
                              icon: Icon(Icons.upload_file_outlined,
                                  color: Colors.white),
                              onPressed: () {
                                showPdfUploadSheet(context);
                              },
                            ),
                          ),
                          13.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: PrimaryButton(
                              text: "Add New Service Entry",
                              borderRadius: 10.r,
                              icon: SvgPicture.asset(
                                Assets.svgFile,
                                colorFilter: ColorFilter.mode(
                                    ColorPalette.white, BlendMode.srcIn),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    RouteConstants.routeAddServiceScreen);
                              },
                            ),
                          ),
                          13.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: PrimaryButton(
                              text: "View Service History",
                              borderRadius: 10.r,
                              isOutlined: true,
                              textColor: ColorPalette.primaryColor,
                              backgroundColor: Colors.white,
                              borderColor: ColorPalette.primaryColor,
                              splashColor: ColorPalette.primaryColor
                                  .mimicOpacityColor(0.06),
                              highlightColor: ColorPalette.primaryColor
                                  .mimicOpacityColor(0.04),
                              icon: SvgPicture.asset(
                                Assets.svgServiceHistory,
                                colorFilter: ColorFilter.mode(
                                    ColorPalette.primaryColor, BlendMode.srcIn),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteConstants
                                      .routeServiceHistoryDetailsScreen,
                                  arguments: widget.arguments.customerId,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink();
            }),
      ),
    );
  }

  Widget buildInfoTile(String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PlusJakartaFontPalette.f6E6E6E_14_500
              .copyWith(color: HexColor('#707070')),
        ),
        8.verticalSpace,
        Text(value ?? "N/A", style: BaiFontPalette.fBlack_18_600),
        18.verticalSpace,
        Divider(
          height: 0,
          thickness: 1,
          color: HexColor("#F4E5E5"),
        ),
        18.verticalSpace,
      ],
    );
  }
}
