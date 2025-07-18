

class VehicleRecoveryDetails {
  const VehicleRecoveryDetails({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory VehicleRecoveryDetails.fromJson(Map<String, dynamic> json) {
    return VehicleRecoveryDetails(
      status: json["status"],
      message: json["message"],
      results:
          json["results"] == null ? null : Results.fromJson(json["results"]),
    );
  }
}

class Results {
  const Results({
    required this.data,
  });

  final RecoveryDetails? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data:
          json["data"] == null ? null : RecoveryDetails.fromJson(json["data"]),
    );
  }
}

class RecoveryDetails {
  RecoveryDetails({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.whatsapp,
    this.city,
    this.address,
    this.images,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? whatsapp;
  String? city;
  String? address;
  List<Banners>? images;

  factory RecoveryDetails.fromJson(Map<String, dynamic> json) {
    return RecoveryDetails(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      whatsapp: json["whatsapp"],
      city: json["city"],
      images: json["images"] == null
          ? []
          : List<Banners>.from(json["images"]!.map((x) => Banners.fromJson(x))),
    );
  }

}

class Banners {
  Banners({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json["id"],
      image: json["image"],
    );
  }
 
}
