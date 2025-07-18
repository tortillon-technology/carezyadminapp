import 'package:equatable/equatable.dart';

class CustomerDetails extends Equatable {
  const CustomerDetails({
    required this.status,
    required this.message,
    required this.results,
  });

  final bool? status;
  final String? message;
  final Results? results;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
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

  final CustomerData? data;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: json["data"] == null ? null : CustomerData.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class CustomerData extends Equatable {
   CustomerData({
     this.name,
     this.email,
     this.phoneNumber,
     this.vehicle,
     this.registrationNumber,
     this.vinNumber,
     this.drivingHabits,
  });

   String? name;
   String? email;
   String? phoneNumber;
   String? vehicle;
   String? registrationNumber;
   String? vinNumber;
   String? drivingHabits;

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phone_number"],
      vehicle: json["vehicle"],
      registrationNumber: json["registration_number"],
      vinNumber: json["vin_number"],
      drivingHabits: json["driving_habits"],
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        vehicle,
        registrationNumber,
        vinNumber,
        drivingHabits,
      ];
}
