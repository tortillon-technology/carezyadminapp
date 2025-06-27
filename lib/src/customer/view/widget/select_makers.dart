import 'package:cached_network_image/cached_network_image.dart';
import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/utils/helpers/common_functions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/constants/string_constants.dart';
import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../view_model/customer_view_model.dart';

class SelectMakers extends StatefulWidget {
  final CustomerViewModel viewModel;
  const SelectMakers({super.key, required this.viewModel});

  @override
  State<SelectMakers> createState() => _SelectMakersState();
}

class _SelectMakersState extends State<SelectMakers> {
  @override
  void initState() {
    afterInit(init);
    super.initState();
  }

  init() {
    if (widget.viewModel.brandsList.isEmpty) {
      widget.viewModel.getBrands();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Text(
              Strings.selectMakers,
              style: BaiFontPalette.fBlack_18_600,
            ),
            24.verticalSpace,
            Consumer<CustomerViewModel>(builder: (context, provider, child) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: provider.brandsList.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 103.w / 129.h),
                itemBuilder: (context, index) {
                  bool isSelected = provider.selectedBrand?.id ==
                      provider.brandsList[index].id;

                  String? logoUrl = provider.brandsList[index].logoUrl;
                  String? name = provider.brandsList[index].nameEn;
                  return InkWell(
                    onTap: () {
                      provider.update(
                        callback: () {
                          if (provider.brandsList[index].id != null) {
                            provider.selectedBrand = provider.brandsList[index];
                            provider.checkMakers();
                            provider.getModels(
                                provider.brandsList[index].id.toString());
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: Column(
                      children: [
                        Container(
                          width: 103.w,
                          height: 100.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color:
                                isSelected ? HexColor("#FFF7F3") : Colors.white,
                            border: Border.all(
                              width: isSelected ? 1.5.w : 1.w,
                              color: isSelected
                                  ? HexColor("#EC0008")
                                  : HexColor("#928B8B").withAlpha(33),
                            ),
                          ),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: logoUrl ?? "",
                              width: 58.w,
                              height: 58.w,
                              errorWidget: (context, url, error) => Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        11.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: PlusJakartaFontPalette.f616161_14_400
                                .copyWith(color: HexColor('#424242')),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
