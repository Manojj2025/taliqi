import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CandidatesController extends GetxController {
  //TODO: Implement JobsController
  final joblist = [
    {"name": "All Candidates", "value": "22"},
    {"name": "Marked", "value": "22"},
    {"name": "Drafts", "value": "22"},
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
  final jobselectname = 'All Candidates'.obs;
  final filterlist = [
    "Select Organization",
    "Select Job Type",
    "Skills",
    "Department",
    "CTC",
    "Experience"
  ].obs;
  final sortlist = ["Name", "Created Date", "Location", "Experince", "CTC"].obs;
  final save = [].obs;

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
