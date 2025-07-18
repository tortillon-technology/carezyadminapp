import 'package:carezyadminapp/data/local/shared_service.dart';
import 'package:carezyadminapp/res/constants/app_constants.dart';
import 'package:carezyadminapp/services/get_it.dart';
import 'package:carezyadminapp/src/auth/repo/auth_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:carezyadminapp/utils/helpers/validators.dart';
import 'package:either_dart/either.dart';

class AuthViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<AuthRepo>();

  String? email;
  String? password;

  String? errorMessage;
  String? emailErrorText;
  String? passErrorText;

  bool enableButton = false;

  validateEmail(String value) {
    email = null;
    emailErrorText = Validators.validateEmail(value);
    enableButton = emailErrorText == null && (password ?? "").length >= 4;
    if (emailErrorText == null) {
      email = value;
    }
    notifyListeners();
  }

  validatePassword(String value) {
    password = null;
    passErrorText = Validators.validatePassword(value);
    enableButton = passErrorText == null && (email ?? "").isNotEmpty;
    if (passErrorText == null) {
      password = value;
    }
    notifyListeners();
  }

  // "username": "alfik@gmail.com",
  // "password": "12345"

  Future<bool?> signIn() async {
    updateLoader(true);
    return await repo.signIn(params: {
      "username": email,
      "password": password,
    }).fold(
      (left) {
        updateLoader(false);
        errorMessage = left.message;
        return false;
      },
      (right) {
        updateLoader(false);
        final isSuccess = right.status ?? false;
        if (!isSuccess) {
          errorMessage = right.message;
        } else {
          final token = right.results?.data?.access;
          final refresh = right.results?.data?.refresh;
          final id = right.results?.data?.id;
          AppConstants.accessToken = token ?? "";
          SharedService.instance.setData(key: accessTokenKey, value: token);
          SharedService.instance.setData(key: refreshTokenKey, value: refresh);
          SharedService.instance.setData(key: garageId, value: id.toString());
        }
        return isSuccess;
      },
    ).catchError((e) {
      errorMessage = e.toString();
      updateLoader(false);
      return false;
    });
  }

  @override
  updateLoader(bool value) {
    isSignInLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isSignInLoading = false;

  updateLoader(bool value);
}
