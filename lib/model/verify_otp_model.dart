// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  bool? status;
  bool? profileExists;
  String? jwt;
  String? response;

  VerifyOtpModel({
    this.status,
    this.profileExists,
    this.jwt,
    this.response,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        status: json["status"],
        profileExists: json["profile_exists"],
        jwt: json["jwt"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "profile_exists": profileExists,
        "jwt": jwt,
        "response": response,
      };
}
