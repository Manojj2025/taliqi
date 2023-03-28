import 'package:taliqi/app/modules2/home_view/views/home_view.dart';
import 'package:get/get.dart';

class BottomBar2Controller extends GetxController {
  //TODO: Implement BottomBarController

  // var item2 = Get.arguments;
  final currentIndex = 0.obs;
  List children = [
    Home2View(),
    Home2View(),
    Home2View(),
    Home2View(),
  ];

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
  onTabTapped(int index) {
    currentIndex.value = index;
  }
}
