import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../controllers/jobdetail_controller.dart';

class TotalapplicationView extends GetView<JobdetailController> {
  const TotalapplicationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => JobdetailController());
    return Scaffold(
      appBar: myappbar2(title: JobsName.totalapplication, show: true),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppColors.whiteColor,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          // backgroundColor: AppColors.primaryColor,
                          radius: 20,
                          child: Image.asset('assets/image/bajaj.png'),
                        ),
                        widthSpace10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'UI/UX Designer',
                                  style: BaseStyles.blackMedium16,
                                ),
                                widthSpace5,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: decorationbox2(
                                      color: AppColors.primaryColor2
                                          .withOpacity(0.2),
                                      radius: 30.0),
                                  child: Text(
                                    '6 new',
                                    style: BaseStyles.greenMedium11,
                                  ),
                                )
                              ],
                            ),
                            heightSpace5,
                            Text(
                              'Tech Mahindra',
                              style: BaseStyles.blackMedium12,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // heightSpace10,
          _Jobanalytics(),
        ],
      ),
    );
  }

/////////////jobboards////////////////////////////////////////////////
  Widget _Jobanalytics() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: Get.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          JobsName.totalapplication,
                          style: BaseStyles.blackMedium14,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.greyprimarycolor,
                          size: 13,
                        ),
                        widthSpace5,
                        Text(
                          'Today',
                          style: BaseStyles.grey2Medium12,
                        ),
                        widthSpace3,
                        Icon(
                          Icons.arrow_drop_down,
                          size: 13,
                          color: AppColors.greyprimarycolor,
                        )
                      ],
                    )
                    // widthSpace10
                  ],
                ),
                // heightSpace5,
                // Divider(
                //   thickness: 0.5,
                // ),
                // _boardlistWidget()
              ],
            ),
          ),
        ),
        heightSpace10,
        Container(
          width: Get.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Applications',
                          style: BaseStyles.blackMedium14,
                        ),
                        heightSpace5,
                        Row(
                          children: [
                            Row(
                              children: [
                                Text('30', style: BaseStyles.blackMedium24),
                                widthSpace5,
                                Text(
                                  '45%',
                                  style: BaseStyles.greenMedium12,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: AppColors.primaryColor2,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                heightSpace20,
                Container(
                    child: SfCartesianChart(
                        enableAxisAnimation: true,
                        primaryXAxis: CategoryAxis(
                            majorGridLines: const MajorGridLines(width: 0)),
                        // primaryXAxis: DateTimeAxis(
                        //     labelRotation: 0,
                        //     // dateFormat: DateFormat.MMM(),
                        //     majorGridLines: const MajorGridLines(width: 0)),
                        primaryYAxis: CategoryAxis(
                            minimum: 0,
                            maximum: 80,
                            interval: 10,
                            majorGridLines: const MajorGridLines(width: 0)),
                        isTransposed: true,
                        series: <ChartSeries>[
                      BarSeries<BarData, double>(
                          color: AppColors.primaryColor,
                          width: 0.2,
                          dataSource: controller.barData,
                          xValueMapper: (BarData data, _) => data.x,
                          yValueMapper: (BarData data, _) => data.y,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)))
                    ]))
              ],
            ),
          ),
        ),
        heightSpace10,
      ],
    );
  }
}

class BarData {
  BarData(
    this.x,
    this.y,
  );
  final double x;
  final int y;
}
