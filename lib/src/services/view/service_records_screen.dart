import 'dart:async';

import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/services/view_model/service_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/common_widgets/search_switch_state.dart';
import '../../../utils/helpers/common_functions.dart';

class ServiceRecordsScreen extends StatefulWidget {
  const ServiceRecordsScreen({super.key});

  @override
  State<ServiceRecordsScreen> createState() => _ServiceRecordsScreenState();
}

class _ServiceRecordsScreenState extends State<ServiceRecordsScreen> {
  late ServiceViewModel viewModel;

  final searchController = TextEditingController();
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel = ServiceViewModel();
    afterInit(init);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  init() {
    viewModel.getServiceList();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !viewModel.isPaginating &&
        viewModel.totalItems != viewModel.serviceList.length) {
      viewModel.getServiceList(
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
      viewModel.getServiceList(
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
          titleText: "Service Records",
          systemOverlay: homeSystemOverlay,
          textStyle: BaiFontPalette.fWhite_20_600,
          iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
          backgroundColor: ColorPalette.primaryColor,
          iconColor: Colors.white,
          textSpace: 16,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              11.verticalSpace,
              CommonTextFormFieldWithValidator(
                radius: 10.r,
                hintText: "Search service number",
                controller: searchController,
                onChanged: _onSearchChanged,
                suffix: Selector<ServiceViewModel, bool>(
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
                                  viewModel.serviceList = [];
                                  viewModel.getServiceList();
                                  viewModel.check('');
                                }
                              : null,
                          child: SvgPicture.asset(
                            hasSearchData ? Assets.svgClose : Assets.svgSearch,
                            colorFilter: ColorFilter.mode(
                                ColorPalette.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      );
                    }),
              ),
              18.verticalSpace,
              Text(
                'Recent Services',
                style: BaiFontPalette.fBlack_18_600,
              ),
              10.verticalSpace,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    viewModel.nextPage = 1;
                    viewModel.totalItems = 0;
                    viewModel.serviceList = [];
                    viewModel.getServiceList(
                      query: searchController.text,
                    );
                    viewModel.check('');
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Consumer<ServiceViewModel>(
                        builder: (context, provider, child) {
                      return SearchSwitchState(
                        loader: provider.isLoading,
                        child: Column(
                          children: [
                            ...List.generate(
                              provider.serviceList.length,
                              (index) {
                                bool isLast =
                                    index == provider.serviceList.length;
                                final item = provider.serviceList[index];
                                String customerName = item.serviceNumber ?? "";
                                String vehicleName = item.vehicleName ?? "";
                                String lastServiceDate = item.serviceDate ?? "";
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    viewModel.id = (item.id ?? 0).toString();
                                    Navigator.pushNamed(
                                        context,
                                        RouteConstants
                                            .routeServiceDetailsScreen,
                                        arguments: viewModel);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16.w),
                                    margin: EdgeInsets.only(
                                        bottom: isLast ? 0 : 8.h),
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
                                                customerName
                                                    .capitalizeEachLetter(),
                                                style: PlusJakartaFontPalette
                                                    .fBlack_14_600,
                                              ),
                                              4.verticalSpace,
                                              Text(
                                                vehicleName,
                                                style: PlusJakartaFontPalette
                                                    .f6E6E6E_12_500,
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (lastServiceDate.isNotEmpty)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                lastServiceDate,
                                                style: PlusJakartaFontPalette
                                                    .fBlack_12_600,
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (provider.isPaginating)
                              SizedBox(
                                width: context.sw(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: ColorPalette.fEC0008,
                                    )
                                  ],
                                ),
                              ),
                            100.verticalSpace,
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              width: 210.w,
              height: 60.h,
              text: "Add New Service",
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                        context, RouteConstants.routeAddServiceScreen)
                    .then(
                  (value) {
                   viewModel.getServiceList();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
