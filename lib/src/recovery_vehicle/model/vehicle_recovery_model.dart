import 'package:equatable/equatable.dart';

class VehicleRecoveryModel extends Equatable {
  const VehicleRecoveryModel({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory VehicleRecoveryModel.fromJson(Map<String, dynamic> json) {
    return VehicleRecoveryModel(
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
    required this.data,
  });

  final List<Recovery> data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Recovery>.from(json["data"]!.map((x) => Recovery.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Recovery extends Equatable {
  Recovery({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.whatsapp,
    this.city,
    this.images,
    this.address,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? whatsapp;
  String? city;
  String? address;
  List<Image>? images;

  factory Recovery.fromJson(Map<String, dynamic> json) {
    return Recovery(
      id: json["id"],
      address: json["address"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      whatsapp: json["whatsapp"],
      city: json["city"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        whatsapp,
        city,
        images,
      ];
}

class Image extends Equatable {
  Image({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["id"],
      image: json["image"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        image,
      ];
}
