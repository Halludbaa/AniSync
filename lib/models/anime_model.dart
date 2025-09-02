class AnimeModel {
  final String malId;
  final String title;
  final String titleEnglish;
  final String type;
  final String episode;
  final String rating;
  final String synopsis;
  final String score;
  final String airedYear;
  final String status;
  final ImageModel images;
  final String trailerEmbed;
  final String trailerUrl;
  final List<String> studios;
  final List<String> themes;
  final List<String> genres;
  final List<String> demographics;

  AnimeModel({
    required this.malId,
    required this.studios,
    required this.title,
    required this.titleEnglish,
    required this.episode,
    required this.type,
    required this.rating,
    required this.synopsis,
    required this.status,
    required this.score,
    required this.airedYear,
    required this.images,
    required this.themes,
    required this.genres,
    required this.trailerEmbed,
    required this.trailerUrl,
    required this.demographics,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      malId: json['mal_id'].toString(),
      title: json['title'] ?? "unknown",
      titleEnglish: json['title_english'] ?? "unknown",
      trailerEmbed: json['trailer']["embed_url"] ?? "unknown",
      trailerUrl: json['trailer']["url"] ?? "unknown",
      type: json['type'] ?? "unknown",
      status: json['status'] ?? "unknown",
      episode: json['episodes']?.toString() ?? "unknown",
      rating: json['rating'] ?? "unknown",
      synopsis: json['synopsis'] ?? "unknown",
      score: json['score']?.toString() ?? "unknown",
      airedYear: json['year']?.toString() ?? "unknown",
      images: ImageModel(
        normal: json['images']['jpg']['image_url'],
        small: json['images']['jpg']['small_image_url'],
        large: json['images']['jpg']['large_image_url'],
      ),
      themes:
          (json['themes'])
              .map((theme) => theme['name'])
              .toList()
              .cast<String>(),
      studios:
          (json['studios'])
              .map((studio) => studio['name'])
              .toList()
              .cast<String>(),
      genres:
          (json['genres'])
              .map((genre) => genre['name'])
              .toList()
              .cast<String>(),
      demographics:
          (json['demographics'])
              .map((demographic) => demographic['name'])
              .toList()
              .cast<String>(),
    );
  }
  @override
  bool operator ==(Object other) {
    // if (identical(this, other)) return true;
    return other is AnimeModel && other.malId == malId;
  }

  @override
  int get hashCode => malId.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'title': title,
      'title_english': titleEnglish,
      'trailer': {'embed_url': trailerEmbed, 'url': trailerUrl},
      'type': type,
      'status': status,
      'episodes': episode,
      'rating': rating,
      'synopsis': synopsis,
      'score': score,
      'year': airedYear,
      'images': {
        'jpg': {
          'image_url': images.normal,
          'small_image_url': images.small,
          'large_image_url': images.large,
        },
      },
      'themes': themes.map((theme) => {'name': theme}).toList(),
      'studios': studios.map((studio) => {'name': studio}).toList(),
      'genres': genres.map((genre) => {'name': genre}).toList(),
      'demographics':
          demographics.map((demographic) => {'name': demographic}).toList(),
    };
  }
}

class ImageModel {
  final String normal;
  final String small;
  final String large;

  ImageModel({required this.normal, required this.small, required this.large});
}
