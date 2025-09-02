import 'package:anisync_flutter/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeServices {
  Dio dio = Dio();
  static const baseUrl = "https://api.jikan.moe/v4";

  Future<List<AnimeModel>> getSeasonal() async {
    try {
      final response = await dio.get("$baseUrl/seasons/now");

      if (response.statusCode != 200) throw Exception();

      final data = response.data["data"];

      List<AnimeModel> animes = List.from(
        data.map((anime) => AnimeModel.fromJson(anime)),
      );

      return animes;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeModel>> getTopAiring() async {
    try {
      final response = await dio.get("$baseUrl/top/anime");

      if (response.statusCode != 200) throw Exception();

      final data = response.data["data"];

      List<AnimeModel> animes = List.from(
        data.map((anime) => AnimeModel.fromJson(anime)),
      );

      return animes;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeModel>> getUpcoming() async {
    try {
      final response = await dio.get("$baseUrl/seasons/upcoming");

      if (response.statusCode != 200) throw Exception();

      final data = response.data["data"];

      List<AnimeModel> animes = List.from(
        data.map((anime) => AnimeModel.fromJson(anime)),
      );

      return animes;
    } catch (e) {
      rethrow;
    }
  }

  Future<AnimeModel> getDetail({required String id}) async {
    try {
      final response = await dio.get("$baseUrl/anime/$id");

      if (response.statusCode != 200) throw Exception();

      final data = response.data["data"];

      AnimeModel anime = AnimeModel.fromJson(data);

      return anime;
    } catch (e) {
      rethrow;
    }
  }
}
