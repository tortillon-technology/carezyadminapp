import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/garage/view/edit_garage_screen.dart';
import 'package:carezyadminapp/src/garage/view/garage_customer_details_screen.dart';
import 'package:carezyadminapp/src/garage/view/widget/delete_garage_dialog.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/banners.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/common_widgets/common_switch_state.dart';
import '../../recovery_vehicle/model/vehicle_recovery_details_model.dart';
import '../view_model/garage_details_view_model.dart';

class GarageArguments {
  final int id;
  final Function()? callBack;

  GarageArguments({required this.id, this.callBack});
}

class GarageDetailsScreen extends StatefulWidget {
  final GarageArguments arguments;
  const GarageDetailsScreen({super.key, required this.arguments});

  @override
  State<GarageDetailsScreen> createState() => _GarageDetailsScreenState();
}

class _GarageDetailsScreenState extends State<GarageDetailsScreen> {
  late final GarageDetailsViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = GarageDetailsViewModel();
    afterInit(init);
  }

  init() {
    viewModel.getGarageDetails(id: widget.arguments.id);
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
        backgroundColor: HexColor("#F4F4F4"),
        appBar: CommonAppBar(
          titleText: "Garage Details",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
          actions: [
            Selector<GarageDetailsViewModel, LoaderState>(
                selector: (context, p1) => p1.loaderState,
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
                                RouteConstants.routeEditGarageScreen,
                                arguments: EditGarageArguments(
                                  garages: viewModel.garages,
                                  callBack: () {
                                    widget.arguments.callBack?.call();
                                    viewModel.getGarageDetails(
                                        id: widget.arguments.id);
                                  },
                                ),
                              );
                            } else if (value == 'delete') {
                              garageDeleteDialog(context, onDelete: () async {
                                bool? isSuccess =
                                    await viewModel.delete(widget.arguments.id);
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
                })
          ],
        ),
        body: Consumer<GarageDetailsViewModel>(
            builder: (context, provider, child) {
          final data = provider.garages;
          final images = data?.images
              ?.map((e) => Banners(id: e.id, image: e.imageUrl))
              .toList();
          return Stack(
            children: [
              CommonSwitchState(
                loader: provider.loaderState,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerWidget(
                        images: images ?? [],
                      ),
                      16.verticalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context,
                              RouteConstants.routeGarageCustomerDetailsScreen,
                              arguments: GarageCustArguments(
                                callBack: () {
                                  viewModel.getGarageDetails(
                                      id: widget.arguments.id);
                                },
                                id: data?.id ?? 0,
                                name: data?.name ?? '',
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 21.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1CEC0008),
                                offset: Offset(2, 2),
                                blurRadius: 4.9,
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svgCustomers),
                              18.horizontalSpace,
                              Expanded(
                                child: Text(
                                  "Total Customers\nunder garage",
                                  style: BaiFontPalette.fBlack_16_500
                                      .copyWith(fontSize: 15.sp),
                                ),
                              ),
                              Text(
                                (data?.customerCount ?? 0).toString(),
                                style: BaiFontPalette.fBlack_16_600
                                    .copyWith(fontSize: 25.sp),
                              ),
                              4.5.horizontalSpace,
                              SvgPicture.asset(Assets.svgArrowRight),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoItem('Name', data?.name ?? ""),
                            _buildInfoItem('Email', data?.email ?? ""),
                            _buildInfoItem(
                                'Phone Number', data?.phoneNumber ?? ""),
                            _buildInfoItem(
                                'WhatsAPP Number', data?.whatsappNumber ?? ""),
                            _buildInfoItem('Garage Reg No.',
                                data?.garageRegistrationNumber ?? ""),
                            _buildInfoItem('Address', data?.address ?? ""),
                            _buildInfoItem('County', data?.country ?? ""),
                            _buildInfoItem('City', data?.city ?? ""),
                            _buildInfoItem('Location', data?.location ?? ""),
                            100.verticalSpace,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isDeleting)
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
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        Text(
          title,
          style: PlusJakartaFontPalette.fBlack_14_600.copyWith(
              fontWeight: FontWeight.w500, color: HexColor('#707070')),
        ),
        8.verticalSpace,
        Text(
          value.capitalizeEachLetter(),
          style: BaiFontPalette.fBlack_18_600,
        ),
        12.verticalSpace,
        Divider(height: 1.h, color: HexColor('#F4E5E5')),
      ],
    );
  }
}
