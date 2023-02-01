class UserModel {
  String? username;
  String? fullName;
  String? email;
  String? password;
  String? image;
  String? uId;
  String? webSite;
  String? bio;
  String? phone;

  UserModel({
    this.fullName,
    this.username,
    this.password,
    this.email,
    this.uId,
    this.image,
    this.bio,
    this.phone,
    this.webSite,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    phone = json['phone'];
    webSite = json['webSite'];
  }
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'username': username,
      'email': email,
      'password': password,
      'uId': uId,
      'image': image,
      'bio': bio,
      'phone': phone,
      'webSite': webSite,
    };
  }
}
