import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class ApplyJobsModel {
  String? cv_file;
  String? name;
  String? email;
  String? mobile;
  String? work_type;
  String? other_file;
  int? user_id;
  int? jobs_id;

  ApplyJobsModel({
    this.cv_file,
    this.name,
    this.email,
    this.mobile,
    this.work_type,
    this.other_file,
    this.user_id,
    this.jobs_id,
  });

  factory ApplyJobsModel.fromJson(Map<String, dynamic> json) {
    return ApplyJobsModel(
      cv_file: json['cv_file'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      work_type: json['work_type'],
      other_file: json['other_file'],
      user_id: json['user_id'],
      jobs_id: json['jobs_id'],
    );
  }
  Future<Map<String, dynamic>> toJson() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return {
      'cv_file': cv_file,
      'name': name,
      'email': email,
      'mobile': mobile,
      'work_type': work_type,
      'other_file': other_file,
      'user_id': sharedPreferences.getInt(kUserId),
      'jobs_id': jobs_id,
    };
  }
}
