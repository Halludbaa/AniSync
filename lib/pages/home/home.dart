import 'package:anisync_flutter/controllers/anime_controller.dart';
import 'package:anisync_flutter/models/anime_model.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/widgets/anisync_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AnimeController controller = Get.find<AnimeController>(tag: "main");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnisyncAppBar(),
      body: Obx(
        () =>
            controller.isLoading.value
                ? loading()
                : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _heading1(text: "Seasonal Anime"),
                        animeCardHorizontal(controller.seasonalList),
                        _heading1(text: "Top Airing Anime"),
                        animeCardHorizontal(controller.topAiringList),
                        _heading1(text: "Upcoming Anime"),
                        animeCardHorizontal(controller.upComingList),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }

  Padding _heading1({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Center loading() {
    return Center(child: CircularProgressIndicator());
  }
}

GestureDetector animeCard({required AnimeModel anime}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRouteNamed.animeDetail, arguments: anime);
    },
    child: Stack(
      children: [
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(anime.images.normal),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          width: 200,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              anime.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

SingleChildScrollView animeCardHorizontal(List<AnimeModel> animes) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      spacing: 10,
      children: [...animes.map((anime) => animeCard(anime: anime))],
    ),
  );
}
