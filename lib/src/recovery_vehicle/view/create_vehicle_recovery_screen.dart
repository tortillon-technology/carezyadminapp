import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/enter_recovery_vehicle_details.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/upload_vehicle_photos.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/create_recovery_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:tuple/tuple.dart';

class CreateVehicleRecoveryArguments {
  final Function()? callBack;

  CreateVehicleRecoveryArguments({this.callBack});
}

class CreateVehicleRecoveryScreen extends StatefulWidget {
  final CreateVehicleRecoveryArguments arguments;
  const CreateVehicleRecoveryScreen({super.key, required this.arguments});

  @override
  State<CreateVehicleRecoveryScreen> createState() =>
      _CreateVehicleRecoveryScreenState();
}

class _CreateVehicleRecoveryScreenState
    extends State<CreateVehicleRecoveryScreen> {
  late CreateRecoveryViewModel viewModel;

  @override
  void initState() {
    viewModel = CreateRecoveryViewModel();
    viewModel.initialize();

    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  List<Widget> get pages => [
        EnterRecoveryVehicleDetails(viewModel: viewModel),
        UploadVehiclePhotos(viewModel: viewModel),
      ];

  _goBack({bool isLoading = false}) {
    if (isLoading) return;
    bool isInitial = viewModel.currentPageIndex == 0;
    if (isInitial) {
      Navigator.pop(context);
      return;
    } else {
      viewModel.pageController?.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Selector<CreateRecoveryViewModel, bool>(
          selector: (_, selector) => selector.isLoading,
          builder: (context, isLoading, child) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  _goBack(isLoading: isLoading);
                }
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: CommonAppBar(
                  titleText: "Add Recovery Vehicle",
                  textStyle: BaiFontPalette.fWhite_20_600
                      .copyWith(color: Colors.black),
                  onBackTap: () => _goBack(isLoading: isLoading),
                ),
                body: Selector<CreateRecoveryViewModel, PageController?>(
                    selector: (_, selector) => selector.pageController,
                    builder: (context, controller, child) {
                      return AbsorbPointer(
                        absorbing: isLoading,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Selector<CreateRecoveryViewModel, int>(
                              selector: (_, selector) =>
                                  selector.currentPageIndex,
                              builder: (context, currentPageIndex, child) {
                                return Container(
                                  color: HexColor("#EAEAEA"),
                                  height: 4.h,
                                  width: context.sw(),
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedContainer(
                                    height: 4.h,
                                    duration: Duration(milliseconds: 250),
                                    width: (context.sw() / pages.length) *
                                        (currentPageIndex + 1),
                                    color: ColorPalette.primaryColor,
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: PageView.builder(
                                itemCount: pages.length,
                                controller: controller,
                                onPageChanged: viewModel.updateIndex,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => pages[index],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                bottomNavigationBar: SafeArea(
                  bottom: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Selector<CreateRecoveryViewModel,
                            Tuple3<int, bool, bool>>(
                          selector: (_, selector) => Tuple3(
                              selector.currentPageIndex,
                              selector.enableButton,
                              selector.isLoading),
                          builder: (context, data, child) {
                            bool isLast = data.item1 == pages.length - 1;
                            return PrimaryButton(
                              text: isLast ? "Add" : "Next",
                              isLoading: data.item3,
                              onPressed: data.item2
                                  ? isLast
                                      ? () async {
                                          bool? isSuccess = await viewModel
                                              .createRecoveryVehicle();
                                          if ((isSuccess ?? false) &&
                                              context.mounted) {
                                            widget.arguments.callBack?.call();
                                            toastification.show(
                                                title: Text(
                                                  "Add recovery created successfully",
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
                                                style:
                                                    ToastificationStyle.simple,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                type:
                                                    ToastificationType.success,
                                                borderSide: BorderSide(
                                                  color: const Color.fromARGB(
                                                      255, 35, 214, 109),
                                                ));
                                            Navigator.pop(context);
                                          }
                                        }
                                      : () {
                                          viewModel.pageController?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear);
                                        }
                                  : null,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
