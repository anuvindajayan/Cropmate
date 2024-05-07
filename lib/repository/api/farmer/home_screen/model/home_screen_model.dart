// class EquipmentListModel {
//   int? status;
//   List<Datum>? data;
//
//   EquipmentListModel({
//     this.status,
//     this.data,
//   });
//
//   factory EquipmentListModel.fromJson(Map<String, dynamic>? json) {
//     if (json != null) {
//       return EquipmentListModel(
//         status: json["status"],
//         data: json["data"] != null ? List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))) : [],
//       );
//     } else {
//       return EquipmentListModel(status: 0, data: []);
//     }
//   }
// }
//
// class Datum {
//   int? id;
//   String? brand;
//   String? eqipmentName;
//   String? image;
//   double? price;
//   int? qty;
//   String? description;
//   bool? isAvailable;
//
//   Datum({
//     this.id,
//     this.brand,
//     this.eqipmentName,
//     this.image,
//     this.price,
//     this.qty,
//     this.description,
//     this.isAvailable,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         brand: json["Brand"],
//         eqipmentName: json["eqipment_name"],
//         image: json["image"],
//         price: json["price"],
//         qty: json["qty"],
//         description: json["description"],
//         isAvailable: json["is_available"],
//       );
// }
// To parse this JSON data, do
//
//     final equipmentListModel = equipmentListModelFromJson(jsonString);

import 'dart:convert';

EquipmentListModel equipmentListModelFromJson(String str) => EquipmentListModel.fromJson(json.decode(str));

String equipmentListModelToJson(EquipmentListModel data) => json.encode(data.toJson());

class EquipmentListModel {
  int? status;
  List<Datum>? data;

  EquipmentListModel({
    this.status,
    this.data,
  });

  factory EquipmentListModel.fromJson(Map<String, dynamic> json) => EquipmentListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? brand;
  String? eqipmentName;
  String? image;
  double? price;
  int? qty;
  String? description;
  bool? isAvailable;

  Datum({
    this.id,
    this.brand,
    this.eqipmentName,
    this.image,
    this.price,
    this.qty,
    this.description,
    this.isAvailable,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    brand: json["Brand"],
    eqipmentName: json["eqipment_name"],
    image: json["image"],
    price: json["price"],
    qty: json["qty"],
    description: json["description"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Brand": brand,
    "eqipment_name": eqipmentName,
    "image": image,
    "price": price,
    "qty": qty,
    "description": description,
    "is_available": isAvailable,
  };
}