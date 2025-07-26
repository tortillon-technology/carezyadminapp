import 'package:equatable/equatable.dart';

class OdoModel extends Equatable {
  const OdoModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory OdoModel.fromJson(Map<String, dynamic> json) {
    return OdoModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
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
    this.id,
    this.nameEn,
    this.currentKilometer,
    this.components,
  });

  final int? id;
  final String? nameEn;
  final String? currentKilometer;
  final List<Component>? components;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      nameEn: json["name_en"] ?? "",
      currentKilometer: json["current_kilometer"] ?? "",
      components: json["components"] == null
          ? []
          : List<Component>.from(
              json["components"]!.map((x) => Component.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameEn,
        currentKilometer,
        components,
      ];
}

class Component extends Equatable {
  const Component({
    this.component,
    this.oilLife,
    this.remainingKm,
    this.nextServiceOdo,
    this.componentLife,
  });

  final String? component;
  final String? oilLife;
  final String? remainingKm;
  final String? nextServiceOdo;
  final String? componentLife;

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      component: json["component"] ?? "",
      oilLife: json["oil_life"] ?? "",
      remainingKm: json["remaining_km"] ?? "",
      nextServiceOdo: json["next_service_odo"] ?? "",
      componentLife: json["component_life"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        component,
        oilLife,
        remainingKm,
        nextServiceOdo,
        componentLife,
      ];
}
