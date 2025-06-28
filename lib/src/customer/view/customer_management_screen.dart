import 'dart:async';

import 'package:carezyadminapp/res/enums/enums.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
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
import '../../../utils/helpers/common_functions.dart';
import '../view_model/customer_manage_view_model.dart';

class CustomerManagementScreen extends StatefulWidget {
  const CustomerManagementScreen({super.key});

  @override
  State<CustomerManagementScreen> createState() =>
      _CustomerManagementScreenState();
}

class _CustomerManagementScreenState extends State<CustomerManagementScreen> {
  late CustomerManageViewModel viewModel;

  final searchController = TextEditingController();
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel = CustomerManageViewModel();
    afterInit(init);
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  init() {
    viewModel.getCustomerList();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !viewModel.isPaginating &&
        viewModel.totalItems != viewModel.customerList.length) {
      viewModel.getCustomerList(
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
      viewModel.getCustomerList(
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
          titleText: "Customer Management",
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
                hintText: "Search Customer Name/ Reg.No",
                controller: searchController,
                onChanged: _onSearchChanged,
                suffix: Selector<CustomerManageViewModel, bool>(
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
                                  viewModel.getCustomerList();
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
                'Customers',
                style: BaiFontPalette.fBlack_18_600,
              ),
              10.verticalSpace,
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () async {
                  viewModel.nextPage = 1;
                  viewModel.totalItems = 0;
                  viewModel.customerList = [];
                  viewModel.getCustomerList(
                    query: searchController.text,
                  );
                  viewModel.check('');
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Consumer<CustomerManageViewModel>(
                      builder: (context, provider, child) {
                    return SearchSwitchState(
                      loader: provider.isLoading,
                      child: Column(
                        children: [
                          ...List.generate(
                            provider.customerList.length,
                            (index) {
                              bool isLast =
                                  index == provider.customerList.length;
                              final item = provider.customerList[index];
                              String customerName = item.customerName ?? "";
                              String vehicleName = item.vehicleName ?? "";
                              String lastServiceDate =
                                  item.lastServiceDate ?? "";
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context,
                                      RouteConstants
                                          .routeCustomerDetailsScreen);
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
                                              "Last Service",
                                              style: PlusJakartaFontPalette
                                                  .fBlack_12_400,
                                            ),
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
                                children: [CircularProgressIndicator()],
                              ),
                            ),
                          100.verticalSpace,
                        ],
                      ),
                    );
                  }),
                ),
              ))
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              width: 210.w,
              height: 60.h,
              text: "Add Customer",
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteConstants.routeAddCustomerScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}

class SearchSwitchState extends StatelessWidget {
  final SearchLoader loader;
  final Widget child;
  final String? error;
  const SearchSwitchState({
    super.key,
    required this.loader,
    required this.child,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return switch (loader) {
      SearchLoader.loading => const Center(child: CircularProgressIndicator()),
      SearchLoader.loaded => child,
      SearchLoader.error => buildError(context, error: "Error"),
      SearchLoader.noSearchData => buildError(context, error: "No search data"),
      SearchLoader.noData => buildError(context, error: "No data found"),
    };
  }

  Widget buildError(BuildContext context, {String? error}) {
    return SizedBox(
      height: context.sh(size: .7),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            error ?? "Error",
            style: PlusJakartaFontPalette.fBlack_14_400,
          )),
        ],
      ),
    );
  }
}
