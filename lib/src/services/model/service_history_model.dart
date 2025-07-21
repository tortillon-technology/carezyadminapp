import 'package:equatable/equatable.dart';

class ServiceHistoryModel extends Equatable {
  const ServiceHistoryModel({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory ServiceHistoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceHistoryModel(
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
    required this.id,
    required this.serviceHistory,
  });

  final int? id;
  final List<ServiceHistory> serviceHistory;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      serviceHistory: json["service_history"] == null
          ? []
          : List<ServiceHistory>.from(
              json["service_history"]!.map((x) => ServiceHistory.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        serviceHistory,
      ];
}

class ServiceHistory extends Equatable {
  const ServiceHistory({
    required this.serviceName,
    required this.description,
    required this.serviceDate,
    required this.serviceNumber,
    required this.services,
  });

  final String? serviceName;
  final String? description;
  final String? serviceDate;
  final String? serviceNumber;
  final List<String> services;

  factory ServiceHistory.fromJson(Map<String, dynamic> json) {
    return ServiceHistory(
      serviceName: json["service_name"],
      description: json["description"],
      serviceDate: json["service_date"],
      serviceNumber: json["service_number"],
      services: json["services"] == null
          ? []
          : List<String>.from(json["services"]!.map((x) => x)),
    );
  }

  @override
  List<Object?> get props => [
        serviceName,
        description,
        serviceDate,
        serviceNumber,
        services,
      ];
}
