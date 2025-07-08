import 'package:equatable/equatable.dart';

class ServiceListModel extends Equatable {
  const ServiceListModel({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  factory ServiceListModel.fromJson(Map<String, dynamic> json) {
    return ServiceListModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }

  @override
  List<Object?> get props => [
        success,
        data,
        message,
      ];
}

class Data extends Equatable {
  const Data({
    this.services,
    this.pagination,
    this.searchQuery,
  });

  final List<Service>? services;
  final Pagination? pagination;
  final String? searchQuery;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      services: json["services"] == null
          ? []
          : List<Service>.from(
              json["services"]!.map((x) => Service.fromJson(x))),
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]),
      searchQuery: json["search_query"],
    );
  }

  @override
  List<Object?> get props => [
        services,
        pagination,
        searchQuery,
      ];
}

class Pagination extends Equatable {
  const Pagination({
    this.currentPage,
    this.totalPages,
    this.totalCount,
    this.hasNext,
    this.hasPrevious,
    this.pageSize,
  });

  final int? currentPage;
  final int? totalPages;
  final int? totalCount;
  final bool? hasNext;
  final bool? hasPrevious;
  final String? pageSize;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json["current_page"],
      totalPages: json["total_pages"],
      totalCount: json["total_count"],
      hasNext: json["has_next"],
      hasPrevious: json["has_previous"],
      pageSize: json["page_size"],
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        totalPages,
        totalCount,
        hasNext,
        hasPrevious,
        pageSize,
      ];
}

class Service extends Equatable {
  const Service({
    this.id,
    this.serviceNumber,
    this.vehicleName,
    this.serviceDate,
  });

  final int? id;
  final String? serviceNumber;
  final String? vehicleName;
  final String? serviceDate;

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json["id"],
      serviceNumber: json["service_number"],
      vehicleName: json["vehicle_name"],
      serviceDate: json["service_date"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        serviceNumber,
        vehicleName,
        serviceDate,
      ];
}
