// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
    String? message;
    String? status;

    ApiModel({
        this.message,
        this.status,
    });

    factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
