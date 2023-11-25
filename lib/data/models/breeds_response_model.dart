// To parse this JSON data, do
//
//     final breedsResponseModel = breedsResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BreedsResponseModel breedsResponseModelFromJson(String str) => BreedsResponseModel.fromJson(json.decode(str));

String breedsResponseModelToJson(BreedsResponseModel data) => json.encode(data.toJson());

class BreedsResponseModel {
  final Map<String, List<String>> message;
  final String status;

  BreedsResponseModel({
    required this.message,
    required this.status,
  });

  factory BreedsResponseModel.fromJson(Map<String, dynamic> json) => BreedsResponseModel(
    message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": Map.from(message).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
    "status": status,
  };
}
