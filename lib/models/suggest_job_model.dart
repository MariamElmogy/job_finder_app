class SuggestJobsModel {
  int? id;
  String? name;
  String? image;
  String? job_time_type;
  String? job_type;
  String? job_level;
  String? job_description;
  String? job_skill;
  String? comp_name;
  String? comp_email;
  String? comp_website;
  String? about_comp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? created_at;
  String? updated_at;

  SuggestJobsModel({
    this.id,
    this.name,
    this.image,
    this.job_time_type,
    this.job_type,
    this.job_level,
    this.job_description,
    this.job_skill,
    this.comp_name,
    this.comp_email,
    this.comp_website,
    this.about_comp,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.created_at,
    this.updated_at,
  });

  factory SuggestJobsModel.fromJson(Map<String, dynamic> json) {
    return SuggestJobsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      job_time_type: json['job_time_type'],
      job_type: json['job_type'],
      job_level: json['job_level'],
      job_description: json['job_description'],
      job_skill: json['job_skill'],
      comp_name: json['comp_name'],
      comp_email: json['comp_email'],
      comp_website: json['comp_website'],
      about_comp: json['about_comp'],
      location: json['location'],
      salary: json['salary'],
      favorites: json['favorites'],
      expired: json['expired'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'job_time_type': job_time_type,
      'job_type': job_type,
      'job_level': job_level,
      'job_description': job_description,
      'job_skill': job_skill,
      'comp_name': comp_name,
      'comp_email': comp_email,
      'comp_website': comp_website,
      'about_comp': about_comp,
      'location': location,
      'salary': salary,
      'favorites': favorites,
      'expired': expired,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
