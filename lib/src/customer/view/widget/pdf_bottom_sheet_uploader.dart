import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/pdf_upload_view_model.dart';

class PdfBottomSheetUploader extends StatefulWidget {
  final String customerId;
  final Function()? onSuccess;
  const PdfBottomSheetUploader(
      {super.key, required this.customerId, this.onSuccess});

  @override
  State<PdfBottomSheetUploader> createState() => _PdfBottomSheetUploaderState();
}

class _PdfBottomSheetUploaderState extends State<PdfBottomSheetUploader> {
  late final PdfUploadViewModel viewModel;

  @override
  void initState() {
    viewModel = PdfUploadViewModel();
    viewModel.customerId = widget.customerId;
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: PopScope(
        canPop: false,
        child:
            Consumer<PdfUploadViewModel>(builder: (context, provider, child) {
          return AbsorbPointer(
            absorbing: provider.isLoading,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: context.sw(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              30.verticalSpace,
                              const Text("Upload Vehicle Health Report",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              30.verticalSpace,
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: InkWell(
                            onTap: provider.isLoading
                                ? null
                                : () => Navigator.pop(context),
                            child: Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    20.verticalSpace,
                    CommonTextFormFieldWithValidator(
                      hintText: "Report Name",
                      controller: provider.nameController,
                      onChanged: provider.checkButtonEnable,
                    ),
                    22.verticalSpace,
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                          ),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            provider.pickPDF();
                          },
                          icon: const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Select PDF",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            provider.fileName ?? 'No file selected',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    PrimaryButton(
                        isLoading: provider.isLoading,
                        text: "Upload",
                        onPressed: provider.enableButton
                            ? () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final status = await provider.uploadReport();
                                if ((status ?? false) && context.mounted) {
                                  widget.onSuccess?.call();
                                  Navigator.pop(context);
                                } else {
                                  toastification.show(
                                      title: Text(
                                        viewModel.errorMessage ?? "",
                                        style: PlusJakartaFontPalette
                                            .fBlack_12_400
                                            .copyWith(
                                          color: ColorPalette.primaryColor,
                                        ),
                                      ),
                                      autoCloseDuration:
                                          const Duration(seconds: 5),
                                      style: ToastificationStyle.simple,
                                      alignment: Alignment.bottomCenter,
                                      type: ToastificationType.error,
                                      borderSide: BorderSide(
                                        color: ColorPalette.primaryColor,
                                      ));
                                }
                              }
                            : null),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
