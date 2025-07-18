import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/model/vehicle_recovery_details_model.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/edit_recovery_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class EditRecoveryVehicleArguments {
  final RecoveryDetails? details;
  final Function()? callBack;
  EditRecoveryVehicleArguments({this.details, this.callBack});
}

class EditRecoveryVehicleScreen extends StatefulWidget {
  final EditRecoveryVehicleArguments arguments;
  const EditRecoveryVehicleScreen({super.key, required this.arguments});

  @override
  State<EditRecoveryVehicleScreen> createState() =>
      _EditRecoveryVehicleScreenState();
}

class _EditRecoveryVehicleScreenState extends State<EditRecoveryVehicleScreen> {
  late final EditRecoveryViewModel viewModel;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsAppController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void initState() {
    viewModel = EditRecoveryViewModel();
    afterInit(_getDetails);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  _getDetails() {
    viewModel.getDetails(data: widget.arguments.details);
    _fetchData();
  }

  _fetchData() {
    if (viewModel.details != null) {
      nameController.text = viewModel.details?.name ?? '';
      emailController.text = viewModel.details?.email ?? '';
      phoneController.text = viewModel.details?.phoneNumber ?? '';
      whatsAppController.text = viewModel.details?.whatsapp ?? '';
      addressController.text = viewModel.details?.address ?? '';
      cityController.text = viewModel.details?.city ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          titleText: "Edit Recovery Vehicle",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Consumer<EditRecoveryViewModel>(
            builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: AbsorbPointer(
              absorbing: provider.updateDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vehicle Details",
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
                    onChanged: (data) {
                      provider.update(callback: () {
                        provider.nameError = Validators.validateName(data);
                        if (provider.nameError == null) {
                          provider.details?.name = data;
                        }
                      });
                    },
                  ),
                  16.verticalSpace,
                  _buildEditableField(
                    label: "Address",
                    controller: addressController,
                    error: provider.addressError,
                    onChanged: (data) {
                      provider.update(callback: () {
                        provider.addressError =
                            Validators.validateAddress(data);
                        if (provider.addressError == null) {
                          provider.details?.address = data;
                        }
                      });
                    },
                  ),
                  16.verticalSpace,
                  _buildEditableField(
                    label: "Email ID",
                    controller: emailController,
                    error: provider.emailError,
                    onChanged: (data) {
                      provider.update(callback: () {
                        provider.emailError = Validators.validateEmailORMobile(
                            data,
                            isEmailId: true);
                        if (provider.emailError == null) {
                          provider.details?.email = data;
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
                        provider.phoneError = Validators.validateEmailORMobile(
                            data,
                            isEmailId: false);
                        if (provider.phoneError == null) {
                          provider.details?.phoneNumber = data;
                        }
                      });
                    },
                  ),
                  16.verticalSpace,
                  _buildEditableField(
                    label: "WhatsApp Number",
                    controller: whatsAppController,
                    error: provider.whatsAppError,
                    onChanged: (data) {
                      provider.update(callback: () {
                        provider.whatsAppError =
                            Validators.validateRegNumber(data);
                        if (provider.whatsAppError == null) {
                          provider.details?.whatsapp = data;
                        }
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
                  16.verticalSpace,
                  if ((provider.details?.images ?? []).isNotEmpty)
                    Text(
                      "Already uploaded images",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if ((provider.details?.images ?? []).isNotEmpty)
                    12.verticalSpace,
                  if ((provider.details?.images ?? []).isNotEmpty)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 8.w),
                      itemCount: provider.details?.images?.length,
                      itemBuilder: (context, index) {
                        final image = provider.details?.images?[index];
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                image?.image ?? "",
                                width: 110.w,
                                height: 110.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: InkWell(
                                onTap: () async {
                                  final success =
                                      await provider.delete(image?.id ?? 0);
                                  if (success ?? false) {
                                    widget.arguments.callBack?.call();
                                  }
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor("#F1F1F1"),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  8.verticalSpace,
                  if (provider.imageList.isNotEmpty)
                    Text(
                      "Selected images",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (provider.imageList.isNotEmpty) 12.verticalSpace,
                  if (provider.imageList.isNotEmpty)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 8.w),
                      itemCount: provider.imageList.length,
                      itemBuilder: (context, index) {
                        final image = provider.imageList[index];
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.file(
                                image,
                                width: 110.w,
                                height: 110.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: InkWell(
                                onTap: () {
                                  viewModel.removeImage(index);
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor("#F1F1F1"),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  if (provider.imageList.length <= 6 &&
                      (provider.details?.images ?? []).length < 6)
                    InkWell(
                      onTap: () {
                        viewModel.pickImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor("#FAFAFA"),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.w, vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 16.w,
                            ),
                            8.horizontalSpace,
                            Text(
                              "Upload Photo",
                              style: PlusJakartaFontPalette.f6E6E6E_14_500
                                  .copyWith(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: Consumer<EditRecoveryViewModel>(
            builder: (context, provider, child) {
          return SafeArea(
              bottom: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: PrimaryButton(
                  text: "Save Changes",
                  isLoading: provider.updateDetails,
                  onPressed: provider.hasChange
                      ? () async {
                          bool? success = await provider.updateData();
                          if ((success ?? false) && context.mounted) {
                            toastification.show(
                                title: Text(
                                  "Vehicle recovery edited successfully",
                                  style: PlusJakartaFontPalette.fBlack_12_400
                                      .copyWith(
                                    fontSize: 14.sp,
                                    color:
                                        const Color.fromARGB(255, 35, 214, 109),
                                  ),
                                ),
                                autoCloseDuration: const Duration(seconds: 5),
                                style: ToastificationStyle.simple,
                                alignment: Alignment.bottomCenter,
                                type: ToastificationType.success,
                                borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 35, 214, 109),
                                ));
                            widget.arguments.callBack?.call();
                            Navigator.pop(context);
                          }
                        }
                      : null,
                ),
              ));
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
          filledColor: HexColor('#FAFAFA'),
          focusedColor: HexColor('#EC0008'),
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
