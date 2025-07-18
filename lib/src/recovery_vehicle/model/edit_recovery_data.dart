import 'package:collection/collection.dart';

class EditRecoveryData {
  EditRecoveryData({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.whatsapp,
    this.city,
    this.address,
    this.images,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? whatsapp;
  String? city;
  String? address;
  List<Banner>? images;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditRecoveryData &&
          name == other.name &&
          address == other.address &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          whatsapp == other.whatsapp &&
          city == other.city 
          && DeepCollectionEquality().equals(images, other.images)
          ;

  @override
  int get hashCode => Object.hash(
        name,
        address,
        email,
        phoneNumber,
        whatsapp,
        city,
       const DeepCollectionEquality().hash(images),
      );
}

class Banner {
  Banner({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json["id"],
      image: json["image"],
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Banner && id == other.id && image == other.image;

  @override
  int get hashCode => Object.hash(id, image);
}
