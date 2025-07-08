import 'package:equatable/equatable.dart';

class ServiceDetailsModel extends Equatable {
  const ServiceDetailsModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailsModel(
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

  final Data? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Data extends Equatable {
  const Data({
    this.serviceNumber,
    this.serviceDate,
    this.vehicle,
    this.vehicleName,
    this.registrationNumber,
    this.vinNumber,
  });

  final String? serviceNumber;
  final String? serviceDate;
  final Vehicle? vehicle;
  final String? vehicleName;
  final String? registrationNumber;
  final String? vinNumber;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      serviceNumber: json["service_number"],
      serviceDate: json["service_date"],
      vehicle:
          json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]),
      vehicleName: json["vehicle_name"],
      registrationNumber: json["registration_number"],
      vinNumber: json["vin_number"],
    );
  }

  @override
  List<Object?> get props => [
        serviceNumber,
        serviceDate,
        vehicle,
        vehicleName,
        registrationNumber,
        vinNumber,
      ];
}

class Vehicle extends Equatable {
  const Vehicle({
    this.id,
    this.brand,
    this.model,
    this.chassisNumber,
  });

  final int? id;
  final int? brand;
  final int? model;
  final dynamic chassisNumber;

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json["id"],
      brand: json["brand"],
      model: json["model"],
      chassisNumber: json["chassis_number"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        chassisNumber,
      ];
}
