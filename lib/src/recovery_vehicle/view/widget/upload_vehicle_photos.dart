import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/recovery_vehicle/view_model/create_recovery_view_model.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadVehiclePhotos extends StatefulWidget {
  final CreateRecoveryViewModel viewModel;
  const UploadVehiclePhotos({super.key, required this.viewModel});

  @override
  State<UploadVehiclePhotos> createState() => _UploadVehiclePhotosState();
}

class _UploadVehiclePhotosState extends State<UploadVehiclePhotos> {
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
                "Upload Vehicle photo",
                style: BaiFontPalette.fBlack_18_600,
              ),
              24.verticalSpace,
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
                            provider.removeImage(index);
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
              if (provider.imageList.length <= 6)
                InkWell(
                  onTap: () {
                    widget.viewModel.pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("#FAFAFA"),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
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
                          style: PlusJakartaFontPalette.f6E6E6E_14_500.copyWith(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          );
        }),
      ),
    );
  }
}
