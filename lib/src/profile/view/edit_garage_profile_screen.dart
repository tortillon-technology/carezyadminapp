import 'package:carezyadminapp/src/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/bai_font_palette.dart';
import '../../../utils/common_widgets/common_app_bar.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../utils/helpers/hex_color.dart';

class EditGarageProfileScreen extends StatefulWidget {
  const EditGarageProfileScreen({super.key});

  @override
  State<EditGarageProfileScreen> createState() => _EditGarageProfileScreenState();
}

class _EditGarageProfileScreenState extends State<EditGarageProfileScreen> {

  late final ProfileViewModel viewModel;

  @override
  void initState() {
    viewModel=ProfileViewModel();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F4F4F4"),
      appBar: CommonAppBar(
        titleText: "Garage Details",
        systemOverlay: homeSystemOverlay,
        textStyle: BaiFontPalette.fWhite_20_600,
        iconBgColor: HexColor("#F5F5F5").withValues(alpha: 0.26),
        backgroundColor: ColorPalette.primaryColor,
        iconColor: Colors.white,
        textSpace: 16,
      ),
    );
  }
}
