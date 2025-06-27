import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../../../utils/helpers/text_input_formatters.dart';
import '../../view_model/add_service_view_model.dart';

class TyrePressure extends StatelessWidget {
  final AddServiceViewModel viewModel;
  const TyrePressure({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sw(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Consumer<AddServiceViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tyre Pressure",
                  style: PlusJakartaFontPalette.fBlack_16_600,
                )
              ],
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: buildRowItem(
                    title: "Front Right",
                    inputAction: TextInputAction.next,
                    onChange: (data) {
                      if (data.isEmpty) {
                        provider.frPressure = null;
                      } else {
                        provider.frPressure = data;
                      }
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: buildRowItem(
                    title: "Front Left",
                    inputAction: TextInputAction.next,
                    onChange: (data) {
                      if (data.isEmpty) {
                        provider.flPressure = null;
                      } else {
                        provider.flPressure = data;
                      }
                    },
                  ),
                ),
              ],
            ),
            26.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: buildRowItem(
                    title: "Rear Right",
                    inputAction: TextInputAction.next,
                    onChange: (data) {
                      if (data.isEmpty) {
                        provider.rrPressure = null;
                      } else {
                        provider.rrPressure = data;
                      }
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: buildRowItem(
                    title: "Rear Left",
                    inputAction: TextInputAction.done,
                    onChange: (data) {
                      if (data.isEmpty) {
                        provider.rlPressure = null;
                      } else {
                        provider.rlPressure = data;
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget buildRowItem(
      {required String title,
      Function(String d)? onChange,
      TextInputAction? inputAction}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PlusJakartaFontPalette.f1C1C1C_14_600,
        ),
        16.verticalSpace,
        CommonTextFormFieldWithValidator(
          hintText: "Pressure",
          onChanged: onChange,
          inputAction: inputAction,
          inputType: TextInputType.number,
          inputFormatters: [
            TextInputFormats.digitsFormatter,
          ],
        )
      ],
    );
  }
}
