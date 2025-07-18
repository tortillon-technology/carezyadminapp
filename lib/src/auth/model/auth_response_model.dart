import 'package:equatable/equatable.dart';

class AuthResponseModel extends Equatable {
  const AuthResponseModel({
    this.status,
    this.message,
    this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
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
    required this.access,
    required this.refresh,
    required this.id,
  });

  final String? access;
  final String? refresh;
  final int? id;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      access: json["access"],
      refresh: json["refresh"],
      id: json["id"],
    );
  }

  @override
  List<Object?> get props => [
        access,
        refresh,
      ];
}
