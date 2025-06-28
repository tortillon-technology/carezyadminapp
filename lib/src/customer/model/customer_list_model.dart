import 'package:equatable/equatable.dart';

class CustomerListModel extends Equatable {
  const CustomerListModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory CustomerListModel.fromJson(Map<String, dynamic> json) {
    return CustomerListModel(
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
    this.customers,
    this.pagination,
    this.searchQuery,
    this.searchResultsCount,
  });

  final List<Customer>? customers;
  final Pagination? pagination;
  final String? searchQuery;
  final int? searchResultsCount;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      customers: json["customers"] == null
          ? []
          : List<Customer>.from(
              json["customers"]!.map((x) => Customer.fromJson(x))),
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]),
      searchQuery: json["search_query"],
      searchResultsCount: json["search_results_count"],
    );
  }

  @override
  List<Object?> get props => [
        customers,
        pagination,
        searchQuery,
        searchResultsCount,
      ];
}

class Customer extends Equatable {
  const Customer({
    this.customerId,
    this.customerName,
    this.vehicleId,
    this.vehicleName,
    this.lastServiceDate,
  });

  final int? customerId;
  final String? customerName;
  final int? vehicleId;
  final String? vehicleName;
  final dynamic lastServiceDate;

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json["customer_id"],
      customerName: json["customer_name"],
      vehicleId: json["vehicle_id"],
      vehicleName: json["vehicle_name"],
      lastServiceDate: json["last_service_date"],
    );
  }

  @override
  List<Object?> get props => [
        customerId,
        customerName,
        vehicleId,
        vehicleName,
        lastServiceDate,
      ];
}

class Pagination extends Equatable {
  const Pagination({
    this.currentPage,
    this.pageSize,
    this.totalItems,
    this.totalPages,
    this.hasNext,
    this.hasPrevious,
    this.nextPage,
    this.previousPage,
  });

  final int? currentPage;
  final int? pageSize;
  final int? totalItems;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrevious;
  final dynamic nextPage;
  final int? previousPage;

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
