import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/constants/app_basestyles.dart';
import 'package:taliqi/app/constants/app_colors.dart';
import 'package:taliqi/app/constants/strings.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: myappbar(),
      // backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          heightSpace5,
          Container(
            padding: EdgeInsets.only(bottom: 10),
            color: AppColors.whiteColor,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 3 / 1.5,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: controller.list.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: decorationbox(
                          border: Border.all(
                              color: AppColors.greyprimarycolor.shade100),
                          color: AppColors.whiteColor,
                          radius: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              controller.list[index]['img'].toString(),
                              height: 30,
                              width: 30,
                            ),
                            widthSpace10,
                            Container(
                              height: 40,
                              width: 1,
                              color: AppColors.greyprimarycolor.shade100,
                            ),
                            widthSpace10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.list[index]['value'].toString(),
                                  style: BaseStyles.blackMedium18,
                                ),
                                heightSpace3,
                                Text(
                                  controller.list[index]['title'].toString(),
                                  style: BaseStyles.greyNormal12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          heightSpace10,
          Container(
            color: AppColors.whiteColor,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source Wise Candidates',
                        style: BaseStyles.blackMedium14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.greycolor3,
                            size: 16,
                          ),
                          widthSpace3,
                          Text(
                            'Filters',
                            style: BaseStyles.grey2normal14,
                          ),
                          widthSpace3,
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.greycolor3,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  _name(),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Accepted Products',
                        style: BaseStyles.blacNormal12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23',
                            style: BaseStyles.blackMedium19,
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Text(
                                '43%',
                                style: BaseStyles.greenMedium10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 16,
                                color: AppColors.primaryColor2,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  heightSpace20,
                  SfCartesianChart(
                      margin: EdgeInsets.zero,
                      borderWidth: 0,
                      // plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                          isVisible: false,
                          //Hide the gridlines of y-axis
                          majorGridLines: MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                          axisLine: AxisLine(width: 0)),
                      primaryYAxis: NumericAxis(
                        axisLine: AxisLine(width: 0),
                        minimum: 0,
                        maximum: 30,
                        interval: 5,
                      ),
                      // tooltipBehavior: controller.tooltip,
                      series: <ChartSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                            borderRadius: BorderRadius.circular(10),
                            pointColorMapper: (ChartData data, _) => data.color,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                            emptyPointSettings: EmptyPointSettings(
                                // Mode of empty point
                                mode: EmptyPointMode.average),
                            dataSource: controller.data,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            name: 'Gold',
                            color: Color.fromRGBO(8, 142, 255, 1)),
                      ]),
                  heightSpace10,
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0xffD4EEE5),
                        ),
                        widthSpace5,
                        Text(
                          'Job Sites',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        widthSpace5,
                        Text(
                          'Referral',
                          style: BaseStyles.blacNormal14,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          heightSpace10,
          Container(
            color: AppColors.whiteColor,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source Wise Candidates',
                        style: BaseStyles.blackMedium14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.greycolor3,
                            size: 16,
                          ),
                          widthSpace3,
                          Text(
                            'Filters',
                            style: BaseStyles.grey2normal14,
                          ),
                          widthSpace3,
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.greycolor3,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  _name(),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status Wise Clients',
                        style: BaseStyles.blacNormal12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23',
                            style: BaseStyles.blackMedium19,
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Text(
                                '43%',
                                style: BaseStyles.greenMedium10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 16,
                                color: AppColors.primaryColor2,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // heightSpace20,
                  SfCircularChart(
                      margin: EdgeInsets.zero,
                      tooltipBehavior: controller.tooltip,
                      series: <CircularSeries>[
                        PieSeries<ChartData2, String>(
                            enableTooltip: true,
                            // strokeColor: Colors.red,
                            dataSource: controller.chartData,
                            pointColorMapper: (ChartData2 data, _) =>
                                data.color,
                            xValueMapper: (ChartData2 data, _) => data.x,
                            yValueMapper: (ChartData2 data, _) => data.y,
                            groupMode: CircularChartGroupMode.point,
                            explode: true,
                            startAngle: 0,
                            name: 'manoj',

                            // All the segments will be exploded
                            explodeAll: true,
                            // Radius for each segment from data source
                            pointRadiusMapper: (ChartData2 data, _) =>
                                data.size)
                      ]),
                  // heightSpace10,
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          heightSpace10,
          Container(
            color: AppColors.whiteColor,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source Wise Candidates',
                        style: BaseStyles.blackMedium14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.greycolor3,
                            size: 16,
                          ),
                          widthSpace3,
                          Text(
                            'Filters',
                            style: BaseStyles.grey2normal14,
                          ),
                          widthSpace3,
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.greycolor3,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  _name(),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status Wise Clients',
                        style: BaseStyles.blacNormal12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23',
                            style: BaseStyles.blackMedium19,
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Text(
                                '43%',
                                style: BaseStyles.greenMedium10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 16,
                                color: AppColors.primaryColor2,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  heightSpace20,
                  SfCartesianChart(
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      margin: EdgeInsets.zero,
                      primaryXAxis: CategoryAxis(axisLine: AxisLine(width: 0)),
                      // primaryYAxis: NumericAxis(
                      //   axisLine: AxisLine(width: 0),
                      //   minimum: 0,
                      //   maximum: 115,
                      //   interval: 20,
                      // ),
                      series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<SalesData, int>(
                            enableTooltip: true,
                            // isVisible: true,
                            dataSource: controller.chartData3,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales),
                        LineSeries<SalesData, int>(
                            enableTooltip: true,
                            dataSource: controller.chartData4,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ]),
                  // heightSpace10,
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          heightSpace10,
          Container(
            color: AppColors.whiteColor,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source Wise Candidates',
                        style: BaseStyles.blackMedium14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.greycolor3,
                            size: 16,
                          ),
                          widthSpace3,
                          Text(
                            'Filters',
                            style: BaseStyles.grey2normal14,
                          ),
                          widthSpace3,
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.greycolor3,
                            size: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  _name(),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status Wise Clients',
                        style: BaseStyles.blacNormal12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23',
                            style: BaseStyles.blackMedium19,
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Text(
                                '43%',
                                style: BaseStyles.greenMedium10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: 16,
                                color: AppColors.primaryColor2,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  heightSpace20,
                  Container(
                      child: SfCartesianChart(
                          enableMultiSelection: true,
                          margin: EdgeInsets.zero,
                          borderWidth: 0,
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                              // isVisible: false,
                              //Hide the gridlines of y-axis
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of y-axis
                              axisLine: AxisLine(width: 0)),
                          primaryYAxis: NumericAxis(
                            axisLine: AxisLine(width: 0),
                            minimum: 35,
                            maximum: 75,
                            interval: 5,
                          ),
                          tooltipBehavior: controller.tooltip,
                          isTransposed: true,
                          series: <ChartSeries>[
                        BarSeries<BarData, String>(
                            color: Color.fromRGBO(109, 98, 247, 1),
                            width: 0.6,
                            dataSource: controller.barData,
                            xValueMapper: (BarData data, _) => data.x,
                            yValueMapper: (BarData data, _) => data.y,
                            borderRadius: BorderRadius.circular(30)),
                        BarSeries<BarData, String>(
                            color: Color(0xffB5E742),
                            width: 0.6,
                            dataSource: controller.barData,
                            xValueMapper: (BarData data, _) => data.x,
                            yValueMapper: (BarData data, _) => data.y,
                            borderRadius: BorderRadius.circular(30)),
                        BarSeries<BarData, String>(
                            color: AppColors.greyprimarycolor.shade200,
                            width: 0.6,
                            dataSource: controller.barData,
                            xValueMapper: (BarData data, _) => data.x,
                            yValueMapper: (BarData data, _) => data.y,
                            borderRadius: BorderRadius.circular(30))
                      ])),
                  // heightSpace10,
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.blue,
                        ),
                        widthSpace5,
                        Text(
                          'Legend',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ////////////////////name list widget ui////////////////////////////////
  _name() {
    return Container(
      height: 30,
      width: Get.width,
      alignment: Alignment.centerLeft,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.namelist.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.selectname.value =
                              controller.namelist[index].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectname.value ==
                                      controller.namelist[index]
                                  ? Color(0xffF2F2F2)
                                  : Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "${controller.namelist[index].toString()}",
                                  style: controller.selectname.value ==
                                          controller.namelist[index]
                                      ? BaseStyles.blackMedium10
                                      : BaseStyles.blackMedium10,
                                ),
                                widthSpace5,
                                Icon(
                                  Icons.close,
                                  color: AppColors.greycolor3,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final int sales;
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.color);
  final Color color;
  final String x;
  final double y;
  final double y1;
}

class ChartData2 {
  ChartData2(
    this.x,
    this.y,
    this.size,
    this.color,
  );
  final String x;
  final double y;
  final Color color;

  final String size;
}

class BarData {
  BarData(
    this.x,
    this.y,
  );
  final String x;
  final int y;
}
