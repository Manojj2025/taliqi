import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserruleController extends GetxController {
  //TODO: Implement InterController

  final count = 0.obs;
  final editlist = [
    {"icon": Icons.person_add_alt, "name": "Create User"},
    {"icon": Icons.person_add_alt, "name": "Create Guest User"},
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
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
