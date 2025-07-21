import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/src/garage/view_model/add_garage_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LocationDetails extends StatefulWidget {
  final AddGarageViewModel viewModel;
  const LocationDetails({super.key, required this.viewModel});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:
            Consumer<AddGarageViewModel>(builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                "Enter Location Details",
                style: BaiFontPalette.fBlack_18_600,
              ),
              24.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Country",
                errorText: provider.countryError,
                onChanged: provider.validateCounrty,
                inputAction: TextInputAction.next,
                controller: provider.countryCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "State",
                errorText: provider.stateError,
                onChanged: provider.validateState,
                inputAction: TextInputAction.next,
                controller: provider.stateCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "City",
                errorText: provider.cityError,
                onChanged: provider.validateCity,
                inputAction: TextInputAction.next,
                controller: provider.cityCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Address",
                errorText: provider.addressError,
                onChanged: provider.validateAddress,
                inputAction: TextInputAction.next,
                controller: provider.addressCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "PIN Code",
                errorText: provider.pinCodeError,
                onChanged: provider.validatePin,
                inputAction: TextInputAction.next,
                controller: provider.pinCodeCtrl,
                inputType: TextInputType.number,
                inputFormatters: [
                  TextInputFormats.digitsFormatter,
                ],
              ),
              16.verticalSpace,
              CommonTextFormFieldWithValidator(
                hintText: "Paste Location here",
                errorText: provider.locationError,
                onChanged: provider.validateLocation,
                inputAction: TextInputAction.done,
                controller: provider.locationCtrl,
                inputType: TextInputType.name,
                inputFormatters: [
                  TextInputFormats.noWhiteSpaceFormatterForInitials,
                ],
              ),
              50.verticalSpace
            ],
          );
        }),
      ),
    );
  }
}
