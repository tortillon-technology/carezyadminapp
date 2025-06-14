class AppConstants {
  static const String baseURL = "https://api-kbn.webc.in";

  static String accessToken = "";

  static String version = "v1";

  static String sentOTP = "/api/$version/tenant/auth/send-otp";
  static String verifyOTP = "/api/$version/tenant/auth/verify-otp";
  static String emailLogin = "/api/$version/tenant/auth/login";
  static String getHomeData = "/api/$version/tenant/home";
}
