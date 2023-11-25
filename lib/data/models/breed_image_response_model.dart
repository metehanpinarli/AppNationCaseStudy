// To parse this JSON data, do
//
//     final breendImageResponseModel = breendImageResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BreedImageResponseModel breedImageResponseModelFromJson(String str) => BreedImageResponseModel.fromJson(json.decode(str));

String breedImageResponseModelToJson(BreedImageResponseModel data) => json.encode(data.toJson());

class BreedImageResponseModel {
  final String message;
  final String status;

  BreedImageResponseModel({
    required this.message,
    required this.status,
  });

  factory BreedImageResponseModel.fromJson(Map<String, dynamic> json) => BreedImageResponseModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
