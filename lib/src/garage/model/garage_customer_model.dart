import 'package:equatable/equatable.dart';

import '../../customer/model/customer_list_model.dart';



class GarageCustomerModel extends Equatable {
  const GarageCustomerModel({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory GarageCustomerModel.fromJson(Map<String, dynamic> json) {
    return GarageCustomerModel(
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
    this.garageId,
    this.garageName,
    this.customers,
    this.pagination,
  });

  final int? garageId;
  final String? garageName;
  final List<Customer>? customers;
  final Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      garageId: json["garage_id"],
      garageName: json["garage_name"],
      customers: json["customers"] == null
          ? []
          : List<Customer>.from(
              json["customers"]!.map((x) => Customer.fromJson(x))),
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]),
    );
  }

  @override
  List<Object?> get props => [
        garageId,
        garageName,
        customers,
        pagination,
      ];
}

class Pagination extends Equatable {
  const Pagination({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
    required this.nextPage,
    required this.previousPage,
  });

  final int? currentPage;
  final int? pageSize;
  final int? totalItems;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrevious;
  final dynamic nextPage;
  final dynamic previousPage;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json["current_page"],
      pageSize: json["page_size"],
      totalItems: json["total_items"],
      totalPages: json["total_pages"],
      hasNext: json["has_next"],
      hasPrevious: json["has_previous"],
      nextPage: json["next_page"],
      previousPage: json["previous_page"],
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        pageSize,
        totalItems,
        totalPages,
        hasNext,
        hasPrevious,
        nextPage,
        previousPage,
      ];
}
