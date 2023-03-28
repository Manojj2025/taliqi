import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  //TODO: Implement JobsController
  final list = [
    {"name": "All Tickets", "value": "(42)"},
    {"name": "Open", "value": "(22)"},
    {"name": "Closed", "value": "(22)"},
  ].obs;

  final selectname = 'Email'.obs;
  final jobselectname = 'All Tickets'.obs;
  final list2 = [
    {"icon": Icons.add, "name": "New Meeting"},
    {"icon": Icons.calendar_today_outlined, "name": "Schedule"},
  ].obs;
  final addattachment = false.obs;
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
