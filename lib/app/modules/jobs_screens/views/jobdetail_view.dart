import 'package:taliqi/app/modules/jobs_screens/views/invitecandidate.dart';
import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/filters.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/jobdetail_controller.dart';

class JobdetailView extends GetView<JobdetailController> {
  const JobdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => JobdetailController());
    return Scaffold(
        appBar: myappbar2(
            title: JobsName.jobdetail,
            show: true,
            ontab1: () => Get.to(InviteCandidateView()),
            ontab2: () {
              jobedit(
                ontab: (value) {
                  switch (value) {
                    case 0:
                      // Get.to(LeadNewTaskView());

                      break;
                    default:
                  }
                },
                context: context,
                controller: controller,
                listname: controller.editlist,
                icon: controller.editlist,
              );
            }),
        body: Obx(
          () => ListView(
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
                    heightSpace10,
                    Divider(
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.lightblackColor,
                                size: 18,
                              ),
                              widthSpace3,
                              Text(
                                'New Delhi',
                                style: BaseStyles.lightblackMedium14,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  isDismissible: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.3,
                                      child: Container(
                                        // height: 300,
                                        decoration:
                                            MyDecoration.radiusonlydecoration(
                                                tlradius: 25.0, trradius: 25.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            children: [
                                              heightSpace20,
                                              Container(
                                                height: 4,
                                                width: 160,
                                                decoration: MyDecoration
                                                    .simpledecoration(
                                                        color: AppColors
                                                            .greyprimarycolor),
                                              ),
                                              heightSpace20,
                                              Text(
                                                'Job Status',
                                                style: BaseStyles.blackMedium16,
                                              ),
                                              // heightSpace10,
                                              ////

                                              heightSpace10,
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 3,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ListTile(
                                                        minVerticalPadding: 0.0,
                                                        minLeadingWidth: 30.0,
                                                        horizontalTitleGap: 0.0,
                                                        visualDensity:
                                                            VisualDensity(
                                                                horizontal:
                                                                    -0.4,
                                                                vertical: -0.4),
                                                        dense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        title: Text(
                                                          index == 0
                                                              ? 'Active'
                                                              : index == 1
                                                                  ? 'Inactive'
                                                                  : 'Close',
                                                          style: BaseStyles
                                                              .grey1Medium14,
                                                        ),
                                                        leading: CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor: index ==
                                                                  0
                                                              ? AppColors
                                                                  .activecolor
                                                              : index == 1
                                                                  ? AppColors
                                                                      .orangecolor
                                                                  : AppColors
                                                                      .blackColor,
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: AppColors.activecolor,
                                ),
                                widthSpace5,
                                Text(
                                  'Active',
                                  style: BaseStyles.greyMedium14,
                                ),
                                widthSpace5,
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.greyprimarycolor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              heightSpace10,
              _jobitem(),
              controller.jobselectname.value == "Applications"
                  ? _jobapplication(context)
                  : controller.jobselectname.value == "Recommended Candidates"
                      ? _jobrecommaneded(context)
                      : controller.jobselectname.value == "Description"
                          ? Column(
                              children: [
                                heightSpace10,
                                jobDetails(),
                                heightSpace10,
                                jobDescription(),
                                heightSpace10,
                                jobprofessional(controller),
                                heightSpace10,
                                jobsoftprofessional(controller),
                                heightSpace10,
                                jobprofile(),
                                heightSpace10,
                                _summary()
                              ],
                            )
                          : controller.jobselectname.value == "Job Boards"
                              ? _JobBoards()
                              : _Jobanalytics(),
            ],
          ),
        ));
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
                          'Job Analytics',
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        graphcontainer(
                            h: 31.0,
                            c: AppColors.primaryColor2.withOpacity(0.5)),
                        widthSpace10,
                        graphcontainer(h: 46.0, c: AppColors.primaryColor2),
                        widthSpace10,
                        graphcontainer(h: 55.0, c: AppColors.primaryColor2),
                        widthSpace10,
                        graphcontainer(
                            h: 36.0,
                            c: AppColors.primaryColor2.withOpacity(0.5)),
                        widthSpace10,
                        graphcontainer(h: 36.0, c: AppColors.primaryColor2),
                        widthSpace10,
                        graphcontainer(
                            h: 48.0,
                            c: AppColors.primaryColor2.withOpacity(0.5)),
                        widthSpace10,
                        graphcontainer(h: 55.0, c: AppColors.primaryColor2),
                      ],
                    )
                  ],
                ),
                heightSpace20,
                mybuttons(
                    action: () {
                      Get.to(TotalapplicationView());
                    },
                    border:
                        Border.all(color: AppColors.greyprimarycolor.shade300),
                    name: 'View acquisition',
                    style: BaseStyles.orangeMedium14,
                    color: AppColors.whiteColor)
              ],
            ),
          ),
        ),
        heightSpace10,
        Obx(
          () => Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.changegraph.value == 1)
                              controller.changegraph.value = 0;
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: AppColors.greycolor,
                          ),
                        ),
                        Text(
                          controller.changegraph.value == 0
                              ? 'Candidate by Experience'
                              : 'Candidate by Budget',
                          style: BaseStyles.blackMedium14,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.changegraph.value == 0)
                              controller.changegraph.value = 1;
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.greycolor,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    controller.changegraph.value == 0
                        ? Column(
                            children: [
                              Container(
                                  child: SfCircularChart(
                                      tooltipBehavior: controller.tooltip,
                                      series: <CircularSeries>[
                                    PieSeries<ChartData, String>(
                                        enableTooltip: true,
                                        // strokeColor: Colors.red,
                                        dataSource: controller.chartData,
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        groupMode: CircularChartGroupMode.point,
                                        explode: true,
                                        startAngle: 0,
                                        name: 'manoj',

                                        // All the segments will be exploded
                                        explodeAll: true,
                                        // Radius for each segment from data source
                                        pointRadiusMapper:
                                            (ChartData data, _) => data.size)
                                  ])),
                              GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 4.0,
                                          childAspectRatio: 3 / 1,
                                          mainAxisSpacing: 4.0),
                                  itemCount: controller.chartData.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Indicator(
                                      color: controller.chartData[index].color,
                                      text: controller.chartData[index].x,
                                      isSquare: false,
                                      // size: controller.touchedIndex.value == 0 ? 18 : 16,
                                      textColor:
                                          controller.touchedIndex.value == 0
                                              ? Colors.black
                                              : Colors.grey,
                                    );
                                  }),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                  child: SfCircularChart(
                                      tooltipBehavior: controller.tooltip,
                                      series: <CircularSeries>[
                                    PieSeries<ChartData, String>(
                                        enableTooltip: true,
                                        // strokeColor: Colors.red,
                                        dataSource: controller.chartData2,
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        groupMode: CircularChartGroupMode.point,
                                        explode: true,
                                        startAngle: 0,
                                        // name: 'manoj',

                                        // All the segments will be exploded
                                        explodeAll: true,
                                        // Radius for each segment from data source
                                        pointRadiusMapper:
                                            (ChartData data, _) => data.size)
                                  ])),
                              GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 4.0,
                                          childAspectRatio: 5 / 1,
                                          mainAxisSpacing: 4.0),
                                  itemCount: controller.chartData2.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Indicator(
                                      color: controller.chartData2[index].color,
                                      text: controller.chartData2[index].x,
                                      isSquare: false,
                                      // size: controller.touchedIndex.value == 0 ? 18 : 16,
                                      textColor:
                                          controller.touchedIndex.value == 0
                                              ? Colors.black
                                              : Colors.grey,
                                    );
                                  }),
                            ],
                          )
                  ]))),
        )
      ],
    );
  }

  Container graphcontainer({h, c}) {
    return Container(
      height: h ?? 50,
      width: 8,
      decoration: MyDecoration.radiusonlydecoration(
          tlradius: 30.0, trradius: 30.0, color: c ?? AppColors.primaryColor3),
    );
  }

