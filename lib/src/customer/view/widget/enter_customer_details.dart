
import 'package:carezyadminapp/res/constants/string_constants.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/src/customer/view_model/customer_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EnterCustomerDetails extends StatefulWidget {
  final CustomerViewModel viewModel;
  const EnterCustomerDetails({super.key, required this.viewModel});

  @override
  State<EnterCustomerDetails> createState() => _EnterCustomerDetailsState();
}

class _EnterCustomerDetailsState extends State<EnterCustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<CustomerViewModel>(builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                Strings.enterCustomerDetails,
                style: BaiFontPalette.fBlack_18_600,
              ),
              24.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Enter Name",
                errorText: provider.fullNameErrorText,
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
                hintText: "Email ID",
                controller: provider.emailCtrl,
                errorText: provider.emailIdErrorText,
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
                errorText: provider.phoneNumberErrorText,
                controller: provider.phoneCtrl,
                onChanged: provider.validatePhone,
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Vehicle Number",
                controller: provider.vehicleCtrl,
                errorText: provider.vehicleNumberErrorText,
                onChanged: provider.validateVehicleNumber,
                inputAction: TextInputAction.next,
                inputType: TextInputType.text,
                inputFormatters: [
                  TextInputFormats.alphaNumeric,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Odometer Reading",
                errorText: provider.odoMeterErrorText,
                controller: provider.odoCtrl,
                onChanged: provider.validateODOMeter,
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                  TextInputFormats.digitsFormatter,
                  TextInputFormats.noLeadingZero,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "VIN Number",
                errorText: provider.vinNumberErrorText,
                onChanged: provider.validateVIN,
                controller: provider.vinCtrl,
                inputAction: TextInputAction.done,
                inputFormatters: [
                  TextInputFormats.alphaNumeric,
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
