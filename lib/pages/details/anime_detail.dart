import 'package:anisync_flutter/controllers/anime_controller.dart';
import 'package:anisync_flutter/models/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class AnimeDetail extends StatelessWidget {
  AnimeDetail({super.key});
  final controller = Get.find<AnimeController>(tag: 'main');

  @override
  Widget build(BuildContext context) {
    final AnimeModel anime = Get.arguments;

    // if (controller.animeDetail.value?.malId != animeId) {
    //   controller.fetchAnimeById(animeId);
    // }

    // final anime = controller.animeDetail.value;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _detailAnimeAppBar(anime: anime),
      body: Obx(() {
        // final anime = controller.animeDetail.value;

        return controller.isDetailLoading.value
            ? loading()
            : main(context, anime);
      }),
    );
  }

  SingleChildScrollView main(BuildContext context, AnimeModel? anime) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _animePoster(context, image: anime?.images.normal ?? ""),
          SizedBox(height: 280),
          _heading1("${anime?.title}"),
          _heading1("${anime?.titleEnglish}", isSubtitle: true),
          _animeShortDetail(anime),
          _synopsis(anime?.synopsis),
          _informations(anime),
        ],
      ),
    );
  }

  Container _informations(AnimeModel? anime) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),

      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading2("Information"),
          _heading6("Studios: ${anime?.studios} "),
          _heading6("Genres: ${anime?.genres} "),
          _heading6("Themes: ${anime?.themes}"),
          _heading6("Demographics: ${anime?.demographics} "),
          _heading6("Status: ${anime?.status}"),
          _heading6("Rating: ${anime?.rating}"),
        ],
      ),
    );
  }

  Text _heading6(String text) => Text(text, style: TextStyle(fontSize: 18));

  Center loading() {
    return Center(child: CircularProgressIndicator());
  }

  Container _synopsis(String? synopsis) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_heading2("Synopsis"), _paragraph(synopsis ?? "")],
      ),
    );
  }

  ReadMoreText _paragraph(String text) {
    return ReadMoreText(
      text,
      trimLines: 5,
      style: TextStyle(fontSize: 16),
      colorClickableText: Colors.blue,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      lessStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Container _animeShortDetail(AnimeModel? anime) {
    return Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _animeScore("${anime?.score}"),
          _heading5("${anime?.status}, ${anime?.type} ${anime?.airedYear}"),
          _heading5(
            anime?.episode != "unknown"
                ? "${anime?.episode} eps"
                : "eps: ${anime?.episode}",
          ),
        ],
      ),
    );
  }

  Row _animeScore(String? score) {
    return Row(
      spacing: 5,
      children: [
        Icon(Icons.star_border, size: 30),
        _heading5(score ?? "unknown"),
      ],
    );
  }

  Text _heading5(String text) => Text(text, style: TextStyle(fontSize: 18));

  Text _heading1(String text, {bool isSubtitle = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontWeight: !isSubtitle ? FontWeight.w900 : FontWeight.w300,
        fontSize: 28,
      ),
    );
  }

  Text _heading2(String text, {bool isSubtitle = false}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: !isSubtitle ? FontWeight.w900 : FontWeight.w300,
        fontSize: 24,
      ),
    );
  }

  Stack _animePoster(BuildContext context, {required String image}) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
        ),
        Positioned(
          bottom: -270,
          child: Container(
            width: 250,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar _detailAnimeAppBar({required AnimeModel anime}) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 25,
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        Obx(() {
          final bool isFav = controller.isFavorite(anime);

          return IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 25,
            ),
            tooltip: isFav ? "Remove from Favorites" : "Add to Favorites",
            onPressed: () {
              controller.favoriteToggle(anime);
            },
          );
        }),
        SizedBox(width: 10),
        Icon(Icons.share_outlined, color: Colors.white, size: 25),
      ],
      title: Image.asset("assets/images/app_logo_white.png", width: 70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
