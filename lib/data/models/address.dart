import 'package:flutter/material.dart';

///
class Address extends ChangeNotifier {
  ///
  Address({
    required this.name,
    required this.street,
    required this.zipCode,
    required this.city,
  });

  ///
  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    street = json['street'] as String;
    zipCode = json['zip_code'] as String;
    city = json['city'] as String;
  }

  late String name;
  late String street;
  late String zipCode;
  late String city;

  ///
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['street'] = street;
    data['zip_code'] = zipCode;
    data['city'] = city;
    return data;
  }
}
