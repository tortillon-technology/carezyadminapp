import 'package:cached_network_image/cached_network_image.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/helpers/common_functions.dart';
import '../../model/vehicle_recovery_details_model.dart';

class BannerWidget extends StatefulWidget {
  final List<Banners> images;
  const BannerWidget({super.key, required this.images});
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  final ValueNotifier<int> bannerIndexNotifier = ValueNotifier(0);

  int page = 0;
  int nextPage = 0;

  @override
  void initState() {
    afterInit(_init);
    super.initState();
  }

  _init() {
    _listenController();
    _animateSlider();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _listenController() {
    pageController.addListener(() {
      page = pageController.page!.round();
      nextPage = page + 1;
    });
  }

  _updateIndex(int index) {
    bannerIndexNotifier.value = index;
  }

  void _animateSlider() {
    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      if (pageController.hasClients && mounted) {
        nextPage = page + 1;
        Future.delayed(const Duration(seconds: 3)).then((value) {
          if (pageController.hasClients && mounted) {
            pageController
                .animateToPage(nextPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear)
                .then((_) => _animateSlider());
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              if (widget.images.isNotEmpty)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 234.h,
                      width: context.sw(),
                      child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: _updateIndex,
                        itemBuilder: (context, index) {
                          int currentIndex = index % widget.images.length;

                          return CachedNetworkImage(
                            imageUrl: widget.images[currentIndex].image ?? "",
                            height: 234.h,
                            width: context.sw(),
                            imageBuilder: (context, imageProvider) => Container(
                              height: 234.h,
                              width: context.sw(),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 234.h,
                              width: context.sw(),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.network(
                              'https://static.wikia.nocookie.net/central/images/3/3f/Placeholder_view_vector.svg/revision/latest/scale-to-width-down/340?cb=20250302081817', // 👈 Add your local placeholder image
                              height: 234.h,
                              width: context.sw(),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 16.h,
                      child: ValueListenableBuilder(
                        valueListenable: bannerIndexNotifier,
                        builder: (context, value, child) {
                          return Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                widget.images.length,
                                (index) {
                                  int currentIndex =
                                      value % widget.images.length;
                                  return AnimatedContainer(
                                    width: 6.w,
                                    height: 6.w,
                                    duration: const Duration(milliseconds: 300),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.5.w),
                                    decoration: BoxDecoration(
                                        color: index == currentIndex
                                            ? HexColor('#EC0008')
                                            : HexColor('#A8A8A8')
                                                .withValues(alpha: .46),
                                        shape: BoxShape.circle),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
            ],
          );
  }
}
