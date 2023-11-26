import 'dart:convert';

FailureModel failureModelFromJson(String str) => FailureModel.fromJson(json.decode(str));

String failureModelToJson(FailureModel data) => json.encode(data.toJson());

class FailureModel {
  FailureModel({
    required this.code,
    required this.description,
    required this.message,
  });
  factory FailureModel.fromJson(Map<String, dynamic> json) => FailureModel(
    code: json['code'],
    description: json['description'],
    message: json['message'],
  );

  Object? code;
  String? description;
  String? message;

  Map<String, dynamic> toJson() => {
    'code': code,
    'description': description,
    'message': message,
  };
}
