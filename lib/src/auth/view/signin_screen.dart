import 'package:carezyadminapp/generated/assets.dart';
import 'package:carezyadminapp/res/constants/string_constants.dart';
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/bai_font_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:carezyadminapp/src/auth/view_model/auth_view_model.dart';
import 'package:carezyadminapp/utils/common_widgets/common_text_form.dart';
import 'package:carezyadminapp/utils/common_widgets/primary_button.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:carezyadminapp/utils/helpers/text_input_formatters.dart';
import 'package:carezyadminapp/utils/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../../utils/helpers/common_functions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late AuthViewModel viewModel;

  @override
  void initState() {
    viewModel = AuthViewModel();
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
      child: Selector<AuthViewModel, bool>(
          selector: (_, s) => s.isSignInLoading,
          builder: (context, isLoading, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: systemOverlayStyle,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: SizedBox(
                    width: context.sw(),
                    height: context.sh(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.sw(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                kToolbarHeight.verticalSpace,
                                Text(
                                  Strings.welcomeBackTo,
                                  style: BaiFontPalette.fBlack_16_500,
                                ),
                                10.verticalSpace,
                                Image.asset(
                                  Assets.pngProCareRedLogo,
                                  width: 189.w,
                                  height: 22.h,
                                ),
                                30.verticalSpace,
                                Image.asset(
                                  Assets.pngSinginCarLogo,
                                  width: 204.w,
                                  height: 204.h,
                                  fit: BoxFit.cover,
                                ).fadeIn(duration: Duration(milliseconds: 800)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.signIn,
                                  style: BaiFontPalette.fBlack_38_600,
                                ),
                                24.verticalSpace,
                                AbsorbPointer(
                                  absorbing: isLoading,
                                  child: Selector<AuthViewModel, String?>(
                                      selector: (_, s) => s.emailErrorText,
                                      builder: (context, error, child) {
                                        return CommonTextFormFieldWithValidator(
                                          height: 60.h,
                                          hintText: Strings.userName,
                                          errorText: error,
                                          inputAction: TextInputAction.next,
                                          inputFormatters: [
                                            TextInputFormats
                                                .removeWhiteSpaceFormatter,
                                          ],
                                          onChanged: viewModel.validateEmail,
                                        );
                                      }),
                                ),
                                16.verticalSpace,
                                AbsorbPointer(
                                  absorbing: isLoading,
                                  child: Selector<AuthViewModel, String?>(
                                      selector: (_, s) => s.passErrorText,
                                      builder: (context, error, child) {
                                        return CommonTextFormFieldWithValidator(
                                          height: 60.h,
                                          errorText: error,
                                          showObscureIcon: true,
                                          isObscure: true,
                                          onChanged: viewModel.validatePassword,
                                          hintText: Strings.password,
                                          inputFormatters: [
                                            TextInputFormats
                                                .removeWhiteSpaceFormatter,
                                          ],
                                        );
                                      }),
                                ),
                                16.verticalSpace,
                                Selector<AuthViewModel, bool>(
                                    selector: (_, s) => s.enableButton,
                                    builder: (context, enableButton, child) {
                                      return PrimaryButton(
                                        text: Strings.signIn,
                                        isLoading: isLoading,
                                        height: 60.h,
                                        onPressed:
                                            enableButton ? _onPress : null,
                                      );
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _onPress() async {
    FocusManager.instance.primaryFocus?.unfocus();
    bool? isSuccess = await viewModel.signIn();
    if ((isSuccess ?? false) && mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.routeHomeScreen,
        (route) => false,
      );
    } else {
      if ((viewModel.errorMessage ?? "").isNotEmpty) {
        toastification.show(
            title: Text(
              viewModel.errorMessage ?? "",
              style: PlusJakartaFontPalette.fBlack_12_400.copyWith(
                color: ColorPalette.primaryColor,
              ),
            ),
            autoCloseDuration: const Duration(seconds: 5),
            style: ToastificationStyle.simple,
            alignment: Alignment.bottomCenter,
            type: ToastificationType.error,
            borderSide: BorderSide(
              color: ColorPalette.primaryColor,
            ));
      }
    }
  }
}
