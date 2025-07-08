import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/services/view/widget/ac_compartments.dart';
import 'package:carezyadminapp/src/services/view/widget/break_system.dart';
import 'package:carezyadminapp/src/services/view/widget/customer_and_vehicle.dart';
import 'package:carezyadminapp/src/services/view/widget/differential_compartments.dart';
import 'package:carezyadminapp/src/services/view/widget/engine_compartments.dart';
import 'package:carezyadminapp/src/services/view/widget/fuel_system.dart';
import 'package:carezyadminapp/src/services/view/widget/gear_compartments.dart';
import 'package:carezyadminapp/src/services/view/widget/light_system.dart';
import 'package:carezyadminapp/src/services/view/widget/other_accessories.dart';
import 'package:carezyadminapp/src/services/view/widget/search_customer.dart';
import 'package:carezyadminapp/src/services/view/widget/steering_system.dart';
import 'package:carezyadminapp/src/services/view/widget/suspension_system.dart';
import 'package:carezyadminapp/src/services/view/widget/tyre_pressure.dart';
import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:tuple/tuple.dart';

import '../../../res/constants/string_constants.dart';
import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/primary_button.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  late final AddServiceViewModel viewModel;

  @override
  void initState() {
    viewModel = AddServiceViewModel();
    afterInit(init);
    super.initState();
  }

  init() {
    viewModel.getGarages();
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
          titleText: Strings.addService,
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Selector<AddServiceViewModel, bool>(
              selector: (_, selector) => selector.isServiceAdding,
              builder: (_, isServiceAdding, child) {
                return AbsorbPointer(
                  absorbing: isServiceAdding,
                  child: Column(
                    children: [
                      SearchCustomer(viewModel: viewModel),
                      16.verticalSpace,
                      CustomerAndVehicle(viewModel: viewModel),
                      16.verticalSpace,
                      EngineCompartment(viewModel: viewModel),
                      16.verticalSpace,
                      GearCompartments(viewModel: viewModel),
                      16.verticalSpace,
                      DifferentialCompartments(viewModel: viewModel),
                      16.verticalSpace,
                      BreakSystem(viewModel: viewModel),
                      16.verticalSpace,
                      SuspensionSystem(viewModel: viewModel),
                      16.verticalSpace,
                      AcCompartments(viewModel: viewModel),
                      16.verticalSpace,
                      SteeringSystem(viewModel: viewModel),
                      16.verticalSpace,
                      LightSystem(viewModel: viewModel),
                      16.verticalSpace,
                      FuelSystem(viewModel: viewModel),
                      16.verticalSpace,
                      TyrePressure(viewModel: viewModel),
                      16.verticalSpace,
                      OtherAccessories(viewModel: viewModel)
                    ],
                  ),
                );
              }),
        ),
        bottomNavigationBar: Selector<AddServiceViewModel, Tuple2<bool, bool>>(
            selector: (_, selector) =>
                Tuple2(selector.enableButton, selector.isServiceAdding),
            builder: (_, data, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: PrimaryButton(
                      text: "Add",
                      isLoading: data.item2,
                      onPressed: data.item1
                          ? () async {
                              bool? isSuccess = await viewModel.addService();
                              if ((isSuccess ?? false) && context.mounted) {
                                toastification.show(
                                    title: Text(
                                      "Service added successfully",
                                      style: PlusJakartaFontPalette
                                          .fBlack_12_400
                                          .copyWith(
                                        fontSize: 14.sp,
                                        color: const Color.fromARGB(
                                            255, 35, 214, 109),
                                      ),
                                    ),
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    style: ToastificationStyle.simple,
                                    alignment: Alignment.bottomCenter,
                                    type: ToastificationType.success,
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 35, 214, 109),
                                    ));
                                Navigator.pop(context);
                              }
                            }
                          : null,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
