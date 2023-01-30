class AuthorModel {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  AuthorModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
  });

  AuthorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['url'] = this.url;
    data['category'] = this.category;
    return data;
  }
}
