class CreateProfile {
  String? email;
  String? name;
  String? password;
  String? phone;
  String? uId;
  String? token;

  CreateProfile(
      {required this.password, required this.uId, required this.email});

  CreateProfile.fromJson(Map<String, dynamic>? json) {
    email = json?['email'];
    password = json?['password'];
    name = json?['name'];
    uId = json?['uId'];
    token = json?['token'];
    phone = json?['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'password': password,
      'uId': uId,
      'token': token,
    };
  }
}
