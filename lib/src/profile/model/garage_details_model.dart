import 'package:equatable/equatable.dart';

class GarageDetails extends Equatable {
  GarageDetails({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool status;
  final String message;
  final Results? results;

  factory GarageDetails.fromJson(Map<String, dynamic> json){
    return GarageDetails(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      results: json["results"] == null ? null : Results.fromJson(json["results"]),
    );
  }

  @override
  List<Object?> get props => [
    status, message, results, ];
}

class Results extends Equatable {
  Results({
    required this.data,
  });

  final Data? data;

  factory Results.fromJson(Map<String, dynamic> json){
    return Results(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [
    data, ];
}

class Data extends Equatable {
  Data({
    required this.id,
    required this.garageImages,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.garageRegistrationNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.description,
  });

  final int id;
  final String garageImages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool deleted;
  final String name;
  final String email;
  final String phoneNumber;
  final String whatsappNumber;
  final String garageRegistrationNumber;
  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String description;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"] ?? 0,
      garageImages: json["garage_images"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deleted: json["deleted"] ?? false,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      whatsappNumber: json["whatsapp_number"] ?? "",
      garageRegistrationNumber: json["garage_registration_number"] ?? "",
      address: json["address"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      country: json["country"] ?? "",
      pincode: json["pincode"] ?? "",
      description: json["description"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
    id, garageImages, createdAt, updatedAt, deleted, name, email, phoneNumber, whatsappNumber, garageRegistrationNumber, address, city, state, country, pincode, description, ];
}
