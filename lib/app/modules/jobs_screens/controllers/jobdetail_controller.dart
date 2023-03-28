import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../views/jobdetail_view.dart';
import '../views/totalapplication.dart';

class JobdetailController extends GetxController {
  //TODO: Implement JobdetailController
  final showseach = false.obs;
  final filterlist = [
    "Select Organization",
    "Select Job Type",
    "Skills",
    "Department",
    "CTC",
    "Experience"
  ].obs;
  final joblist = [
    {"name": "Description", "value": ""},
    {"name": "Applications", "value": "1"},
    {"name": "Job Boards", "value": ""},
    {"name": "Recommended Candidates", "value": "2"},
    {"name": "Job Analytics", "value": ""},
  ].obs;

  final invitelist = [
    {"name": "Recommended Candidates", "value": ""},
    {"name": "All Candidates", "value": "1"},
    {"name": "Search for Candidate", "value": ""},
  ].obs;
  final selectinvitelist = 'Recommended Candidates'.obs;
  final joblist2 = ["Photoshop", "Ptototype", "Figma", "UX/UI", "Adobe"].obs;
  final jobselectname = 'Description'.obs;
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
  final List<ChartData> chartData = [
    ChartData('1 - 2 year', 10, '70%', Color(0xff3269E5)),
    ChartData('2 - 3 year', 11, '60%', Color(0xff34C7C7)),
    ChartData('3 - 4 year', 9, '52%', Color(0xffE7B22B)),
    ChartData('4 - 5 year', 10, '40%', Color(0xff824DCB)),
    ChartData('5 - 7 year', 9, '52%', Color(0xffDB3A57)),
    ChartData('7 + year', 10, '40%', Color(0xffA1CE40))
  ];
  final List<ChartData> chartData2 = [
    ChartData('Below budget', 10, '70%', Color(0xffE7B22B)),
    ChartData('As per budget', 11, '60%', Color(0xffDB4846)),
    ChartData('Above budget', 9, '52%', Color(0xffA1CE40)),
  ];
  late TooltipBehavior tooltip;
  final touchedIndex = 0.obs;
  final changegraph = 0.obs;
  final List<BarData> barData = [
    BarData(1, 40),
    BarData(2, 20),
    BarData(3, 30),
    BarData(4, 40),
    BarData(5, 30),
    BarData(6, 20),
  ];
  final editlist = [
    {"icon": Icons.edit, "name": "Edit"},
    {"icon": Icons.person_outline, "name": "Invite Candidates"},
    {"icon": Icons.share, "name": "Share externally"},
    {"icon": Icons.add_box_outlined, "name": "Duplicate"},
    {"icon": Icons.delete, "name": "Delete"},
  ].obs;
  final agree = false.obs;
  final experienceyear = 0.0.obs;
  final selectfilter = ''.obs;
  final subfilterlist = [
    'Maybank',
    'CIMB Bank',
    'HCL Tech',
    'Islamic Bank of Ihsan',
    'Bank Ihsan'
  ].obs;
  @override
  void onInit() {
    super.onInit();
    tooltip = TooltipBehavior(enable: true);
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
