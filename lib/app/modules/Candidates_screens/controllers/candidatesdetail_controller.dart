import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CandidatesdetailController extends GetxController {
  //TODO: Implement JobdetailController

  TextEditingController searchtxt = TextEditingController();
  final showseach = false.obs;
  final editlist = [
    {"icon": Icons.remove_red_eye_outlined, "name": "View job"},
    {"icon": Icons.person_outline, "name": "Assign Job"},
    {"icon": Icons.share, "name": "Share externally"},
    {"icon": Icons.edit, "name": "Edit"},
    // {"icon": Icons.add_box_outlined, "name": "Duplicate"},
    {"icon": Icons.delete, "name": "Delete"},
    {"icon": Icons.power_settings_new_outlined, "name": "Deactivate"},
  ].obs;
  TextEditingController psearchtxt = TextEditingController();
  final clientslist = [
    {"name": "Overview", "value": ""},
    {"name": "Candidate Details", "value": "1"},
    {"name": "Feedback", "value": ""},
    {"name": "Jobs", "value": "2"},
    {"name": "Notes", "value": ""},
    {"name": "Activities", "value": "2"},
  ].obs;
  final activity = ['Open', 'closed'];
  final joblist2 = ["Photoshop", "Ptototype", "Figma", "UX/UI", "Adobe"].obs;
  final selectname = 'Overview'.obs;
  final jobselectname2 = 'Photoshop'.obs;
  final jobselectname3 = 'Photoshop'.obs;
  final selected = 0.obs;
  final joboardlist = [
    {"img": "assets/image/note.png", "title": "Job Applied (2)"},
    {"img": "assets/image/phone.png", "title": "Interview (2)"},
    {"img": "assets/image/hold.png", "title": "On Hold (2)"},
    {"img": "assets/image/call.png", "title": "Contacted (2)"},
    {"img": "assets/image/rej.png", "title": "Rejected (2)"},
  ].obs;
  final agree = false.obs;
  final list2icon = [
    Icons.handshake,
    Icons.close,
    Icons.email,
    Icons.message,
  ];
  final list2color = [
    Colors.blue,
    Colors.red,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];
  final list2 = [
    {
      "text": 'Changed state to Hired',
      "t2": 'Oodles Technologies',
      'first': true,
      'last': false,
      'color': Colors.blue,
      'icon': Icons.handshake
    },
    {
      "text": 'Changed state to Rejected',
      "t2": 'Oodles Technologies',
      'first': false,
      'last': false,
      'color': Colors.red,
      'icon': Icons.close,
    },
    {
      "text": 'Sent an email',
      "t2": 'Oodles Technologies',
      'first': false,
      'last': false,
      'color': Colors.grey.shade400,
      'icon': Icons.email,
    },
    {
      "text": 'You : Are you joining for th...',
      "t2": 'Oodles Technologies',
      'first': false,
      'last': false,
      'color': Colors.grey.shade400,
      'icon': Icons.message
    },
  ];
  final PageController pageController = PageController(
    initialPage: 0,
  );
  final show2 = false.obs;
  final index = 0.obs;
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
