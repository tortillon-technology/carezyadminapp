import 'package:equatable/equatable.dart';

class VehicleModel extends Equatable {
  const VehicleModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      status: json["status"],
      message: json["message"],
      results:
          json["results"] == null ? null : Results.fromJson(json["results"]),
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        results,
      ];
}

class Results extends Equatable {
  const Results({
    this.data,
  });

  final List<Model>? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Model>.from(json["data"]!.map((x) => Model.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Model extends Equatable {
  const Model({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.nameEn,
    this.nameAr,
    this.isActive,
    this.brand,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? deleted;
  final String? nameEn;
  final String? nameAr;
  final bool? isActive;
  final int? brand;

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json["id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deleted: json["deleted"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      isActive: json["is_active"],
      brand: json["brand"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        deleted,
        nameEn,
        nameAr,
        isActive,
        brand,
      ];
}
