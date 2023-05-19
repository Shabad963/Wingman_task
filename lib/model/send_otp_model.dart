import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) =>
    SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  bool status;
  String response;
  String requestId;

  SendOtpModel({
    required this.status,
    required this.response,
    required this.requestId,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
        status: json["status"],
        response: json["response"],
        requestId: json["request_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "request_id": requestId,
      };
}
