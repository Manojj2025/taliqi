import 'package:taliqi/app/modules/interview_screens/views/interviewdetail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../jobs_screens/views/totalapplication.dart';

class InterviewsController extends GetxController {
  //TODO: Implement InterviewsController

  final agree = false.obs;
  final hair = false.obs;
  final list = [
    {"name": "All Interviews", "value": "22"},
    {"name": "Self Interview", "value": "22"},
    {"name": "Live Interview", "value": "2"},
    {"name": "Open Links", "value": "3"},
  ].obs;
  final list2 = [
    {"name": "Watch Interview", "value": "22"},
    {"name": "Feedback", "value": "22"},
    {"name": "Behavioural Assesment", "value": "2"},
    {"name": "Manage Interviewers", "value": "3"},
    {"name": "Details", "value": "3"},
  ].obs;
  final selectname2 = 'Watch Interview'.obs;
  final selectname = 'All Interviews'.obs;
  final filterlist = [
    "Select Organization",
    "Select Job Type",
    "Skills",
    "Department",
    "CTC",
    "Experience"
  ].obs;
  final experienceyear = 0.0.obs;
  final selectfilter = ''.obs;
  final subfilterlist = [
    'Maybank',
    'CIMB Bank',
    'HCL Tech',
    'Islamic Bank of Ihsan',
    'Bank Ihsan'
  ].obs;
  final editlist = [
    {"icon": Icons.remove_red_eye_outlined, "name": "View Interview"},
    {"icon": Icons.personal_injury_outlined, "name": "Evaluate"},
    {"icon": Icons.group_add_outlined, "name": "Invite Interviewers"},
    {"icon": Icons.calendar_today_outlined, "name": "Extend Interview"},
    {"icon": Icons.mode_edit_outlined, "name": "Modify"},
    {"icon": Icons.pause_sharp, "name": "On Hold"},
    {"icon": Icons.cancel_outlined, "name": "Cancel"},
  ].obs;
  final sortlist =
      ["Name", "Created Date", "Location", "Experience", "CTC"].obs;
  final List<BarData2> barData = [
    BarData2('Communication', 40),
    BarData2('Leadership', 20),
    BarData2('Teamwork', 20),
  ];
  final List<ChartData> chartData = <ChartData>[
    ChartData('Fair Treatment', 8, 1, 101),
    ChartData('Information Sharing', 2, 92, 93),
    ChartData('Approachability', 6, 3, 90),
    ChartData('Candid Communication', 4, 95, 71),
    ChartData('Feedback Seeking', 2, 5, 101),
    ChartData('Reliability', 8, 6, 93),
    ChartData('Care of Individual', 6, 7, 90),
    ChartData('Work-Life Balance', 2, 8, 71),
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
  void onClose() {
    super.onClose();
  }
}
