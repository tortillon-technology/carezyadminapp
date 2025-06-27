import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  const CustomerModel({
    this.status,
    this.message,
    this.results,
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
    this.data,
  });

  final List<Customer>? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Customer>.from(json["data"]!.map((x) => Customer.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Customer extends Equatable {
  const Customer({
    this.id,
    this.nameEn,
    this.phoneNumber,
  });

  final int? id;
  final String? nameEn;
  final String? phoneNumber;

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json["id"],
      nameEn: json["name_en"],
      phoneNumber: json["phone_number"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        nameEn,
        phoneNumber,
      ];
}
