import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/styles/fonts/bai_font_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../model/home_card_model.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.cards,
  });

  final List<HomeCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 175.w / 110.w,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.w),
      itemCount: cards.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(16.w),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      cards[index].svg,
                      width: 16.w,
                      height: 16.w,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Text(
                (cards[index].count ?? 0).toString(),
                style: BaiFontPalette.fBlack_25_600,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              4.verticalSpace,
              Text(
                cards[index].title,
                style: PlusJakartaFontPalette.f777777_13_600,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
