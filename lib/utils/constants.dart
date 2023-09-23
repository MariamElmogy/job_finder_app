const kUsersCollections = 'users';
const kKeepMeLoggedIn = 'keepMeLoggedIn';
const kUserId = 'userId';
const kUserToken = 'userToken';
const baseUrl = 'https://project2.amit-learning.com/api';
const kEmail = 'email';
const kisFilled = 'email';



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
