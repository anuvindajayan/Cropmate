import 'dart:convert';

UserManage userManageFromJson(String str) =>
    UserManage.fromJson(json.decode(str));

String userManageToJson(UserManage data) => json.encode(data.toJson());

class UserManage {
  int? status;
  List<Datum>? data;

  UserManage({
    this.status,
    this.data,
  });

  factory UserManage.fromJson(Map<String, dynamic> json) => UserManage(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? username;
  String? email;
  UserType? userType;
  String? phone;
  String? address;
  String? location;

  Datum({
    this.id,
    this.username,
    this.email,
    this.userType,
    this.phone,
    this.address,
    this.location,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        userType: userTypeValues.map[json["user_type"]]!,
        phone: json["phone"],
        address: json["address"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "user_type": userTypeValues.reverse[userType],
        "phone": phone,
        "address": address,
        "location": location,
      };
}

enum UserType { EMPTY, FARMER, USER }

final userTypeValues = EnumValues(
    {"": UserType.EMPTY, "Farmer": UserType.FARMER, "User": UserType.USER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