/////////////jobboards////////////////////////////////////////////////
  Widget _JobBoards() {
    return Container(
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
                      'Job Boards',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                Obx(
                  () => Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selected.value = 0;
                        },
                        child: Image.asset(
                          controller.selected.value == 0
                              ? MyImages.hc1
                              : MyImages.h1,
                          height: 25,
                          width: 25,
                          // color: AppColors.greyprimarycolor,
                        ),
                      ),
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.selected.value = 1;
                        },
                        child: Image.asset(
                          controller.selected.value == 1
                              ? MyImages.vc1
                              : MyImages.v1,
                          height: 25,
                          width: 25,
                          // color: AppColors.greyprimarycolor,
                        ),
                      ),
                      widthSpace10
                    ],
                  ),
                ),
                // widthSpace10
              ],
            ),
            heightSpace5,
            Divider(
              thickness: 0.5,
            ),
            _boardlistWidget()
          ],
        ),
      ),
    );
  }

  //////////////////// job application list widget ui////////////////////////////////
  _boardlistWidget() {
    return SizedBox(
      height: Get.height,
      child: ListView.builder(
          scrollDirection:
              controller.selected.value == 1 ? Axis.horizontal : Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: controller.joboardlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const JobdetailView());
                  },
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8.0),
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        // Divider(
                        //   thickness: 0.5,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  controller.joboardlist[index]['img']
                                      .toString(),
                                  height: 20,
                                  width: 20,
                                ),
                                widthSpace5,
                                Text(
                                  controller.joboardlist[index]['title']
                                      .toString(),
                                  style: BaseStyles.blacNormal14,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      AppColors.greyprimarycolor.shade200,
                                  radius: 10,
                                  child: Text(
                                    '2',
                                    style: BaseStyles.greyNormal12,
                                  ),
                                ),
                                widthSpace5,
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: AppColors.greyprimarycolor,
                                  size: 18,
                                )
                              ],
                            )
                          ],
                        ),
                        heightSpace10,
                        Container(
                          decoration: decorationbox(
                              color: AppColors.greyprimarycolor.shade100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/image/category.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            widthSpace10,
                                            CircleAvatar(
                                              // backgroundColor: AppColors.primaryColor,
                                              radius: 15,
                                              child: Image.asset(
                                                  'assets/image/bajaj.png'),
                                            ),
                                            widthSpace10,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Nikita Sharma',
                                                      style: BaseStyles
                                                          .blackMedium14,
                                                    ),
                                                  ],
                                                ),
                                                heightSpace3,
                                                Text(
                                                  '2 days ago',
                                                  style:
                                                      BaseStyles.grey2Medium12,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.more_vert_outlined,
                                          size: 18,
                                          color: AppColors.greyprimarycolor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                heightSpace5,
                                heightSpace3,
                                Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/image/category.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            widthSpace10,
                                            CircleAvatar(
                                              // backgroundColor: AppColors.primaryColor,
                                              radius: 15,
                                              child: Image.asset(
                                                  'assets/image/bajaj.png'),
                                            ),
                                            widthSpace10,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Nikita Sharma',
                                                      style: BaseStyles
                                                          .blackMedium14,
                                                    ),
                                                  ],
                                                ),
                                                heightSpace3,
                                                Text(
                                                  '2 days ago',
                                                  style:
                                                      BaseStyles.grey2Medium12,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.more_vert_outlined,
                                          size: 18,
                                          color: AppColors.greyprimarycolor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // heightSpace10
              ],
            );
          }),
    );
  }
  ////////jobrecomm////////////////////////////////

  Widget _jobrecommaneded(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            heightSpace10,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.showseach.value == true
                      ? Expanded(
                          child: textfiled(
                          suffixsize: 20.0,
                          eyeshow: true,
                          suffixontab: () {
                            controller.showseach.value = false;
                          },

                          style: BaseStyles.grey3Normal16,
                          // controller: controller.emailtxt,
                          readonly: false,
                          text: 'Search',
                          suffixicon: Icons.close,
                          suffixIconcolor: AppColors.greyprimarycolor,
                        ))
                      : Row(
                          children: [
                            Text(
                              'Recommended(4)',
                              style: BaseStyles.blackMedium14,
                            )
                          ],
                        ),
                  Row(
                    children: [
                      controller.showseach.value != true
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              constraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              onPressed: () {
                                controller.showseach.value = true;
                              },
                              icon: Icon(
                                Icons.search,
                                color: AppColors.greyprimarycolor,
                              ))
                          : Container(),
                      widthSpace20,
                      InkWell(
                        onTap: () {
                          filter(context, controller);
                        },
                        child: Image.asset(
                          MyImages.filter,
                          height: 20,
                          width: 20,
                          color: AppColors.greyprimarycolor,
                        ),
                      ),
                      widthSpace10
                    ],
                  ),
                  // widthSpace10
                ],
              ),
            ),
            _listrecomWidget()
          ],
        ),
      ),
    );
  }

  //////////////////// job application list widget ui////////////////////////////////
  _listrecomWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace10,
              InkWell(
                onTap: () {
                  Get.to(const JobdetailView());
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                // backgroundColor: AppColors.primaryColor,
                                radius: 18,
                                child: Image.asset('assets/image/bajaj.png'),
                              ),
                              widthSpace10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Manoj Sharma',
                                        style: BaseStyles.blackMedium14,
                                      ),
                                    ],
                                  ),
                                  heightSpace5,
                                  Text(
                                    'Flutter Developer',
                                    style: BaseStyles.grey2Medium12,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Assign',
                                style: BaseStyles.orangeMedium14,
                              ))
                        ],
                      ),
                      heightSpace10,
                      heightSpace5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.greyprimarycolor,
                                size: 18,
                              ),
                              widthSpace3,
                              Text(
                                'New Delhi',
                                style: BaseStyles.lightblackMedium12,
                              )
                            ],
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Image.asset(
                                MyImages.bag,
                                color: AppColors.greyprimarycolor,
                                height: 16,
                                width: 16,
                              ),
                              widthSpace3,
                              Text(
                                '14 year',
                                style: BaseStyles.lightblackMedium12,
                              )
                            ],
                          ),
                          widthSpace10,
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.person_outline,
                          //       color: AppColors.greyprimarycolor,
                          //       size: 18,
                          //     ),
                          //     widthSpace3,
                          //     Text(
                          //       '12 Candidates',
                          //       style: BaseStyles.lightblackMedium12,
                          //     )
                          //   ],
                          // ),
                          Text(
                            '₹ 20 LPA',
                            style: BaseStyles.lightblackMedium12,
                          )
                        ],
                      ),

                      // heightSpace10,
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinearPercentIndicator(
                                alignment: MainAxisAlignment.start,
                                width: Get.width * 0.80,
                                lineHeight: 6.0,
                                percent: 0.5,
                                animation: true,
                                barRadius: const Radius.circular(20),
                                // center:
                                //     Text("50.0%", style: BaseStyles.whitebold14),
                                // trailing: Icon(Icons.mood),

                                backgroundColor:
                                    AppColors.greyprimarycolor.withOpacity(0.6),
                                progressColor: AppColors.orangecolor),
                            Text(
                              '70%',
                              style: BaseStyles.lightblackMedium14,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // heightSpace10
            ],
          );
        });
  }
  ///////////Application page////////////////////////////////////////////////////////

  Widget _jobapplication(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            heightSpace10,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.showseach.value == true
                      ? Expanded(
                          child: textfiled(
                          suffixsize: 20.0,
                          eyeshow: true,
                          suffixontab: () {
                            controller.showseach.value = false;
                          },

                          style: BaseStyles.grey3Normal16,
                          // controller: controller.emailtxt,
                          readonly: false,
                          text: 'Search',
                          suffixicon: Icons.close,
                          suffixIconcolor: AppColors.greyprimarycolor,
                        ))
                      : Row(
                          children: [
                            Text(
                              'Applications(4)',
                              style: BaseStyles.blackMedium14,
                            )
                          ],
                        ),
                  Row(
                    children: [
                      controller.showseach.value != true
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              constraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              onPressed: () {
                                controller.showseach.value = true;
                              },
                              icon: Icon(
                                Icons.search,
                                color: AppColors.greyprimarycolor,
                              ))
                          : Container(),
                      widthSpace20,
                      InkWell(
                        onTap: () {
                          filter(context, controller);
                        },
                        child: Image.asset(
                          MyImages.filter,
                          height: 20,
                          width: 20,
                          color: AppColors.greyprimarycolor,
                        ),
                      ),
                      widthSpace10
                    ],
                  ),
                  // widthSpace10
                ],
              ),
            ),
            _listWidget()
          ],
        ),
      ),
    );
  }

  //////////////////// job application list widget ui////////////////////////////////
  _listWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace10,
              InkWell(
                onTap: () {
                  Get.to(const JobdetailView());
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                // backgroundColor: AppColors.primaryColor,
                                radius: 18,
                                child: Image.asset('assets/image/bajaj.png'),
                              ),
                              widthSpace10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Nikita Sharma',
                                        style: BaseStyles.blackMedium14,
                                      ),
                                    ],
                                  ),
                                  heightSpace5,
                                  Text(
                                    'Tech Mahindra',
                                    style: BaseStyles.grey2Medium12,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.more_vert_outlined,
                              size: 18,
                              color: AppColors.greyprimarycolor,
                            ),
                          )
                        ],
                      ),
                      heightSpace10,
                      heightSpace5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.greycolor2,
                                size: 18,
                              ),
                              widthSpace3,
                              Text(
                                'New Delhi',
                                style: BaseStyles.grey2Medium12,
                              )
                            ],
                          ),
                          widthSpace10,
                          Row(
                            children: [
                              Image.asset(
                                MyImages.bag,
                                color: AppColors.greycolor2,
                                height: 16,
                                width: 16,
                              ),
                              widthSpace3,
                              Text(
                                '14 year',
                                style: BaseStyles.grey2Medium12,
                              )
                            ],
                          ),
                          widthSpace10,
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.person_outline,
                          //       color: AppColors.greyprimarycolor,
                          //       size: 18,
                          //     ),
                          //     widthSpace3,
                          //     Text(
                          //       '12 Candidates',
                          //       style: BaseStyles.lightblackMedium12,
                          //     )
                          //   ],
                          // ),
                          Text(
                            '₹ 20 LPA',
                            style: BaseStyles.grey2Medium12,
                          )
                        ],
                      ),

                      // heightSpace10,
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Skills: ',
                                  style: BaseStyles.blackMedium12,
                                ),
                                Text(
                                  'MS Office,MIS,Tally,Exce...',
                                  style: BaseStyles.lightblackMedium12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Text(
                              'Aug 15,22',
                              style: BaseStyles.lightblackMedium12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // heightSpace10
            ],
          );
        });
  }

