import 'package:anisync_flutter/controllers/auth_controller.dart';
import 'package:anisync_flutter/models/anime_model.dart';
import 'package:anisync_flutter/services/anime_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  var upComingList = <AnimeModel>[].obs;
  var topAiringList = <AnimeModel>[].obs;
  var seasonalList = <AnimeModel>[].obs;

  var animeDetail = Rxn<AnimeModel>();
  var favoriteAnimes = <AnimeModel>[].obs;

  var isDetailLoading = false.obs;
  var isLoading = true.obs;

  final authController = Get.find<AuthController>(tag: 'auth');
  AnimeServices service = AnimeServices();

  @override
  void onInit() {
    super.onInit();
    fetchAnime();
  }

  Future<void> loadFavorites(List<String> favorites) async {
    try {
      final List<Future<AnimeModel>> futures =
          favorites.map((id) {
            return service.getDetail(id: id);
          }).toList();

      final List<AnimeModel> animes = await Future.wait(futures);
      favoriteAnimes.value = animes;
    } catch (e) {
      print("Error loading favorite anime details: $e");
      Get.snackbar("Error", "Could not load favorite anime");
      favoriteAnimes.value = [];
    }
  }

  bool isFavorite(AnimeModel anime) {
    return authController.currentUser.value?.favorites.contains(anime) ?? false;
  }

  Future<void> favoriteToggle(AnimeModel anime) async {
    if (!authController.isSignedIn.value) {
      Get.snackbar("Login Required", "Please log in to save favorites");
      return;
    }

    final user = authController.currentUser.value!;
    final List<AnimeModel> newFavorites = List<AnimeModel>.from(user.favorites);

    if (newFavorites.contains(anime)) {
      newFavorites.remove(anime);
    } else {
      newFavorites.add(anime);
    }

    final List<Map<String, dynamic>> newFavoritesMap =
        List<Map<String, dynamic>>.from(
          newFavorites.map((favorite) => favorite.toJson()).toList(),
        );
    // Update Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.firebaseUser.value!.uid)
        .update({'favorites': newFavoritesMap});

    // Update local state
    authController.currentUser.value = user.copyWith(favorites: newFavorites);
  }

  Future<void> fetchAnime() async {
    try {
      isLoading(true);
      final upcoming = await service.getUpcoming();
      final topAiring = await service.getTopAiring();
      final seasonal = await service.getSeasonal();

      upComingList.value = upcoming;
      topAiringList.value = topAiring;
      seasonalList.value = seasonal;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchAnimeById(String id) async {
    try {
      isDetailLoading(true);
      animeDetail(null);
      final anime = await service.getDetail(id: id);
      animeDetail(anime);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isDetailLoading(false);
    }
  }
}
