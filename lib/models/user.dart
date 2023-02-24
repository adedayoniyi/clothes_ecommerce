import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String id;
  final String token;
  final String type;
  final String address;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.token,
    required this.type,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
      'token': token,
      'type': type,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      id: map['_id'] ?? '',
      token: map['token'] ?? '',
      type: map['type'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
