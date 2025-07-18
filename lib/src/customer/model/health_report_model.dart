import 'package:equatable/equatable.dart';

class HealthReport extends Equatable {
  const HealthReport({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory HealthReport.fromJson(Map<String, dynamic> json) {
    return HealthReport(
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

  final List<Report> data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null
          ? []
          : List<Report>.from(json["data"]!.map((x) => Report.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class Report extends Equatable {
  const Report({
    required this.id,
    required this.vehicle,
    required this.reportName,
    required this.healthReport,
    required this.uploadedDate,
  });

  final int? id;
  final int? vehicle;
  final String? reportName;
  final String? healthReport;
  final String? uploadedDate;

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json["id"],
      vehicle: json["vehicle"],
      reportName: json["report_name"],
      healthReport: json["health_report"],
      uploadedDate: json["uploaded_date"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        vehicle,
        reportName,
        healthReport,
        uploadedDate,
      ];
}
