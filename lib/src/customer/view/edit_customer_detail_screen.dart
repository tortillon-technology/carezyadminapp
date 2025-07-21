import 'package:carezyadminapp/src/customer/view/widget/brand_and_model_sheet_selection.dart';
import 'package:carezyadminapp/src/customer/view_model/edit_customer_view_model.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../../res/enums/enums.dart';
import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/common_text_form.dart';
import '../../../utils/common_widgets/primary_button.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';
import '../../../utils/helpers/validators.dart';
import '../model/customer_details_model.dart';

class EditCustArguments {
  final CustomerDetails? customerData;
  final Function()? callBack;

  EditCustArguments({this.customerData, this.callBack});
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
  final drivingHabiitController = TextEditingController();
  final vinNumberController = TextEditingController();

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
      nameController.text = viewModel.customerDetails?.nameEn ?? '';
      emailController.text = viewModel.customerDetails?.email ?? '';
      phoneController.text = viewModel.customerDetails?.phoneNumber ?? '';
      regNumberController.text =
          viewModel.customerDetails?.registrationNumber ?? '';
      vinNumberController.text = viewModel.customerDetails?.vinNumber ?? '';
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
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      label: "Name",
                      controller: nameController,
                      error: provider.nameError,
                      inputType: TextInputType.name,
                      inputFormatters: [
                        TextInputFormats.noWhiteSpaceFormatterForInitials
                      ],
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.nameError = Validators.validateName(data);
                          if (provider.nameError == null) {
                            provider.customerDetails?.nameEn = data;
                          }
                        });
                      },
                      //value: (data?.nameEn ?? "").capitalizeEachLetter(),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Email ID",
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      error: provider.emailError,
                      inputFormatters: [
                        TextInputFormats.noWhiteSpaceFormatterForInitials
                      ],
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
                      inputType: TextInputType.number,
                      inputFormatters: [TextInputFormats.digitsFormatter],
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
                      inputType: TextInputType.name,
                      inputFormatters: [
                        TextInputFormats.noWhiteSpaceFormatterForInitials
                      ],
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
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "VIN Number",
                      controller: vinNumberController,
                      error: provider.vinNumberError,
                      inputType: TextInputType.name,
                      inputFormatters: [
                        TextInputFormats.noWhiteSpaceFormatterForInitials
                      ],
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.vinNumberError =
                              Validators.validateVIN(data);
                          provider.customerDetails?.vinNumber = data;
                        });
                      },
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
                    InkWell(
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
                    ),
                    16.verticalSpace,
                    InkWell(
                      onTap: () {
                        selectDrivingHabit();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Driving Habit",
                              style: PlusJakartaFontPalette.fBlack_12_600),
                          8.verticalSpace,
                          Container(
                            width: context.sw(),
                            height: 60.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: HexColor('#FAFAFA'),
                                border: Border.all(
                                  color: HexColor('#E8E8E8'),
                                )),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${provider.customerDetails?.drivingHabit ?? "0"} Km/week",
                                    style: PlusJakartaFontPalette.fBlack_14_600,
                                  ),
                                ),
                                Icon(Icons.edit,
                                    size: 18.sp, color: HexColor('#BDBDBD'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    100.verticalSpace,
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
                              FocusManager.instance.primaryFocus?.unfocus();
                              bool? success =
                                  await provider.updateProfileData();
                              if ((success ?? false) && context.mounted) {
                                toastification.show(
                                    title: Text(
                                      "Customer profile edited successfully",
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
                                widget.arguments.callBack?.call();
                                Navigator.pop(context);
                              } else if ((provider.errorMessage ?? "")
                                  .isNotEmpty) {
                                toastification.show(
                                    title: Text(
                                      provider.errorMessage ?? "",
                                      style: PlusJakartaFontPalette
                                          .fBlack_12_400
                                          .copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    style: ToastificationStyle.simple,
                                    alignment: Alignment.bottomCenter,
                                    type: ToastificationType.error,
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ));
                              }
                            }
                          : null,
                    ),
                  ))
              : SizedBox.shrink();
        }),
      ),
    );
  }

  List<String> drivingHabit = ["10-50", "50-100", "100-500", "500-1000"];

  void selectDrivingHabit() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(
        value: viewModel,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            16.verticalSpace,
            Text("Select Driving Habit",
                style: PlusJakartaFontPalette.fBlack_16_600),
            16.verticalSpace,
            Consumer<EditCustomerViewModel>(
                builder: (context, provider, child) {
              return ListView.builder(
                itemCount: drivingHabit.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final km = drivingHabit[index];

                  bool isSelected =
                      provider.customerDetails?.drivingHabit.toString() ==
                          km.toString();
                  return ListTile(
                    title: Text(
                      "$km Km/week",
                      style: PlusJakartaFontPalette.fBlack_14_600,
                    ),
                    onTap: () {
                      provider.update(
                        callback: () {
                          provider.customerDetails?.drivingHabit = km;
                        },
                      );
                      Navigator.pop(context);
                    },
                    trailing: isSelected
                        ? Icon(
                            Icons.check,
                            color: ColorPalette.primaryColor,
                          )
                        : null,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    String? error,
    required TextEditingController controller,
    Function(String data)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? inputType,
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
          inputType: inputType,
          errorText: error,
          inputFormatters: inputFormatters,
          controller: controller,
          suffix: Icon(Icons.edit, size: 18.sp, color: HexColor('#BDBDBD')),
          style: PlusJakartaFontPalette.fBlack_14_600,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
