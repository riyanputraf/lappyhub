class UserModel {
  final String id;         // Identifier tambahan
  final String uid;        // Firebase UID
  final String email;
  final String name;
  final String pin;
  final String avatar;
  final String password;

  UserModel({
    required this.id,
    required this.uid,
    required this.email,
    required this.name,
    required this.pin,
    required this.avatar,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'email': email,
      'name': name,
      'pin': pin,
      'avatar': avatar,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      pin: map['pin'],
      avatar: map['avatar'],
      password: map['password'],
    );
  }
}
