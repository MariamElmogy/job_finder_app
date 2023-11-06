// import 'package:job_finder_app/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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

  String get imgUrl => _sharedPrefs.getString(kImgUrl) ?? "";

  set imgUrl(String value) {
    _sharedPrefs.setString(kImgUrl, value);
  }

  // Future<void> setUserId(int value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt(kUserId, value);
  // }

  // Future<int?> getUserId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt(kUserId);
  // }

//   Future<void> setJobId(int value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(kJobId, value);
//   }

//   Future<int?> getJobId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(kJobId);
//   }

//   Future<void> setUserEmail(String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(kEmail, value);
//   }

//   Future<String?> getUserEmail() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(kEmail);
//   }

//   Future<bool?> removeUserEmail() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.remove(kEmail);
//   }

//   Future<void> setUserToken(String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(kUserToken, value);
//   }

//   get getUserToken async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(kUserToken);
//   }

  String get username => _sharedPrefs.getString(kUserName) ?? "";

  set username(String value) {
    _sharedPrefs.setString(kUserName, value);
  }

  // Future<void> setUserName(String value) async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   await _sharedPrefs?.setString(kUserName, value);
  // }

  // Future<String?> getUserName() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   return _sharedPrefs?.getString(kUserName);
  // }
}
