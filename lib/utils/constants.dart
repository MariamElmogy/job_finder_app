import 'package:shared_preferences/shared_preferences.dart';

const kUsersCollections = 'users';
const kKeepMeLoggedIn = 'keepMeLoggedIn';
const kUserId = 'userId';
const kJobId = 'jobId';
const kUserToken = 'userToken';
const baseUrl = 'https://project2.amit-learning.com/api';
const kEmail = 'email';
const kisFilled = 'email';
const kMessagesCollections = 'messages';
const kMessage = 'message';



String showSalary(String salary) {
  if (salary.endsWith('000')) {
    salary = salary.replaceRange(2, 5, 'K');
  }
  return salary;
}

String showLocation(String word) {
  List<String> splitted = word.split(" ");
  List<String> smaller = splitted.sublist(splitted.length - 2, splitted.length);
  word = smaller.join(" ").replaceAll('.', '');
  return word;
}

Future<void> removeEmailFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(kEmail);
}