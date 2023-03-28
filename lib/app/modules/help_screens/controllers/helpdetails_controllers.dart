import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpdetailsController extends GetxController {
  //TODO: Implement JobsController
  final list2 = [
    {
      "text": 'Mariah',
      "t2": '07/02/2023',
      "t3":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae semper quis lectus nulla. Diam quis enim lobortis scelerisque fermentum dui faucibus. Molestie at elementum eu facilisis sed odio morbi.",
      'first': true,
      'last': false,
      'icon': Icons.handshake
    },
    {
      "text": 'Ranjeet Kumar',
      "t2": '07/02/2023',
      "t3":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae semper quis lectus nulla. Diam quis enim lobortis scelerisque fermentum dui faucibus. Molestie at elementum eu facilisis sed odio morbi.",
      'first': false,
      'last': false,
      'icon': Icons.close,
    },
  ];
  final makesoled = false.obs;
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
