class ApiConstants {
  static const String baseUrl = 'https://dog.ceo/api/';
  static const String breeds = 'breeds/list/all';

  static String breedImages(String breed) => 'breed/$breed/images/random';
}
