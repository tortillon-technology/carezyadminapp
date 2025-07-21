import 'dart:async';

import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/garage/view/garage_details_screen.dart';
import 'package:carezyadminapp/src/garage/view_model/garage_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/common_widgets/search_switch_state.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/routes/route_constants.dart';

class GarageManagementScreen extends StatefulWidget {
  const GarageManagementScreen({super.key});

  @override
  State<GarageManagementScreen> createState() => _GarageManagementScreenState();
}

class _GarageManagementScreenState extends State<GarageManagementScreen> {
  late GarageViewModel viewModel;

  final searchController = TextEditingController();
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel = GarageViewModel();
    afterInit(init);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  init() {
    viewModel.getGarages();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !viewModel.isPaginating &&
        viewModel.totalItems != viewModel.customerList.length) {
      viewModel.getGarages(
        isPaginating: true,
        isSearch: searchController.text.isNotEmpty,
        query: searchController.text,
      );
    }
  }

  void _onSearchChanged(String query) {
    viewModel.check(query);
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      viewModel.getGarages(
        isPaginating: false,
        isSearch: query.isNotEmpty,
        query: query,
      );
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: HexColor("#F4F4F4"),
        appBar: CommonAppBar(
          titleText: "Garage Management",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                11.verticalSpace,
                CommonTextFormFieldWithValidator(
                  radius: 10.r,
                  hintText: "Search Garage Name",
                  controller: searchController,
                  onChanged: _onSearchChanged,
                  suffix: Selector<GarageViewModel, bool>(
                      selector: (p0, p1) => p1.hasSearchQuery,
                      builder: (context, hasSearchData, child) {
                        return Padding(
                          padding: EdgeInsets.only(right: 18.w),
                          child: InkWell(
                            onTap: hasSearchData
                                ? () {
                                    searchController.clear();
                                    viewModel.nextPage = 1;
                                    viewModel.totalItems = 0;
                                    viewModel.customerList = [];
                                    viewModel.getGarages();
                                    viewModel.check('');
                                  }
                                : null,
                            child: SvgPicture.asset(
                              hasSearchData
                                  ? Assets.svgClose
                                  : Assets.svgSearch,
                              colorFilter: ColorFilter.mode(
                                  ColorPalette.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                        );
                      }),
                ),
                18.verticalSpace,
                Text(
                  'Garages',
                  style: BaiFontPalette.fBlack_18_600,
                ),
                10.verticalSpace,
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Consumer<GarageViewModel>(
                      builder: (context, provider, child) {
                    return SearchSwitchState(
                      loader: provider.isLoading,
                      child: Column(
                        children: [
                          ...List.generate(
                            provider.customerList.length,
                            (index) {
                              bool isLast =
                                  index == provider.customerList.length - 1;
                              final id = provider.customerList[index].id ?? 0;
                              final name =
                                  provider.customerList[index].name ?? "";
                              final location =
                                  provider.customerList[index].state ?? "";
                              final garageRegId = provider.customerList[index]
                                      .garageRegistrationNumber ??
                                  "";
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteConstants.routeGarageDetailsScreen,
                                    arguments: GarageArguments(
                                      id: id,
                                      callBack: () {
                                        viewModel.getGarages(
                                            isPaginating: false,
                                            isSearch: true);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  margin:
                                      EdgeInsets.only(bottom: isLast ? 0 : 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              name,
                                              style: PlusJakartaFontPalette
                                                  .fBlack_14_600,
                                            ),
                                            4.verticalSpace,
                                            Text(
                                              location,
                                              style: PlusJakartaFontPalette
                                                  .f6E6E6E_12_500,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        garageRegId,
                                        style: PlusJakartaFontPalette
                                            .f6E6E6E_14_500,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          100.verticalSpace,
                        ],
                      ),
                    );
                  }),
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              width: 210.w,
              height: 60.h,
              text: "Add New Garage",
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteConstants.routeAddGarageScreen,
                    arguments: () {
                  viewModel.getGarages(isPaginating: false, isSearch: true);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
