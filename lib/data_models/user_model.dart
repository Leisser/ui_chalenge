import 'dart:convert';

import 'package:flutter/material.dart';

UserLogined userLoginedFromJson(String myString) =>
    UserLogined.fromJson(json.decode(myString));

class UserLogined {
  final int user_id;
  final String password;
  final String first_name;
  final String last_name;
  final String other_name;
  final String address;
  final String phone_number;
  final String email;
  final String passport_number;
  final String national_identification_number;
  final DateTime date_of_birth;
  final String country;
  DateTime date_created;
  dynamic date_modified;
  final bool is_clerk;
  final bool is_admin;
  final bool? is_super_admin;
  final bool? is_a_admin;
  final int? status;
  final String? token;

  UserLogined({
    required this.user_id,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.other_name,
    required this.address,
    required this.phone_number,
    required this.email,
    required this.passport_number,
    required this.national_identification_number,
    required this.date_of_birth,
    required this.country,
    required this.is_clerk,
    required this.date_created,
    required this.is_admin,
    this.is_super_admin,
    this.is_a_admin,
    this.status,
    this.token,
    required date_modified,
  });

  factory UserLogined.fromJson(Map<String, dynamic> json) => UserLogined(
        user_id: json["user_id"],
        password: json["password"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        other_name: json["other_name"],
        address: json["address"],
        phone_number: json["phone_number"],
        email: json["email"],
        passport_number: json["passport_number"],
        national_identification_number: json["national_identification_number"],
        date_of_birth: DateTime.parse(json["date_of_birth"]),
        country: json["country"],
        date_created: DateTime.parse(json["date_created"]),
        date_modified: json["date_modified"],
        is_clerk: json["is_clerk"],
        is_admin: json["is_admin"],
        is_super_admin: json["is_super_admin"],
        is_a_admin: json["is_a_admin"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "password": password,
        "first_name": first_name,
        "last_name": last_name,
        "other_name": other_name,
        "address": address,
        "phone_number": phone_number,
        "email": email,
        "passport_number": passport_number,
        "national_identification_number": national_identification_number,
        "date_of_birth": date_of_birth,
        "country": country,
        "date_created": date_created,
        "date_modified": date_modified,
        "is_clerk": is_clerk,
        "is_admin": is_admin,
        "is_super_admin": is_super_admin,
        "is_a_admin": is_a_admin,
        "status": status,
        "token": token,
      };
}
