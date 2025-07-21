import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/src/garage/view_model/add_garage_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GarageDescription extends StatefulWidget {
  final AddGarageViewModel viewModel;
  const GarageDescription({super.key, required this.viewModel});

  @override
  State<GarageDescription> createState() => _GarageDescriptionState();
}

class _GarageDescriptionState extends State<GarageDescription> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:
              Consumer<AddGarageViewModel>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.verticalSpace,
                Text(
                  "Garage Description",
                  style: BaiFontPalette.fBlack_18_600,
                ),
                24.verticalSpace,
                CommonTextFormFieldWithValidator(
                  hintText: "Type about Garage",
                  expands: true,
                  maxLines: 50,
                  height: 200,
                  inputAction: TextInputAction.newline,
                  controller: provider.descriptionCtrl,
                  inputType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.top,
                  errorText: provider.descriptionError,
                  onChanged: provider.validateDescription,
                ),
                50.verticalSpace
              ],
            );
          }),
        ),
      ),
    );
  }
}
