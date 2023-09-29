class FavoritesJobsModel {
  int? id;
  int? user_id;
  int? like;
  String? image;
  String? name;
  String? location;
  int? job_id;
  String? job_name;
  String? job_image;
  String? job_time_type;
  String? job_type;
  String? job_level;
  String? job_description;
  String? job_skill;
  String? comp_name;
  String? comp_email;
  String? comp_website;
  String? about_comp;
  String? job_location;
  String? salary;
  int? favorites;
  int? expired;
  String? created_at;
  String? updated_at;

  FavoritesJobsModel({
    this.id,
    this.name,
    this.image,
    this.user_id,
    this.like,
    this.location,
    this.job_id,
    this.job_name,
    this.job_image,
    this.job_time_type,
    this.job_type,
    this.job_level,
    this.job_description,
    this.job_skill,
    this.comp_name,
    this.comp_email,
    this.comp_website,
    this.about_comp,
    this.job_location,
    this.salary,
    this.favorites,
    this.expired,
    this.created_at,
    this.updated_at,
  });

  factory FavoritesJobsModel.fromJson(Map<String, dynamic> json) {
    return FavoritesJobsModel(
      id: json['id']!,
      name: json['name']!,
      image: json['image']!,
      user_id: json['user_id']!,
      like: json['like']!,
      location: json['jobs']!['location']!,
      job_id: json['jobs']!['id']!,
      job_name: json['jobs']!['name']!,
      job_image: json['jobs']!['image']!,
      job_time_type: json['jobs']!['job_time_type']!,
      job_type: json['jobs']!['job_type']!,
      job_level: json['jobs']!['job_level']!,
      job_description: json['jobs']!['job_description']!,
      job_skill: json['jobs']!['job_skill']!,
      comp_name: json['jobs']!['comp_name']!,
      comp_email: json['jobs']!['comp_email']!,
      comp_website: json['jobs']!['comp_website']!,
      about_comp: json['jobs']!['about_comp']!,
      job_location: json['jobs']!['location']!,
      salary: json['jobs']!['salary']!,
      favorites: json['jobs']!['favorites']!,
      expired: json['jobs']!['expired']!,
      created_at: json['jobs']!['created_at']!,
      updated_at: json['jobs']!['updated_at']!,
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'image': image,
  //     'like': like,
  //     'user_id': user_id,
  //     'location': location,
  //     'id': job_id,
  //     'name': job_name,
  //     'image': job_image,
  //     'job_time_type': job_time_type,
  //     'job_type': job_type,
  //     'job_level': job_level,
  //     'job_description': job_description,
  //     'job_skill': job_skill,
  //     'comp_name': comp_name,
  //     'comp_email': comp_email,
  //     'comp_website': comp_website,
  //     'about_comp': about_comp,
  //     'location': job_location,
  //     'salary': salary,
  //     'favorites': favorites,
  //     'expired': expired,
  //     'created_at': created_at,
  //     'updated_at': updated_at,
  //   };
  // }
}
