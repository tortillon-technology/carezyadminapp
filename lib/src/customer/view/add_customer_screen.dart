import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/src/customer/view/widget/enter_customer_details.dart';
import 'package:carezyadminapp/src/customer/view/widget/select_driving_habits.dart';
import 'package:carezyadminapp/src/customer/view/widget/select_garage.dart';
import 'package:carezyadminapp/src/customer/view/widget/select_makers.dart';
import 'package:carezyadminapp/src/customer/view/widget/select_model.dart';
import 'package:carezyadminapp/src/customer/view_model/customer_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:tuple/tuple.dart';

import '../../../res/constants/string_constants.dart';
import '../../../res/styles/fonts/plus_jakarta_font_palette.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  late CustomerViewModel viewModel;

  @override
  void initState() {
    viewModel = CustomerViewModel();
    viewModel.initialize();

    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  List<Widget> get pages => [
        EnterCustomerDetails(viewModel: viewModel),
        SelectMakers(viewModel: viewModel),
        SelectModel(),
        SelectDrivingHabits(),
        SelectGarage(viewModel: viewModel),
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
      child: Selector<CustomerViewModel, bool>(
          selector: (_, selector) => selector.isLoading,
          builder: (context, isLoading, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: CommonAppBar(
                titleText: Strings.addCustomer,
                onBackTap: () => _goBack(isLoading: isLoading),
              ),
              body: Selector<CustomerViewModel, PageController?>(
                  selector: (_, selector) => selector.pageController,
                  builder: (context, controller, child) {
                    return AbsorbPointer(
                      absorbing: isLoading,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Selector<CustomerViewModel, int>(
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
                      child: Selector<CustomerViewModel, Tuple3<int, bool, bool>>(
                        selector: (_, selector) => Tuple3(
                            selector.currentPageIndex,
                            selector.enableButton,
                            selector.isLoading),
                        builder: (context, data, child) {
                          bool isLast = data.item1 == pages.length - 1;
                          return PrimaryButton(
                            text: isLast ? "Create" : "Next",
                            isLoading: data.item3,
                            onPressed: data.item2
                                ? isLast
                                    ? () async {
                                        bool? isSuccess =
                                            await viewModel.addCustomer();
                                        if ((isSuccess ?? false) &&
                                            context.mounted) {
                                          toastification.show(
                                              title: Text(
                                                "Customer added successfully",
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
                                    : () {
                                        viewModel.pageController?.nextPage(
                                            duration: Duration(milliseconds: 300),
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
            );
          }),
    );
  }
}
