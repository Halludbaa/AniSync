class UserModel {
  final String email;
  final String fullname;
  final String bio;
  final List<String> favorites;

  UserModel({
    required this.email,
    required this.bio,
    required this.fullname,
    required this.favorites,
  });
}
