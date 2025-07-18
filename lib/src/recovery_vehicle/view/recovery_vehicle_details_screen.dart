import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/edit_recovery_vehicle_screen.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/banners.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/delete_recovery_vehicle_dialog.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/vehicle_recovery_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_switch_state.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class RecoveryArguments {
  final int id;
  final VehicleRecoveryViewModel viewModel;
  RecoveryArguments({required this.viewModel, required this.id});
}

class RecoveryVehicleDetailsScreen extends StatefulWidget {
  final RecoveryArguments arguments;
  const RecoveryVehicleDetailsScreen({
    super.key,
    required this.arguments,
  });

  @override
  State<RecoveryVehicleDetailsScreen> createState() =>
      _RecoveryVehicleDetailsScreenState();
}

class _RecoveryVehicleDetailsScreenState
    extends State<RecoveryVehicleDetailsScreen> {
  late final VehicleRecoveryViewModel viewModel;
  @override
  void initState() {
    viewModel = widget.arguments.viewModel;
    afterInit(_load);
    super.initState();
  }

  _load() {
    viewModel.getVehicleRecoveryDetails(widget.arguments.id);
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
          actions: [
            Selector<VehicleRecoveryViewModel, LoaderState>(
                selector: (context, p1) => p1.detailsLoader,
                builder: (context, loader, child) {
                  return AbsorbPointer(
                    absorbing: loader != LoaderState.loaded,
                    child: PopupMenuButton<String>(
                      color: Colors.white,
                      icon: Icon(Icons.more_vert,
                          color: Colors.white, size: 24.sp),
                      onSelected: (value) {
                        if (value == 'edit') {
                          final data = viewModel.details?.results?.data;
                          Navigator.pushNamed(
                            context,
                            RouteConstants.routeEditRecoveryVehicleScreen,
                            arguments: EditRecoveryVehicleArguments(
                                details: data,
                                callBack: () {
                                  _load();
                                  viewModel.getVehiclesList();
                                }),
                          );
                        } else if (value == 'delete') {
                          deleteRecoveryVehicleDialog(
                            context,
                            onDelete: () async {
                              bool? isSuccess =
                                  await viewModel.delete(widget.arguments.id);
                              if ((isSuccess ?? false) && context.mounted) {
                                viewModel.getVehiclesList();
                                Navigator.pop(context);
                              }
                            },
                          );
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
                          child:
                              Text('Delete', style: TextStyle(fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
        body: Consumer<VehicleRecoveryViewModel>(
            builder: (context, provider, child) {
          final data = provider.details?.results?.data;
          return Stack(
            children: [
              CommonSwitchState(
                loader: provider.detailsLoader,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerWidget(
                        images: data?.images ?? [],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
                            _buildInfoItem('Name', data?.name ?? ""),
                            _buildInfoItem('Address', data?.address ?? ""),
                            _buildInfoItem('Email', data?.email ?? ""),
                            _buildInfoItem(
                                'Phone Number', data?.phoneNumber ?? ""),
                            _buildInfoItem(
                                'WhatsAPP Number', data?.whatsapp ?? ""),
                            _buildInfoItem('City', data?.city ?? ""),
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
        9.verticalSpace,
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
        9.verticalSpace,
        Divider(height: 1.h, color: HexColor('#F4E5E5')),
      ],
    );
  }
}
