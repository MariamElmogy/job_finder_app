class UserModel {
  String? name;
  String? email;
  String? password;
  // List<String>? countries;
  // List<String>? workTypes;

  UserModel({
    this.name,
    this.email,
    this.password,
    // this.workTypes,
    // this.countries,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      // workTypes: List<String>.from(json['workTypes']),
      // countries: List<String>.from(json['countries']),
    );
  }

  Map<String, dynamic> toJson() {
    // add object to my database
    return {
      'name': name,
      'email': email,
      'password': password,
      // 'workTypes': workTypes,

      // 'password': password,
    };
  }
}
