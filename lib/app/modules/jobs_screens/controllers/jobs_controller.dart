import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobsController extends GetxController {
  //TODO: Implement JobsController
  final joblist = [
    {"name": "All Jobs", "value": "22"},
    {"name": "Active", "value": "22"},
    {"name": "Inactive", "value": "22"},
    {"name": "In Review", "value": "22"},
  ].obs;
  final jobselectname = 'All Jobs'.obs;
  final filterlist = [
    "Select Organization",
    "Select Job Type",
    "Skills",
    "Department",
    "CTC",
    "Experience"
  ].obs;

  final sortlist = [
    "Job",
    "Created Date",
    "Location",
    "Company",
  ].obs;
  final editlist = [
    {"icon": Icons.remove_red_eye_outlined, "name": "View job"},
    {"icon": Icons.person_outline, "name": "Invite Candidates"},
    {"icon": Icons.share, "name": "Share externally"},
    {"icon": Icons.edit, "name": "Edit"},
    {"icon": Icons.add_box_outlined, "name": "Duplicate"},
    {"icon": Icons.delete, "name": "Delete"},
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
