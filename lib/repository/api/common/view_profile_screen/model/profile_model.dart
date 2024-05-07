// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? token;
  int? status;
  Data? data;
  String? msg;

  ProfileModel({
    this.token,
    this.status,
    this.data,
    this.msg,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    token: json["token"],
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "status": status,
    "data": data?.toJson(),
    "msg": msg,
  };
}

class Data {
  int? id;
  String? username;
  String? email;
  String? userType;
  String? phone;
  String? address;
  String? location;

  Data({
    this.id,
    this.username,
    this.email,
    this.userType,
    this.phone,
    this.address,
    this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    userType: json["user_type"],
    phone: json["phone"],
    address: json["address"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "user_type": userType,
    "phone": phone,
    "address": address,
    "location": location,
  };
}
