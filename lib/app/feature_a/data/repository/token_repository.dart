

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_one.dart';

class TokenRepository{
  late SharedPreferences sharedPreferences;
  // late RestClient restClient;
  TokenRepository({required this.sharedPreferences});

  void setAccessToken(String token) {
    sharedPreferences.setString("token_key", token);
  }

  String getAccessToken() {
    return sharedPreferences.getString("token_key") ?? "";
  }
}