class AppUrl {
  bool isLive() => false;

  String stg_baseUrl = "https://auth-stg.onrender.com";
  String live_baseUrl = "https://auth-shoppixa.onrender.com/";
  String api_base_url = '/api/v2';

  String register() {
    return isLive()
        ? "$live_baseUrl$api_base_url/create-users"
        : "$stg_baseUrl$api_base_url/create-users";
  }

  String login() {
    return isLive()
        ? "$live_baseUrl$api_base_url/sign-in"
        : "$stg_baseUrl$api_base_url/sign-in";
  }

  String verifyOTP() {
    return isLive()
        ? "$live_baseUrl$api_base_url/verify-otp"
        : "$stg_baseUrl$api_base_url/verify-otp";
  }

  String categoriesUrl() {
    return "https://dummyjson.com/products/categories";
  }

  String productsUrl() {
    return "https://dummyjson.com/products";
  }

  String cartUrl() {
    return "https://dummyjson.com/carts";
  }
}
