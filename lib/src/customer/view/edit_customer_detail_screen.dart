import 'package:carezyadminapp/src/customer/view/widget/brand_and_model_sheet_selection.dart';
import 'package:carezyadminapp/src/customer/view_model/edit_customer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../res/enums/enums.dart';
import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/common_switch_state.dart';
import '../../../utils/common_widgets/common_text_form.dart';
import '../../../utils/common_widgets/primary_button.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';
import '../../../utils/helpers/validators.dart';
import '../model/customer_details_model.dart';

class EditCustArguments {
  final CustomerData? customerData;
  final Function()? callBack;

  EditCustArguments({ this.customerData, this.callBack});
}

class EditCustomerDetailsScreen extends StatefulWidget {
  final EditCustArguments arguments;
  const EditCustomerDetailsScreen({super.key, required this.arguments});

  @override
  State<EditCustomerDetailsScreen> createState() =>
      _EditCustomerDetailsScreenState();
}

class _EditCustomerDetailsScreenState extends State<EditCustomerDetailsScreen> {
  late final EditCustomerViewModel viewModel;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final regNumberController = TextEditingController();

  @override
  void initState() {
    viewModel = EditCustomerViewModel();
    afterInit(_getDetails);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  _getDetails() {
    viewModel.getBrands();
    viewModel.getCustomerDetails(data: widget.arguments.customerData);
    _fetchData();
  }

  _fetchData() {
    if (viewModel.customerDetails != null) {
      nameController.text = viewModel.customerDetails?.name ?? '';
      emailController.text = viewModel.customerDetails?.email ?? '';
      phoneController.text = viewModel.customerDetails?.phoneNumber ?? '';
      regNumberController.text =
          viewModel.customerDetails?.registrationNumber ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          titleText: "Edit Profile",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Consumer<EditCustomerViewModel>(
            builder: (context, provider, child) {
          final data = provider.customerDetails;
          return CommonSwitchState(
            loader: provider.loaderState,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: AbsorbPointer(
                absorbing: provider.updateProfile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Details",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Name", controller: nameController,
                      error: provider.nameError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.nameError = Validators.validateName(data);
                          if (provider.nameError == null) {
                            provider.customerDetails?.name = data;
                          }
                        });
                      },
                      //value: (data?.nameEn ?? "").capitalizeEachLetter(),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Email ID",
                      controller: emailController,
                      error: provider.emailError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.emailError =
                              Validators.validateEmailORMobile(data,
                                  isEmailId: true);
                          if (provider.emailError == null) {
                            provider.customerDetails?.email = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Phone",
                      controller: phoneController,
                      error: provider.phoneError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.customerDetails?.phoneNumber = data;
                          provider.phoneError =
                              Validators.validateEmailORMobile(data,
                                  isEmailId: false);
                          if (provider.phoneError == null) {
                            provider.customerDetails?.phoneNumber = data;
                          }
                        });
                      },
                      // value: (data?.phoneNumber ?? ""),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Vehicle Reg. Number",
                      controller: regNumberController,
                      error: provider.regNumberError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.customerDetails?.registrationNumber = data;
                          provider.regNumberError =
                              Validators.validateRegNumber(data);
                          if (provider.regNumberError == null) {
                            provider.customerDetails?.registrationNumber = data;
                          }
                        });
                      },

                      /// value: (data?.registrationNumber ?? ""),
                    ),
                    24.verticalSpace,
                    Text(
                      "Your Vehicle",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  /*  InkWell(
                      onTap: () {
                        selectNewVehicle(
                          context: context,
                          viewModel: viewModel,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: HexColor('#F9F9F9'),
                          border: Border.all(
                            color: HexColor("#E8E8E8"),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              height: 50.h,
                              width: 50.h,
                              fit: BoxFit.cover,
                              '',
                              //  provider.customerDetails?.brand?.logo ?? "",
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://static.wikia.nocookie.net/central/images/3/3f/Placeholder_view_vector.svg/revision/latest/scale-to-width-down/340?cb=20250302081817', // 👈 Add your local placeholder image
                                  height: 50.h,
                                  width: 50.h,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?.brand?.nameEn ?? "---",
                                    style:
                                        BaiFontPalette.fBlack_16_600.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    data?.model?.nameEn ?? "---",
                                    style:
                                        BaiFontPalette.fBlack_14_600.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.edit,
                                size: 18.sp, color: HexColor('#BDBDBD'))
                          ],
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ),
          );
        }),
        bottomNavigationBar: Consumer<EditCustomerViewModel>(
            builder: (context, provider, child) {
          bool isLoaded = provider.loaderState == LoaderState.loaded;
          return isLoaded
              ? SafeArea(
                  bottom: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: PrimaryButton(
                      text: "Save Changes",
                      isLoading: provider.updateProfile,
                      onPressed: provider.hasChange
                          ? () async {
                              // bool? success =
                              //     await provider.updateProfileData();
                              // if (success ?? false) {
                              //   // showCustomToast(
                              //   //     message: "Profile edit success");
                              // }
                            }
                          : null,
                    ),
                  ))
              : SizedBox.shrink();
        }),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    String? error,
    required TextEditingController controller,
    Function(String data)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: PlusJakartaFontPalette.f6E6E6E_12_500
                .copyWith(color: HexColor('#1C1C1C'))),
        8.verticalSpace,
        CommonTextFormFieldWithValidator(
          filledColor: HexColor('#F9F9F9'),
          // focusedColor: HexColor('#EC0008'),
          errorText: error,
          controller: controller,
          suffix: Icon(Icons.edit, size: 18.sp, color: HexColor('#BDBDBD')),
          style: PlusJakartaFontPalette.fBlack_14_600,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
