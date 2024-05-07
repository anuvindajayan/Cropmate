

import 'dart:convert';

GovtSchemeModel govtSchemeModelFromJson(String str) => GovtSchemeModel.fromJson(json.decode(str));

String govtSchemeModelToJson(GovtSchemeModel data) => json.encode(data.toJson());

class GovtSchemeModel {
    int? status;
    List<Datum>? data;

    GovtSchemeModel({
        this.status,
        this.data,
    });

    factory GovtSchemeModel.fromJson(Map<String, dynamic> json) => GovtSchemeModel(
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
    String? schemeName;
    int? startAge;
    int? endAge;
    String? description;
    String? link;

    Datum({
        this.id,
        this.schemeName,
        this.startAge,
        this.endAge,
        this.description,
        this.link,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        schemeName: json["scheme_name"],
        startAge: json["start_age"],
        endAge: json["end_age"],
        description: json["description"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "scheme_name": schemeName,
        "start_age": startAge,
        "end_age": endAge,
        "description": description,
        "link": link,
    };
}
