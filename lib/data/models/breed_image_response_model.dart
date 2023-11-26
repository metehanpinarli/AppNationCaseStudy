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
