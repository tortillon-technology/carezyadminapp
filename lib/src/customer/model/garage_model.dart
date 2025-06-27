import 'package:equatable/equatable.dart';

class GarageModel extends Equatable {
  const GarageModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(
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

  final List<Garage>? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Garage>.from(json["data"]!.map((x) => Garage.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Garage extends Equatable {
  const Garage({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.name,
    this.email,
    this.phoneNumber,
    this.whatsappNumber,
    this.garageRegistrationNumber,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.description,
    this.garageImages,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? deleted;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? whatsappNumber;
  final String? garageRegistrationNumber;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  final String? description;
  final String? garageImages;

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      id: json["id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deleted: json["deleted"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      whatsappNumber: json["whatsapp_number"],
      garageRegistrationNumber: json["garage_registration_number"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      pincode: json["pincode"],
      description: json["description"],
      garageImages: json["garage_images"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        deleted,
        name,
        email,
        phoneNumber,
        whatsappNumber,
        garageRegistrationNumber,
        address,
        city,
        state,
        country,
        pincode,
        description,
        garageImages,
      ];
}
