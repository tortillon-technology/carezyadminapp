import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  const CustomerModel({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
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

  final CustomerDetails? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data:
          json["data"] == null ? null : CustomerDetails.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class CustomerDetails extends Equatable {
  CustomerDetails({
    this.id,
    this.nameEn,
    this.email,
    this.vinNumber,
    this.phoneNumber,
    this.registrationNumber,
    this.drivingHabit,
    this.brand,
    this.model,
  });

  int? id;
  String? nameEn;
  String? email;
  String? phoneNumber;
  String? registrationNumber;
  String? drivingHabit;
  String? vinNumber;
  Brand? brand;
  Model? model;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      id: json["id"],
      nameEn: json["name_en"],
      email: json["email"],
      vinNumber: json["vin_number"],
      phoneNumber: json["phone_number"],
      registrationNumber: json["registration_number"],
      drivingHabit: json["weekly_mileage_range"],
      brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      model: json["model"] == null ? null : Model.fromJson(json["model"]),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameEn,
        email,
        phoneNumber,
        registrationNumber,
        drivingHabit,
        brand,
        model,
        vinNumber,
      ];
}

class Brand extends Equatable {
  Brand({
    this.id,
    this.nameEn,
    this.logo,
  });

  int? id;
  String? nameEn;
  String? logo;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      nameEn: json["name_en"],
      logo: json["logo"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameEn,
        logo,
      ];
}

class Model extends Equatable {
  Model({
    this.id,
    this.nameEn,
  });

  int? id;
  String? nameEn;

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json["id"],
      nameEn: json["name_en"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameEn,
      ];
}
