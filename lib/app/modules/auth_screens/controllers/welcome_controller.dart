import 'package:get/get.dart';
import 'package:taliqi/app/constants/strings.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController
  final imageList = [
    MyImages.intro,
    MyImages.intro,
    MyImages.intro,
  ];

  final data = [].obs;
  var load = false;

  final imageurl = MyImages.intro.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  image(index) {
    imageurl.value = imageList[index];
  }
}
