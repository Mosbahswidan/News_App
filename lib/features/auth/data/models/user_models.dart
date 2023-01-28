class UserModel {
  String? name;
  String? email;
  String? password;
  String? image;
  String? uId;
  UserModel({
    this.name,
    this.password,
    this.email,
    this.uId,
    this.image,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'uId': uId,
      'image': image,
    };
  }
}
