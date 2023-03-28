import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerCustomController extends GetxController
    with GetTickerProviderStateMixin {
  // var videoURL = '';

  // video player variables
  late AnimationController controller1;
  late AnimationController controllerl;
  late AnimationController controllerad;
  late AnimationController controllerR;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animationad;
  late Animation<double> animationl;
  late Animation<double> animationR;
  final show = false.obs;
  final ishow = false.obs;
  double videoContainerRatio = 1;
  late Orientation target;
  Timer? t;
  Timer? tl;
  Timer? tr;
  Timer? tad;

  final b = Icons.fast_forward_rounded;
  final a = Icons.fast_rewind_rounded;

  // final subtitle = 'off'.obs;
  // final isBuffering = true.obs;

  @override
  void onInit() {
    controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controllerl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controllerR =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller1);

    animationl = Tween(begin: 0.0, end: 1.0).animate(controllerl);
    animationR = Tween(begin: 0.0, end: 1.0).animate(controllerR);
    controllerad =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animationad = Tween(begin: 0.0, end: 1.0).animate(controllerad);
    // Screen.keepOn(true);
    // Wakelock.enable();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    visibilityControl();
  }

  @override
  void onClose() {
    controller1.dispose();
    controller2.dispose();
    controllerl.dispose();
    controllerR.dispose();
    t?.cancel();
    tl?.cancel();
    tr?.cancel();
  }

  // scrollOff() {
  //   recommandedScroll.value = false;
  //   print('scroll offed');
  // }

  // double getScale(videoPlayerController) {
  //   double videoRatio = videoPlayerController.value.aspectRatio;

  //   if (videoRatio < 1) {
  //     ///for tall videos, we just return the inverse of the controller aspect ratio
  //     return videoContainerRatio / videoRatio;
  //   } else {
  //     ///for wide videos, divide the video AR by the fixed container AR
  //     ///so that the video does not over scale
  //     return videoRatio / videoContainerRatio;
  //   }
  // }

  visibilityControl({toggle: false}) {
    if (t != null) {
      t?.cancel();
    }
    controller1.duration = Duration(microseconds: 100);
    if (show.value) {
      print('m');
      if (toggle) {
        t = Timer.periodic(const Duration(seconds: 5), (timer) {
          controller1.reverse();
          t?.cancel();
        });
        print('mm');
      } else {
        print('mmm');
        controller1.reverse();
      }
      show.value = false;
    } else {
      print('vv');
      controller1.forward();
      show.value = true;
      t = Timer.periodic(const Duration(seconds: 5), (timer) {
        controller1.reverse();
        // print('vvv');
        t?.cancel();
        show.value = false;
      });

      // Future.delayed(Duration(seconds: 5), () {
      //   print(5);
      //   _controller1.reverse();
      //   show = false;
      // });
    }
  }

  visiicon() {
    tl?.cancel();
    controllerl.duration = Duration(milliseconds: 80);
    controllerl.forward();
    tl = Timer.periodic(const Duration(seconds: 1), (timer) {
      controllerl.reverse();
      tl?.cancel();
    });
  }

  visiicon2() {
    tr?.cancel();
    controllerR.duration = Duration(milliseconds: 80);
    controllerR.forward();
    tr = Timer.periodic(const Duration(seconds: 1), (timer) {
      controllerR.reverse();
      tr?.cancel();
    });
  }

  checkBuffering(videoPlayerController) {
    if (videoPlayerController.value.isBuffering) {
      visibilityControl(toggle: true);
    }
  }

  // adshow({toggle: false}) {
  //   if (tad != null) {
  //     tad?.cancel();
  //   }
  //   controllerad.duration = Duration(milliseconds: 100);
  //   if (show) {
  //     if (toggle) {
  //       tad = Timer.periodic(const Duration(seconds: 5), (timer) {
  //         controllerad.reverse();
  //         tad?.cancel();
  //       });
  //     } else {
  //       controllerad.reverse();
  //     }
  //     show = false;
  //   } else {
  //     controllerad.forward();
  //     show = true;
  //     tad = Timer.periodic(const Duration(seconds: 5), (timer) {
  //       controllerad.reverse();
  //       tad?.cancel();
  //       show = false;
  //     });

  //     // Future.delayed(Duration(seconds: 5), () {
  //     //   print(5);
  //     //   _controller1.reverse();
  //     //   show = false;
  //     // });
  //   }
  // }
}
