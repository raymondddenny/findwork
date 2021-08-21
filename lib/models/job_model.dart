import 'dart:convert';

class JobModel {
  String? id;
  String? name;
  String? category;
  String? companyName;
  String? companyLogo;
  String? location;
  List<String>? about;
  List<String>? qualifications;
  List<String>? responsibilities;
  int? createdAt;
  int? updateAt;
  JobModel({
    this.id,
    this.name,
    this.category,
    this.companyName,
    this.companyLogo,
    this.location,
    this.about,
    this.qualifications,
    this.responsibilities,
    this.createdAt,
    this.updateAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'location': location,
      'about': about,
      'qualifications': qualifications,
      'responsibilities': responsibilities,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      companyName: json['companyName'],
      companyLogo: json['companyLogo'],
      location: json['location'],
      about: List<String>.from(json['about']),
      qualifications: List<String>.from(json['qualifications']),
      responsibilities: List<String>.from(json['responsibilities']),
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
    );
  }
}
