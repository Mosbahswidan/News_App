class PostModel {
  String? name;
  String? image;
  String? uId;
  String? title;
  String? content;
  String? postImage;
  PostModel({
    this.name,
    this.uId,
    this.image,
    this.title,
    this.content,
    this.postImage,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    postImage = json['postImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'title': title,
      'content': content,
      'postImage': postImage,
    };
  }
}
