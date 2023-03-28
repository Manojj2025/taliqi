import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewInterviewController extends GetxController {
  //TODO: Implement JobdetailController

  final PageController pageController = PageController(
    initialPage: 0,
  );
  final interview = 'self'.obs;
  final showseach = false.obs;
  final show2 = false.obs;
  final index = 0.obs;

  final videoShow = false.obs;
  final qusShow = false.obs;
  TextEditingController descriptionstext = TextEditingController();
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
}
