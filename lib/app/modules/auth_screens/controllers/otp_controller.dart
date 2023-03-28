import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  TextEditingController otptxt = TextEditingController();
  TextEditingController emailtxt = TextEditingController();
  late Timer timer;
  final start = 30.obs;
  final isLoading = false.obs;
  StreamController<ErrorAnimationType>? errorController;
  @override
  void onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();

    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          isLoading.value = false;
        } else {
          start.value--;
        }
      },
    );
  }
  // void increment() => count.value++;
}
