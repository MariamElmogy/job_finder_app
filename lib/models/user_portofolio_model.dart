class UserPortofolioModel {
  String? cv_file;
  String? image;
  String? name;
  int? user_id;
  String? email;

  UserPortofolioModel({
    this.cv_file,
    this.image,
    this.name,
    this.email,
    this.user_id,
  });

  factory UserPortofolioModel.fromJson(Map<String, dynamic> json) {
    return UserPortofolioModel(
      cv_file: json['cv_file'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      user_id: json['user_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'cv_file': cv_file,
      'name': name,
      'email': email,
      'image': image,
      'user_id': user_id,
    };
  }
}
