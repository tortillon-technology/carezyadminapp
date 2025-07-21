import 'package:equatable/equatable.dart';

class GarageModel extends Equatable {
  const GarageModel({
    required this.status,
    required this.message,
    required this.results,
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
    required this.data,
  });

  final List<Garages> data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Garages>.from(json["data"]!.map((x) => Garages.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Garages extends Equatable {
  Garages({
    this.id,
    this.images,
    this.customerCount,
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
    this.location,
  });

  int? id;
  List<GarageImage>? images;
  int? customerCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? deleted;
  String? name;
  String? email;
  String? phoneNumber;
  String? whatsappNumber;
  String? garageRegistrationNumber;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? description;
  String? location;

  factory Garages.fromJson(Map<String, dynamic> json) {
    return Garages(
      id: json["id"],
      images: json["images"] == null
          ? []
          : List<GarageImage>.from(
              json["images"]!.map((x) => GarageImage.fromJson(x))),
      customerCount: json["customer_count"],
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
      location: json["location"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        images,
        customerCount,
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
        location,
      ];
}

class GarageImage extends Equatable {
  GarageImage({
    this.id,
    this.image,
    this.imageUrl,
    this.uploadedAt,
  });

  int? id;
  String? image;
  String? imageUrl;
  DateTime? uploadedAt;

  factory GarageImage.fromJson(Map<String, dynamic> json) {
    return GarageImage(
      id: json["id"],
      image: json["image"],
      imageUrl: json["image_url"],
      uploadedAt: DateTime.tryParse(json["uploaded_at"] ?? ""),
    );
  }

  @override
  List<Object?> get props => [
        id,
        image,
        imageUrl,
        uploadedAt,
      ];
}
