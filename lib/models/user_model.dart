import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  UserData data;
  String message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: UserData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class UserData {
  UserData({
    required this.token,
    required this.data,
  });

  String token;
  DataData data;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "data": data.toJson(),
      };
}

class DataData {
  DataData({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.emailVerifiedAt,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phoneNumber;
  String email;
  DateTime emailVerifiedAt;
  String type;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        type: json["type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "type": type,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