/////////////summary................................................................
  Widget _summary() {
    return Container(
      height: 100,
      width: Get.width,
      color: AppColors.whiteColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.greyprimarycolor,
                child: Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 12,
                )),
            widthSpace10,
            Text(
              'That\'s all folk!',
              style: BaseStyles.greyMedium13,
            )
          ]),
    );
  }

  //////////////////// job name list widget ui////////////////////////////////
  Widget _jobitem() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.joblist.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.jobselectname.value =
                              controller.joblist[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.jobselectname.value ==
                                      controller.joblist[index]['name']
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              border: Border.all(
                                  color: AppColors.greyprimarycolor,
                                  width: 0.2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              controller.joblist[index]['value'] == ""
                                  ? controller.joblist[index]['name'].toString()
                                  : "${controller.joblist[index]['name'].toString()} (${controller.joblist[index]['value'].toString()})",
                              style: controller.jobselectname.value ==
                                      controller.joblist[index]['name']
                                  ? BaseStyles.whitemedium14
                                  : BaseStyles.greyMedium14,
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

// Indicator
class Indicator extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final bool isSquare;
  final double size;

  const Indicator({
    Key? key,
    required this.color,
    this.textColor = Colors.white,
    required this.text,
    required this.isSquare,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        widthSpace10,
        Text(text, style: BaseStyles.grey1Medium14)
      ],
    );
  }
}

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }

class ChartData {
  ChartData(
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
