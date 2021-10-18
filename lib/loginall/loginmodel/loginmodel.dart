class CreateProfile {
  String? email;
  String? name;
  String? password;
  String? phone;
  String? uId;
  String? token;
  String? image;
  String? cover;
  String? bio;

  CreateProfile({
    this.password,
    this.phone,
    this.uId,
    this.email,
    this.image,
    this.cover,
    this.name,
    this.bio,
  });

  CreateProfile.fromJson(Map<String, dynamic>? json) {
    email = json?['email'];
    password = json?['password'];
    name = json?['name'];
    uId = json?['uId'];
    token = json?['token'];
    phone = json?['phone'];
    bio = json?['bio'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'password': password,
      'uId': uId,
      'token': token,
      'bio': bio,
    };
  }
}
