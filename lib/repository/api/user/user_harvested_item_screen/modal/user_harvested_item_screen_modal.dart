// To parse this JSON data, do
//
//     final farmerProductModal = farmerProductModalFromJson(jsonString);

import 'dart:convert';

FarmerProductModal farmerProductModalFromJson(String str) => FarmerProductModal.fromJson(json.decode(str));

String farmerProductModalToJson(FarmerProductModal data) => json.encode(data.toJson());

class FarmerProductModal {
  int? status;
  List<Datum>? data;

  FarmerProductModal({
    this.status,
    this.data,
  });

  factory FarmerProductModal.fromJson(Map<String, dynamic> json) => FarmerProductModal(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? status;
  Data? data;

  Datum({
    this.status,
    this.data,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? cropType;
  String? cropName;
  String? image;
  double? price;
  int? quantity;
  String? description;
  bool? isAvailable;
  String? postedBy;

  Data({
    this.id,
    this.cropType,
    this.cropName,
    this.image,
    this.price,
    this.quantity,
    this.description,
    this.isAvailable,
    this.postedBy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    cropType: json["crop_type"],
    cropName: json["crop_name"],
    image: json["image"],
    price: json["price"],
    quantity: json["quantity"],
    description: json["description"],
    isAvailable: json["is_available"],
    postedBy: json["posted_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "crop_type": cropType,
    "crop_name": cropName,
    "image": image,
    "price": price,
    "quantity": quantity,
    "description": description,
    "is_available": isAvailable,
    "posted_by": postedBy,
  };
}
