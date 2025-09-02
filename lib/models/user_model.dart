import 'package:anisync_flutter/models/anime_model.dart';

class UserModel {
  final String id;
  final String email;
  final String fullname;
  final String bio;
  final List<AnimeModel> favorites;

  UserModel({
    required this.id,
    required this.email,
    required this.bio,
    required this.fullname,
    required this.favorites,
  });

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      id: id,
      email: data["email"],
      bio: data["bio"],
      fullname: data["fullname"],
      favorites:
          (data["favorites"])
              ?.map((favorite) => AnimeModel.fromJson(favorite))
              .toList()
              .cast<AnimeModel>(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'bio': bio,
      'favorites': favorites,
    };
  }

  UserModel copyWith({
    List<AnimeModel>? favorites,
    String? theme,
    String? fullname,
    String? bio,
  }) {
    return UserModel(
      id: id,
      email: email,
      bio: bio ?? this.bio,
      fullname: fullname ?? this.fullname,
      favorites: favorites ?? this.favorites,
    );
  }
}
