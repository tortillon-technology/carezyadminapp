import 'dart:async';

import 'package:carezyadminapp/src/services/view_model/add_service_view_model.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/common_text_form.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class SearchCustomerScreen extends StatefulWidget {
  final AddServiceViewModel viewModel;

  const SearchCustomerScreen({super.key, required this.viewModel});

  @override
  State<SearchCustomerScreen> createState() => _SearchCustomerScreenState();
}

class _SearchCustomerScreenState extends State<SearchCustomerScreen> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  Timer? _debounce;

  @override
  void dispose() {
    focusNode.unfocus();
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.viewModel.searchCustomers(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          titleText: "Search Customer",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              CommonTextFormFieldWithValidator(
                hintText: "Search  pho.no",
                onChanged: _onSearchChanged,
                controller: _controller,
                inputType: TextInputType.number,
                inputFormatters: [TextInputFormats.digitsFormatter],
                focusNode: focusNode,
                suffix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SvgPicture.asset(
                    Assets.svgSearch,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(
                        ColorPalette.primaryColor, BlendMode.srcIn),
                  ),
                ),
              ),
              Expanded(child: Consumer<AddServiceViewModel>(
                  builder: (context, provider, child) {
                if (provider.isSearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.customerList.isEmpty) {
                  return Center(
                    child: Text(
                      "No Customer Found",
                      style: BaiFontPalette.fBlack_16_500,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: provider.customerList.length,
                  itemBuilder: (context, index) {
                    bool isSelected = provider.selectedCustomer?.id ==
                        provider.customerList[index].id;
                    return ListTile(
                      onTap: () {
                        provider.update(
                          callBack: () {
                            provider.selectedCustomer = !isSelected
                                ? provider.customerList[index]
                                : null;
                            provider.checkAddButtonEnable();
                            if (provider.selectedCustomer != null) {
                              provider.getOodoReadingAndOthers(
                                  provider.selectedCustomer?.id ?? 0);
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                        );
                      },
                      leading: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorPalette.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: isSelected
                              ? null
                              : Border.all(
                                  color: HexColor("#6B6B6B"), width: 2.r),
                        ),
                        child: isSelected
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 16)
                            : null,
                      ),
                      title: Text(
                        provider.customerList[index].nameEn ?? "",
                        style: BaiFontPalette.fBlack_16_500,
                      ),
                      subtitle: Text(
                        provider.customerList[index].phoneNumber ?? "",
                        style: BaiFontPalette.fBlack_16_500
                            .copyWith(fontSize: 13.sp),
                      ),
                    );
                  },
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
