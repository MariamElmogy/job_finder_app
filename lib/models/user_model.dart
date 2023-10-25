class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel({
    this.name,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    // add object to my database
    return {
      'name': name,
      'email': email,
      // 'password': password,
    };
  }
}
