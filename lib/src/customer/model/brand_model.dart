import 'package:equatable/equatable.dart';

class BrandsModel extends Equatable {
  const BrandsModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
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

  final List<Brand>? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Brand>.from(json["data"]!.map((x) => Brand.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Brand extends Equatable {
  const Brand({
    this.id,
    this.logoUrl,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.nameEn,
    this.nameAr,
    this.logo,
    this.isActive,
  });

  final int? id;
  final String? logoUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? deleted;
  final String? nameEn;
  final String? nameAr;
  final String? logo;
  final bool? isActive;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      logoUrl: json["logo_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deleted: json["deleted"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      logo: json["logo"],
      isActive: json["is_active"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        logoUrl,
        createdAt,
        updatedAt,
        deleted,
        nameEn,
        nameAr,
        logo,
        isActive,
      ];
}
