import 'package:cached_network_image/cached_network_image.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/garage/model/garage_model.dart';
import 'package:carezyadminapp/src/garage/view_model/edit_garage_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_app_bar.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class EditGarageArguments {
  final Garages? garages;
  final Function()? callBack;
  EditGarageArguments({this.garages, this.callBack});
}

class EditGarageScreen extends StatefulWidget {
  final EditGarageArguments arguments;
  const EditGarageScreen({super.key, required this.arguments});

  @override
  State<EditGarageScreen> createState() => _EditGarageScreenState();
}

class _EditGarageScreenState extends State<EditGarageScreen> {
  late final EditGarageViewModel viewModel;
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final whatsAppCtrl = TextEditingController();
  final regNumberCtrl = TextEditingController();

  final countryCtrl = TextEditingController();
  final stateCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final pinCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();

  final descriptionCtrl = TextEditingController();

  @override
  void initState() {
    _fetchData();
    viewModel = EditGarageViewModel();
    viewModel.getDetails(data: widget.arguments.garages);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  _fetchData() {
    final garage = widget.arguments.garages;
    nameCtrl.text = garage?.name ?? '';
    emailCtrl.text = garage?.email ?? '';
    phoneCtrl.text = garage?.phoneNumber ?? '';
    whatsAppCtrl.text = garage?.whatsappNumber ?? '';
    regNumberCtrl.text = garage?.garageRegistrationNumber ?? '';

    countryCtrl.text = garage?.country ?? '';
    stateCtrl.text = garage?.state ?? '';
    cityCtrl.text = garage?.city ?? '';
    addressCtrl.text = garage?.address ?? '';
    locationCtrl.text = garage?.location ?? '';
    pinCodeCtrl.text = garage?.pincode ?? '';

    descriptionCtrl.text = garage?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CommonAppBar(
            titleText: "Edit Garage",
            systemOverlay: homeSystemOverlay,
            textStyle: BaiFontPalette.fWhite_20_600,
            iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
            backgroundColor: ColorPalette.primaryColor,
            iconColor: Colors.white,
            textSpace: 16,
          ),
          body: Consumer<EditGarageViewModel>(
              builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: AbsorbPointer(
                absorbing: provider.updateDetails,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Garage Details",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Garage Name",
                      controller: nameCtrl,
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
                      label: "Email ID",
                      controller: emailCtrl,
                      error: provider.emailError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.details?.email = data;
                          provider.emailError = Validators.validateEmail(
                            data,
                          );
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Phone",
                      controller: phoneCtrl,
                      error: provider.phoneError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.phoneError =
                              Validators.validateEmailORMobile(data,
                                  isEmailId: false);
                          provider.details?.phoneNumber = data;
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "WhatsApp Number",
                      controller: whatsAppCtrl,
                      error: provider.whatsAppError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.whatsAppError =
                              Validators.validateRegNumber(data);
                          if (provider.whatsAppError == null) {
                            provider.details?.whatsappNumber = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Garage Reg No.",
                      controller: regNumberCtrl,
                      error: provider.regNumberError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.regNumberError =
                              Validators.validateRegNumber(data);
                          if (provider.regNumberError == null) {
                            provider.details?.garageRegistrationNumber = data;
                          }
                        });
                      },
                    ),
                    48.verticalSpace,
                    ////
                    ///
                    ///
                    Text(
                      "Location Details",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Country",
                      controller: countryCtrl,
                      error: provider.countryError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.countryError =
                              Validators.validateCommon(data, "Country");
                          if (provider.countryError == null) {
                            provider.details?.country = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "State",
                      controller: stateCtrl,
                      error: provider.stateError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.stateError =
                              Validators.validateCommon(data, "State");
                          if (provider.stateError == null) {
                            provider.details?.state = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "City",
                      controller: cityCtrl,
                      error: provider.cityError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.cityError =
                              Validators.validateCommon(data, "City");
                          if (provider.cityError == null) {
                            provider.details?.city = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Address",
                      controller: addressCtrl,
                      error: provider.addressError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.addressError =
                              Validators.validateCommon(data, "Address");
                          if (provider.addressError == null) {
                            provider.details?.address = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "Paste Location here",
                      controller: locationCtrl,
                      error: provider.locationError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.locationError =
                              Validators.validateCommon(data, "Location");
                          if (provider.locationError == null) {
                            provider.details?.location = data;
                          }
                        });
                      },
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "PIN Code",
                      controller: pinCodeCtrl,
                      error: provider.pinCodeError,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.pinCodeError =
                              Validators.validateCommon(data, "PIN Code");
                          if (provider.pinCodeError == null) {
                            provider.details?.pincode = data;
                          }
                        });
                      },
                    ),

                    ////
                    48.verticalSpace,
                    Text(
                      "Garage Description",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    16.verticalSpace,
                    _buildEditableField(
                      label: "About Garage",
                      controller: descriptionCtrl,
                      error: provider.descriptionError,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 30,
                      height: 108.h,
                      isExpanded: true,
                      onChanged: (data) {
                        provider.update(callback: () {
                          provider.descriptionError =
                              Validators.validateCommon(data, "Description");
                          if (provider.descriptionError == null) {
                            provider.details?.description = data;
                          }
                        });
                      },
                    ),
                    ////
                    ///

                    48.verticalSpace,
                    Text(
                      "Garage photo",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
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
                              CachedNetworkImage(
                                imageUrl: image?.image ?? "",
                                width: 110.w,
                                height: 110.w,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 110.w,
                                  height: 110.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  width: 110.w,
                                  height: 110.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 110.w,
                                  height: 110.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Icon(
                                    Icons.error,
                                    color: ColorPalette.primaryColor,
                                  ),
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
          bottomNavigationBar: Consumer<EditGarageViewModel>(
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
                                    "Garage edited successfully",
                                    style: PlusJakartaFontPalette.fBlack_12_400
                                        .copyWith(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          255, 35, 214, 109),
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
                            } else if (viewModel.errorMessage != null) {
                              toastification.show(
                                title: Text(
                                  viewModel.errorMessage ?? "Failed",
                                  style: PlusJakartaFontPalette.fBlack_12_400
                                      .copyWith(
                                    fontSize: 14.sp,
                                    color: ColorPalette.fEC0008,
                                  ),
                                ),
                                autoCloseDuration: const Duration(seconds: 5),
                                style: ToastificationStyle.simple,
                                alignment: Alignment.bottomCenter,
                                type: ToastificationType.success,
                                borderSide: BorderSide(
                                  color: ColorPalette.fEC0008,
                                ),
                              );
                            }
                          }
                        : null,
                  ),
                ));
          }),
        ));
  }

  Widget _buildEditableField({
    required String label,
    String? error,
    required TextEditingController controller,
    Function(String data)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? inputType,
    bool isExpanded = false,
    double? height,
    int? maxLines,
    TextAlignVertical? textAlignVertical,
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
          height: height,
          errorText: error,
          expands: isExpanded,
          textAlignVertical: textAlignVertical,
          inputFormatters: inputFormatters,
          controller: controller,
          maxLines: maxLines ?? 1,
          suffix: Icon(Icons.edit, size: 18.sp, color: HexColor('#BDBDBD')),
          style: PlusJakartaFontPalette.fBlack_14_600,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
