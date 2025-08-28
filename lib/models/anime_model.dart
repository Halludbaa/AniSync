class AnimeModel {
  final int malId;
  final String title;
  final String titleEnglish;
  final String type;
  final String rating;
  final String synopsis;
  final double score;
  final int airedYear;
  final ImageModel images;
  final List<String> themes;
  final List<String> genres;
  final List<String> demographics;

  AnimeModel({
    required this.malId,
    required this.title,
    required this.titleEnglish,
    required this.type,
    required this.rating,
    required this.synopsis,
    required this.score,
    required this.airedYear,
    required this.images,
    required this.themes,
    required this.genres,
    required this.demographics,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'] as int,
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String,
      type: json['type'] as String,
      rating: json['rating'] as String,
      synopsis: json['synopsis'] as String,
      score: (json['score'] as num).toDouble(),
      airedYear: json['aired']['prop']['from']['year'] as int,
      images: ImageModel(
        normal: json['images']['jpg']['image_url'] as String,
        small: json['images']['jpg']['small_image_url'] as String,
        large: json['images']['jpg']['large_image_url'] as String,
      ),
      themes:
          (json['themes'] as List)
              .map((theme) => theme['name'] as String)
              .toList(),
      genres:
          (json['genres'] as List)
              .map((genre) => genre['name'] as String)
              .toList(),
      demographics:
          (json['demographics'] as List)
              .map((demographic) => demographic['name'] as String)
              .toList(),
    );
  }
}

class ImageModel {
  final String normal;
  final String small;
  final String large;

  ImageModel({required this.normal, required this.small, required this.large});
}
