class HotCategoryJobModel {
  String? id;
  String? name;
  String? imageUrl;
  int? createdAt;
  int? updateAt;

  HotCategoryJobModel({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updateAt,
  });

  HotCategoryJobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
  }
}
