import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatenewjobController extends GetxController {
  //TODO: Implement CreatenewjobController

  final joblist = [
    {"name": "Description", "value": ""},
    {"name": "Applications", "value": "1"},
    {"name": "Job Boards", "value": ""},
    {"name": "Recommended Candidates", "value": "2"},
    {"name": "Job Analytics", "value": ""},
  ].obs;
  final joblist2 = ["Photoshop", "Ptototype", "Figma", "UX/UI", "Adobe"].obs;
  final jobselectname = 'Description'.obs;
  final jobselectname2 = 'Photoshop'.obs;
  final jobselectname3 = 'Photoshop'.obs;
  // final selected = 0.obs;
  final joboardlist = [
    {"img": "assets/image/note.png", "title": "Job Applied (2)"},
    {"img": "assets/image/phone.png", "title": "Interview (2)"},
    {"img": "assets/image/hold.png", "title": "On Hold (2)"},
    {"img": "assets/image/call.png", "title": "Contacted (2)"},
    {"img": "assets/image/rej.png", "title": "Rejected (2)"},
  ].obs;
  final index = 0.obs;
  final selected = 0.obs;
  final list = ["Private", "Corporation", "Retail", "Goverments", "Lomep"];
  final PageController pageController = PageController(
    initialPage: 0,
  );
  final show = false.obs;
  final show2 = false.obs;

  TextEditingController descriptionstext = TextEditingController();
  TextEditingController searchtxt = TextEditingController();

  TextEditingController psearchtxt = TextEditingController();
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
