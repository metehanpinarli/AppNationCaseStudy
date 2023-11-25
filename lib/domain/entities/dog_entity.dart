class DogEntity {
  final String breed;
  final String imageUrl;
  final List<String> subBreeds;

  const DogEntity({
    required this.breed,
    required this.imageUrl,
    required this.subBreeds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DogEntity &&
          runtimeType == other.runtimeType &&
          breed == other.breed &&
          imageUrl == other.imageUrl &&
          subBreeds == other.subBreeds);

  @override
  int get hashCode => breed.hashCode ^ imageUrl.hashCode ^ subBreeds.hashCode;

  DogEntity copyWith({String? breed, String? imageUrl, List<String>? subBreeds}) {
    return DogEntity(
        breed: breed ?? this.breed, imageUrl: imageUrl ?? this.imageUrl, subBreeds: subBreeds ?? this.subBreeds);
  }

  Map<String, dynamic> toMap() {
    return {
      'breed': breed,
      'imageUrl': imageUrl,
      'subBreeds': subBreeds,
    };
  }

  factory DogEntity.fromMap(Map<String, dynamic> map) {
    return DogEntity(
      breed: map['breed'] as String,
      imageUrl: map['imageUrl'] as String,
      subBreeds: map['subBreeds'] as List<String>,
    );
  }
}
