import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taliqi/app/constants/values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../views/home_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late List<ChartData> data;
  late TooltipBehavior tooltip;
  final list = [
    {"img": MyImages.candidate, "value": "2", "title": "Candidates"},
    {"img": MyImages.job, "value": "2", "title": "Total Jobs"},
    {"img": MyImages.interview, "value": "2", "title": "Interviews"},
    {"img": MyImages.client, "value": "2", "title": "Clients"},
  ].obs;
  final namelist =
      ['Applied', 'Shortlisted', 'Communication', '5 Years', 'Shortlisted'].obs;
  final selectname = 'Applied'.obs;
  final List<ChartData2> chartData = [
    ChartData2('1 - 2 year', 10, '70%', Color(0xff3269E5)),
    ChartData2('2 - 3 year', 11, '60%', Color(0xff34C7C7)),
    ChartData2('3 - 4 year', 9, '52%', Color(0xffE7B22B)),
    ChartData2('4 - 5 year', 10, '40%', Color(0xff824DCB)),
    ChartData2('5 - 7 year', 9, '52%', Color(0xffDB3A57)),
    ChartData2('7 + year', 10, '40%', Color(0xffA1CE40))
  ];
  final List<SalesData> chartData3 = [
    SalesData(22, 35),
    SalesData(32, 28),
    SalesData(42, 34),
    SalesData(52, 32),
    SalesData(62, 40),
    SalesData(72, 34),
    SalesData(82, 32),
    SalesData(92, 40)
  ];
  final List<BarData> barData = [
    BarData('Q1', 48),
    BarData('Q1', 38),
    BarData('Q1', 55),
    BarData('Q2', 60),
    BarData('Q2', 48),
    BarData('Q2', 56),
    BarData('Q4', 70),
    BarData('Q3', 50),
    BarData('Q3', 46),
    BarData('Q3', 63),
  ];
  final List<SalesData> chartData4 = [
    SalesData(22, 34),
    SalesData(32, 3),
    SalesData(42, 35),
    SalesData(52, 60),
    SalesData(62, 50),
    SalesData(72, 44),
    SalesData(82, 42),
    SalesData(92, 30)
  ];
  @override
  void onInit() {
    super.onInit();
    data = [
      ChartData('CHN', 10, 15, Color(0xffD4EEE5)),
      ChartData('GER', 13, 10, Color(0xff3DB389)),
    ];
    tooltip = TooltipBehavior(
      enable: true,
    );
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
