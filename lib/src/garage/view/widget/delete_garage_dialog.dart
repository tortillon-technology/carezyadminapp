import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../utils/common_widgets/primary_button.dart';
import '../../../../utils/helpers/hex_color.dart';

void garageDeleteDialog(BuildContext context, {required Function() onDelete}) {
  showDialog(
    context: context,
    barrierColor: HexColor('#DFD5C5').withValues(alpha: 0.56),
    builder: (context) => DeleteGarageDialog(onDelete: onDelete),
  );
}

class DeleteGarageDialog extends StatelessWidget {
  final Function() onDelete;
  const DeleteGarageDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want\nto delete this garage?",
              textAlign: TextAlign.center,
              style: BaiFontPalette.fBlack_16_600.copyWith(
                color: HexColor('#2F2F2F'),
                fontWeight: FontWeight.w700,
              ),
            ),
            23.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logout Button
                Expanded(
                  child: PrimaryButton(
                    text: "Delete",
                    height: 50.h,
                    onPressed: () {
                      onDelete.call();
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                16.horizontalSpace,

                // Cancel Button
                Expanded(
                  child: PrimaryButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    borderWidth: 1,
                    isOutlined: true,
                    height: 50.h,
                    textColor: HexColor('#EC0008'),
                    borderColor: HexColor('#EC0008'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
