// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:langus/app/data/home/providers/movie_provider.dart';
// import '../../../data/home/movie_model.dart';
// import '../../../data/home/providers/saved_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../../widgets/full_screen.dart';
import '../../../widgets/rotate.dart';

class SinglePlayController extends GetxController
    with GetTickerProviderStateMixin {
  // final box = GetStorage();
  // late Movie item;
  final showMore = false.obs;
  final ratesubmit = false.obs;
  final hide = ''.obs;
  final trendings = [].obs;
  final items = [];
  final scrollController = ScrollController();
  final recommandedScrollController = ScrollController();
  final aboutScrollController = ScrollController();
  final loading = true.obs;
  final timearray = ''.obs;
  var hours = ''.obs;
  var minutes = ''.obs;
  var seconds = ''.obs;
  var languages = ''.obs;
  var genres = ''.obs;
  var saved = false.obs;
  late VideoPlayerController videoPlayerController;
  late Map movie_durations;
  final selectedFitBox = 1.obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4')
      ..initialize().then((_) {
        videoPlayerController.addListener(() {
          for (var i = 0; i < 2; i++) {
            loading.value = !loading.value;
          }
          // saveDuration(item.sId, videoPlayerController.value.position);
        });
        loading.value = false;
      });

    // checkSaved();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Wakelock.disable();
    rotate(false);
    fullScreenToggle(false);
    // videoPlayerController.initialize();
    // videoPlayerController.dispose();
    scrollController.dispose();
    recommandedScrollController.dispose();
    aboutScrollController.dispose();
  }
}
