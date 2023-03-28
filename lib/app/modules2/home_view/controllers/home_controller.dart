import 'package:get/get.dart';

import '../../../constants/values.dart';

class Home2Controller extends GetxController {
  //TODO: Implement BottomBarController

  // var item2 = Get.arguments;
  // final currentIndex = 0.obs;
  final list = [
    {"img": MyImages.interview, "value": "2", "title": "Interviews"},
    {"img": MyImages.job, "value": "2", "title": "Jobs Applied"},
    {"img": MyImages.candidate, "value": "2", "title": "Feedback Received"},
    {"img": MyImages.v, "value": "2", "title": "Job Offer"},
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
