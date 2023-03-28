// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import '../../../../constants/values.dart';

// class VideoCallController extends GetxController {
//   //TODO: Implement JobdetailController
//   final micmute = true.obs;
//   final join = false.obs;
//   late Timer timer;
//   final start = 5.obs;
//   final nextscreen = false.obs;
//   final showdialog = false.obs;
//   final videopause = false.obs;

//   final accept = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     // startTimer();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {}

//   startTimer() {
//     const oneSec = Duration(seconds: 1);
//     timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (start.value == 0) {
//           timer.cancel();
//           join.value = false;
//           nextscreen.value = true;
//         } else {
//           start.value--;
//         }
//       },
//     );
//   }
// }
