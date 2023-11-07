import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  int get userId => _sharedPrefs.getInt(kUserId) ?? 0;

  set userId(int value) {
    _sharedPrefs.setInt(kUserId, value);
  }

  int get jobId => _sharedPrefs.getInt(kJobId) ?? 0;

  set jobId(int value) {
    _sharedPrefs.setInt(kJobId, value);
  }

  String get token => _sharedPrefs.getString(kUserToken) ?? "";

  set token(String value) {
    _sharedPrefs.setString(kUserId, value);
  }

  String get email => _sharedPrefs.getString(kEmail) ?? "";

  set email(String value) {
    _sharedPrefs.setString(kEmail, value);
  }

  void removeEmail() {
    _sharedPrefs.remove(kEmail);
  }

  String get imgUrl => _sharedPrefs.getString(kImgUrl) ?? "";

  set imgUrl(String value) {
    _sharedPrefs.setString(kImgUrl, value);
  }

  String get username => _sharedPrefs.getString(kUserName) ?? "";

  set username(String value) {
    _sharedPrefs.setString(kUserName, value);
  }
}
