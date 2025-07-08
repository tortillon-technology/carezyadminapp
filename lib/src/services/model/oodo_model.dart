import 'dart:convert';

OodoModel oodoModelFromJson(String str) => OodoModel.fromJson(json.decode(str));

String oodoModelToJson(OodoModel data) => json.encode(data.toJson());

class OodoModel {
  final bool? status;
  final String? message;
  final Results? results;

  OodoModel({
    this.status,
    this.message,
    this.results,
  });

  factory OodoModel.fromJson(Map<String, dynamic> json) => OodoModel(
        status: json["status"],
        message: json["message"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "results": results?.toJson(),
      };
}

class Results {
  final Data? data;

  Results({
    this.data,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? nameEn;
  final String? currentKilometer;
  final String? remainingKm;
  final String? nextServiceOdo;

  Data({
    this.id,
    this.nameEn,
    this.currentKilometer,
    this.remainingKm,
    this.nextServiceOdo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nameEn: json["name_en"],
        currentKilometer: json["current_kilometer"],
        remainingKm: json["remaining_km"],
        nextServiceOdo: json["next_service_odo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "current_kilometer": currentKilometer,
        "remaining_km": remainingKm,
        "next_service_odo": nextServiceOdo,
      };
}
