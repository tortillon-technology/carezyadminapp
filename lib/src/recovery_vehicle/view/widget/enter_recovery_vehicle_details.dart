import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view/widget/country_selection.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/create_recovery_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EnterRecoveryVehicleDetails extends StatefulWidget {
  final CreateRecoveryViewModel viewModel;
  const EnterRecoveryVehicleDetails({super.key, required this.viewModel});

  @override
  State<EnterRecoveryVehicleDetails> createState() =>
      _EnterRecoveryVehicleDetailsState();
}

class _EnterRecoveryVehicleDetailsState
    extends State<EnterRecoveryVehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<CreateRecoveryViewModel>(
            builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                "Enter Vehicle Details",
                style: BaiFontPalette.fBlack_18_600,
              ),
              24.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Name",
                errorText: provider.nameError,
                onChanged: provider.validateName,
                inputAction: TextInputAction.next,
                controller: provider.nameCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Address",
                controller: provider.addressCtrl,
                errorText: provider.addressError,
                onChanged: provider.validateAddress,
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Email",
                controller: provider.emailCtrl,
                errorText: provider.emailError,
                onChanged: provider.validateEmail,
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Phone Number",
                errorText: provider.phoneError,
                controller: provider.phoneCtrl,
                onChanged: provider.validatePhone,
                inputAction: TextInputAction.next,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryPicker(
                    onSelected: (country) {
                      provider.countryPhone = country;
                      provider.update();
                    },
                    selectedCountry: provider.countryPhone,
                  ),
                ),
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "WhatsApp",
                controller: provider.whatsAppCtrl,
                errorText: provider.whatsAppError,
                onChanged: provider.validateWhatsApp,
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryPicker(
                    onSelected: (country) {
                      provider.countryWhatsApp = country;
                      provider.update();
                    },
                    selectedCountry: provider.countryWhatsApp,
                  ),
                ),
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "City",
                errorText: provider.cityError,
                controller: provider.cityCtrl,
                onChanged: provider.validateCity,
                inputAction: TextInputAction.done,
                inputType: TextInputType.text,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
            ],
          );
        }),
      ),
    );
  }
}
