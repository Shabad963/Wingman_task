

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
    bool? status;
    String? response;

    DetailsModel({
        this.status,
        this.response,
    });

    factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        status: json["status"],
        response: json["response"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
    };
}
