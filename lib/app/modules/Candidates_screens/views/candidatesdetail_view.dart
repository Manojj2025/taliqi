import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:taliqi/app/widgets/buttons.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:taliqi/app/widgets/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/rating.dart';
import '../../../widgets/search.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/candidatesdetail_controller.dart';
import 'assignjob_view.dart';

class CandidatesdetailView extends GetView<CandidatesdetailController> {
  const CandidatesdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CandidatesdetailController());
    return Scaffold(
      appBar: myappbar2(
          title: HomeName.candidateDetail,
          show: true,
          show2: Container(),
          ontab2: () {
            jobedit(
              height: 0.45,
              ontab: (value) {
                switch (value) {
                  case 0:
                    Get.back();
                    // Get.to(ClientNewTaskView());

                    break;
                  case 1:
                    Get.back();
                    Get.to(AssignJobView());

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
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: AppColors.whiteColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 50,
                                  child: CircularPercentIndicator(
                                    animation: true,
                                    radius: 20.0,
                                    lineWidth: 5.0,
                                    percent: 0.8,
                                    center: Image.asset(
                                      'assets/image/bajaj.png',
                                      height: 32,
                                      width: 32,
                                      color: AppColors.orangecolor,
                                    ),
                                    progressColor: AppColors.primaryColor,
                                  ),
                                ),
                                // CircleAvatar(
                                //   radius: 18,
                                //   backgroundColor: AppColors.primaryColor,
                                //   child: CircleAvatar(
                                //     backgroundColor: Color(0xffECF7F3),
                                // child: Image.asset(
                                //   'assets/image/4.png',
                                //   height: 20,
                                //   width: 20,
                                //   color: AppColors.primaryColor,
                                // ),
                                //     radius: 17,
                                //   ),
                                // ),
                                widthSpace10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nikita Sharma',
                                      style: BaseStyles.blackMedium16,
                                    ),
                                    Text(
                                      'Tech Mahindra',
                                      style: BaseStyles.grey2normal12,
                                    ),
                                    heightSpace5,
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.to(AssignJobView());
                                      },
                                      child: Image.asset(
                                        MyImages.edit,
                                        height: 15,
                                        color: AppColors.greyprimarycolor,
                                        width: 15,
                                      )),
                                  widthSpace10,
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.bookmark,
                                        size: 18, color: AppColors.yellowcolor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        heightSpace10,
                        // heightSpace5,
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
                                  style: BaseStyles.grey2Medium12,
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
                        Divider(
                          thickness: 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBarIndicator(
                                  rating: 4.0,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  unratedColor:
                                      AppColors.greyprimarycolor.shade300,
                                  direction: Axis.horizontal,
                                ),
                                heightSpace3,
                                Text(
                                  '(0.0) Over All',
                                  style: BaseStyles.grey2normal12,
                                )
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: AppColors.greyprimarycolor.shade400,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBarIndicator(
                                  rating: 4.0,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  unratedColor:
                                      AppColors.greyprimarycolor.shade300,
                                  direction: Axis.horizontal,
                                ),
                                heightSpace3,
                                Text(
                                  '(0.0) Self',
                                  style: BaseStyles.grey2normal12,
                                )
                              ],
                            ),
                          ],
                        ),
                        // Divider(
                        //   thickness: 0.5,
                        // ),
                        // heightSpace10,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Image.asset(
                        //           'assets/image/2.png',
                        //           height: 16,
                        //           width: 16,
                        //           color: AppColors.greycolor3,
                        //         ),
                        //         widthSpace3,
                        //         Text(
                        //           'Source:',
                        //           style: BaseStyles.lightblacklarge12,
                        //         ),
                        //         Text(
                        //           'Cold call',
                        //           style: BaseStyles.lightblackMedium12,
                        //         ),
                        //       ],
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         // status(
                        //         //     context: context,
                        //         //     title: 'Update Status',
                        //         //     controller: controller,
                        //         //     list: controller.sortlist);
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.person_rounded,
                        //             size: 16,
                        //             color: AppColors.orangecolor,
                        //           ),
                        //           widthSpace5,
                        //           Text(
                        //             'Contacted',
                        //             style: BaseStyles.lightblackMedium12,
                        //           ),
                        //           widthSpace5,
                        //           Icon(
                        //             Icons.arrow_drop_down,
                        //             color: AppColors.greyprimarycolor,
                        //           )
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                    Positioned(
                        top: 31,
                        left: 2,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: decorationbox2(
                              radius: 30.0, color: Color(0xffE3EFEB)),
                          child: Text(
                            '90%',
                            style: BaseStyles.blacNormal12,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            heightSpace10,
            _item(),
            heightSpace10,
            controller.selectname.value == 'Overview'
                ? Column(
                    children: [
                      Details(),
                      heightSpace10,
                      Overview(),
                      heightSpace10,
                      _jobprofessional(),
                      heightSpace10,
                      _jobsoftprofessional(),
                      heightSpace10,
                      Container(
                        width: Get.width,
                        height: 100,
                        color: AppColors.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 35,
                              margin: EdgeInsets.only(top: 10),
                              width: Get.width,
                              decoration: decorationbox2(
                                  radius: 5.0,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Last Active 3:00 PM, 18 Feb 2022',
                                  style: BaseStyles.greenMedium14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : controller.selectname.value == 'Candidate Details'
                    ? Column(
                        children: [
                          _listCandidateDetailsWidget(),
                          heightSpace10,
                          _EducationWidget(),
                          heightSpace10,
                          _CertificationsWidget(),
                          heightSpace10,
                          _ResumeWidget(),
                          heightSpace10,
                          _DocumentsWidget()
                        ],
                      )
                    :
                    // : Container()
                    controller.selectname.value == 'Feedback'
                        ? Column(
                            children: [
                              _FeebackWidget(context),
                              heightSpace10,
                              _Feeback2Widget(),
                              heightSpace10,
                              _Feeback2Widget(),
                            ],
                          )
                        : controller.selectname.value == 'Jobs'
                            ? _job()
                            : controller.selectname.value == 'Notes'
                                ? notes()
                                : activities()
          ],
        ),
      ),
    );
  }

//////////////////////////ACTIVITES///////////////////////////////////
  Widget activities() {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Activities',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'All',
                      style: BaseStyles.grey3Normal12,
                    ),
                    widthSpace3,
                    // widthSpace20,
                    Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.greyprimarycolor,
                      size: 18,
                    ),
                    widthSpace10,
                  ],
                ),
                // widthSpace10
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  controller.list2.length,
                  (index) => SizedBox(
                        width: Get.width * 0.90,
                        height: 80,
                        child: TimelineTile(
                          startChild: Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '3:00 PM',
                                  style: BaseStyles.blacNormal12,
                                ),
                                Text(
                                  '21st Feb, 2020',
                                  style: BaseStyles.grey2normal12,
                                ),
                              ],
                            ),
                          ),
                          alignment: TimelineAlign.manual,
                          lineXY: 0.24,

                          beforeLineStyle: const LineStyle(
                              thickness: 2, color: AppColors.primaryColor),
                          afterLineStyle: const LineStyle(
                              thickness: 2, color: AppColors.primaryColor),
                          indicatorStyle: IndicatorStyle(
                              indicatorXY: 0.1,
                              drawGap: false,
                              width: 8,
                              color: AppColors.primaryColor),
                          // lineXY: 1,
                          endChild: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: controller.list2color[index],
                                  radius: 13,
                                  child: Icon(
                                    controller.list2icon[index],
                                    size: 15,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                widthSpace5,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.list2[index]['text']
                                            .toString(),
                                        style: BaseStyles.blackMedium14,
                                      ),
                                      heightSpace3,
                                      Text(
                                        controller.list2[index]['t2']
                                            .toString(),
                                        style: BaseStyles.grey2normal12,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isFirst: controller.list2[index]['first'] == true
                              ? true
                              : false,
                          // isLast: true,
                          isLast: controller.list2[index]['last'] == true
                              ? true
                              : false,
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }

//////////////////////////notes///////////////////////////////////
  Widget notes() {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Notes',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.orangecolor,
                      size: 16,
                    ),
                    widthSpace3,
                    // widthSpace20,
                    Text(
                      'Add',
                      style: BaseStyles.orangeMedium14,
                    ),
                    widthSpace10,
                  ],
                ),
                // widthSpace10
              ],
            ),
            Divider(
              thickness: 0.5,
            ),
            _listnotesWidget()
          ],
        ),
      ),
    );
  }

  //////////////////// job list widget ui////////////////////////////////
  _listnotesWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(0.0),
                color: AppColors.whiteColor,
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Having experience of more than 5 years in UI development for Web Application and Mobile applciations.',
                              style: BaseStyles.blacNormal14,
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert_outlined,
                                size: 16,
                                color: AppColors.greyprimarycolor,
                              )),
                        ]),
                    heightSpace10,
                    heightSpace5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                              color: AppColors.greyprimarycolor,
                            ),
                            widthSpace3,
                            Text(
                              '21 Aug 2022',
                              style: BaseStyles.lightblackMedium12,
                            )
                          ],
                        ),
                        widthSpace10,
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: AppColors.greyprimarycolor,
                              size: 18,
                            ),
                            widthSpace3,
                            Text(
                              'By Recruiter',
                              style: BaseStyles.lightblackMedium12,
                            )
                          ],
                        ),
                      ],
                    ),
                    heightSpace5,
                    Divider(
                      thickness: 0.5,
                    ),
                    // heightSpace10,
                  ],
                ),
              ),
              // heightSpace10
            ],
          );
        });
  }

////////////////////jobs//////////////////////////////////////
  _job() {
    return Container(
      color: AppColors.whiteColor,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            controller.showseach.value == true
                ? textfiled(
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
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jobs (2)',
                        style: BaseStyles.blackMedium14,
                      ),
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
                                size: 20,
                                color: AppColors.greyprimarycolor,
                              ))
                          : Container(),

                      // widthSpace10
                    ],
                  ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            // heightSpace10,f
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 2.0,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'UI/UX Designer',
                          style: BaseStyles.blacNormal14,
                        ),
                        subtitle: Text(
                          'Tech Mahindra, 1st Sep 22',
                          style: BaseStyles.grey2Medium12,
                        ),
                        leading: CircleAvatar(
                          // backgroundColor: AppColors.primaryColor,
                          radius: 16,
                          child: Image.asset('assets/image/bajaj.png'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: Get.width * 0.90,
                        decoration: decorationbox2(
                            radius: 5.0,
                            color: AppColors.primaryColor.withOpacity(0.2)),
                        child: Text(
                          'Pending',
                          style: BaseStyles.greennormal14,
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
////////////////Feedback details////////////////////////////////

  _Feeback2Widget() {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: decorationbox2(
                                  color:
                                      AppColors.primaryColor2.withOpacity(0.2),
                                  radius: 30.0),
                              child: Text(
                                '6',
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
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        size: 20,
                        color: AppColors.greyprimarycolor,
                      ),
                      widthSpace10,
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: AppColors.greyprimarycolor,
                      )
                    ],
                  ),
                )
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            // heightSpace10,
            Text(
              'worked on several applications and coordinated with backend development team as well.',
              style: BaseStyles.blacNormal14,
            ),
            heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Circularwidget(
                  rate: '4.7',
                  text: 'Communication',
                ),
                widthSpace20,
                Circularwidget(
                  rate: '4.7',
                  text: 'Leadership',
                ),
                widthSpace20,
                Circularwidget(
                  rate: '4.7',
                  text: 'Teamwork',
                ),
              ],
            ),
            heightSpace10,
            RatingBarIndicator(
              rating: 4.0,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
              unratedColor: AppColors.greyprimarycolor.shade300,
              direction: Axis.horizontal,
            ),
            heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: AppColors.greyprimarycolor,
                    ),
                    widthSpace3,
                    Text(
                      '21 Aug 2022',
                      style: BaseStyles.lightblackMedium12,
                    )
                  ],
                ),
                widthSpace10,
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.greyprimarycolor,
                      size: 18,
                    ),
                    widthSpace3,
                    Text(
                      'By Recruiter',
                      style: BaseStyles.lightblackMedium12,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

////////////////Feedback details////////////////////////////////

  _FeebackWidget(context) {
    return Container(
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
                      'Feedback',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),

                // widthSpace10
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "4",
                      style: BaseStyles.blackMedium30,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.blackColor,
                      size: 18,
                    )
                  ],
                ),
                Column(
                  children: [
                    chartRow(context, '5', 60),
                    chartRow(context, '4', 8),
                    chartRow(context, '3', 2),
                    chartRow(context, '4', 1),
                    chartRow(context, '1', 0),
                  ],
                ),
              ],
            ),
            heightSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Circularwidget(
                  rate: '4.7',
                  text: 'Communication',
                ),
                Circularwidget(
                  rate: '4.7',
                  text: 'Leadership',
                ),
                Circularwidget(
                  rate: '4.7',
                  text: 'Teamwork',
                ),
                Circularwidget(
                  rate: '4.7',
                  text: 'Leadership',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

////////////////Education details////////////////////////////////

  _ResumeWidget() {
    return Container(
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
                      'Resume',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    // print('kk');
                    // Get.to(AddrecruiterView());
                  },
                  child: Container(
                      child: Row(
                    children: [
                      Text(
                        'Template 1',
                        style: BaseStyles.greyNormal12,
                      ),
                      widthSpace5,
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.greyprimarycolor,
                      )
                    ],
                  )),
                ),
                // widthSpace10
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            heightSpace10,
            Image.asset(
              'assets/image/resume.png',
              width: Get.width,
              height: 200,
              fit: BoxFit.contain,
            ),
            heightSpace20,
            mybuttons(
                style: BaseStyles.orangeMedium16,
                border: Border.all(color: AppColors.orangecolor),
                action: () {
                  print('object');
                },
                name: 'Download Resume',
                color: AppColors.whiteColor,
                height: 40.0)
          ],
        ),
      ),
    );
  }

////////////////Education details////////////////////////////////

  _EducationWidget() {
    return Container(
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
                      'Education',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    // print('kk');
                    // Get.to(AddrecruiterView());
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.orangecolor,
                          size: 16,
                        ),
                        // widthSpace20,
                        widthSpace3,
                        Text(
                          'Add',
                          style: BaseStyles.orangeMedium14,
                        ),
                        // widthSpace10,
                      ],
                    ),
                  ),
                ),
                // widthSpace10
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            heightSpace10,
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.0),
                        color: AppColors.whiteColor,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Bachelor of Computer Application',
                                              style: BaseStyles.blackMedium14,
                                            ),
                                          ],
                                        ),
                                        heightSpace5,
                                        Text(
                                          'IGNOU',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                        heightSpace5,
                                        Text(
                                          '2009',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      MyImages.edit,
                                      height: 16,
                                      width: 16,
                                    )),
                              ],
                            ),

                            heightSpace10,
                            // heightSpace5,

                            // heightSpace5,
                            Divider(
                              thickness: 0.5,
                            ),
                            // heightSpace10,
                          ],
                        ),
                      ),
                      // heightSpace10
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  //////////////////// Documents list widget ui////////////////////////////////
  _DocumentsWidget() {
    return Container(
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
                          'Documents',
                          style: BaseStyles.blackMedium14,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // print('kk');
                        // Get.to(AddrecruiterView());
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.orangecolor,
                              size: 16,
                            ),
                            // widthSpace20,
                            widthSpace3,
                            Text(
                              'Add',
                              style: BaseStyles.orangeMedium14,
                            ),
                            // widthSpace10,
                          ],
                        ),
                      ),
                    ),
                    // widthSpace10
                  ],
                ),
                heightSpace10,
                Divider(
                  thickness: 0.5,
                ),
                heightSpace10,
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: AppColors.whiteColor,
                              child: Column(
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/image/i.png'),
                                        widthSpace10,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Media title',
                                                style: BaseStyles.blackMedium14,
                                              ),
                                              heightSpace5,
                                              Text(
                                                'Reference site information on its origins',
                                                style: BaseStyles.blacNormal14,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          MyImages.edit,
                                          height: 15,
                                          width: 15,
                                        ),
                                      ]),
                                  heightSpace10,

                                  Divider(
                                    thickness: 0.5,
                                  ),
                                  // heightSpace10,
                                ],
                              ),
                            ),
                          ),
                          // heightSpace10
                        ],
                      );
                    }),
              ],
            )));
  }
////////////////Certifications details////////////////////////////////

  _CertificationsWidget() {
    return Container(
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
                      'Certifications',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    // print('kk');
                    // Get.to(AddrecruiterView());
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.orangecolor,
                          size: 16,
                        ),
                        // widthSpace20,
                        widthSpace3,
                        Text(
                          'Add',
                          style: BaseStyles.orangeMedium14,
                        ),
                        // widthSpace10,
                      ],
                    ),
                  ),
                ),
                // widthSpace10
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            heightSpace10,
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.0),
                        color: AppColors.whiteColor,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Project Management Professional (PMP)®',
                                              style: BaseStyles.blackMedium14,
                                            ),
                                          ],
                                        ),
                                        heightSpace5,
                                        Text(
                                          'Project Management Institute',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                        heightSpace5,
                                        Text(
                                          'Issued Jan 2022 · Expires Jan 2026',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                        heightSpace5,
                                        Text(
                                          'Credential ID 5456484546',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      MyImages.edit,
                                      height: 16,
                                      width: 16,
                                    )),
                              ],
                            ),

                            heightSpace10,
                            // heightSpace5,

                            // heightSpace5,
                            Divider(
                              thickness: 0.5,
                            ),
                            // heightSpace10,
                          ],
                        ),
                      ),
                      // heightSpace10
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
////////////////candidate details////////////////////////////////

  _listCandidateDetailsWidget() {
    return Container(
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
                      'Work Experience',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    // print('kk');
                    // Get.to(AddrecruiterView());
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.orangecolor,
                          size: 16,
                        ),
                        // widthSpace20,
                        widthSpace3,
                        Text(
                          'Add',
                          style: BaseStyles.orangeMedium14,
                        ),
                        // widthSpace10,
                      ],
                    ),
                  ),
                ),
                // widthSpace10
              ],
            ),
            heightSpace10,
            Divider(
              thickness: 0.5,
            ),
            heightSpace10,
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.0),
                        color: AppColors.whiteColor,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      // backgroundColor: AppColors.primaryColor,
                                      radius: 16,
                                      child:
                                          Image.asset('assets/image/bajaj.png'),
                                    ),
                                    widthSpace10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'UI/UX Designer',
                                              style: BaseStyles.blackMedium14,
                                            ),
                                          ],
                                        ),
                                        heightSpace5,
                                        Text(
                                          'Tech Mahindra, Gurugram',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                        heightSpace5,
                                        Text(
                                          'Dec 18 - Present . 3 year(s) 8 months',
                                          style: BaseStyles.lightblackMedium12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        MyImages.edit,
                                        height: 16,
                                        width: 16,
                                      )),
                                ),
                              ],
                            ),
                            heightSpace5,
                            Text(
                              'worked on several applications and coordinated with backend development team as well.',
                              style: BaseStyles.blacNormal12,
                            ),
                            heightSpace10,
                            // heightSpace5,

                            // heightSpace5,
                            Divider(
                              thickness: 0.5,
                            ),
                            // heightSpace10,
                          ],
                        ),
                      ),
                      // heightSpace10
                    ],
                  );
                }),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: 16,
                  ),
                  Text(
                    '2 More',
                    style: BaseStyles.greenMedium14,
                  )
                ],
              ),
            ),
            heightSpace10
          ],
        ),
      ),
    );
  }

///////// professional skills////////////////////////////////

  Widget _jobprofessional() {
    return Container(
      height: 80,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              JobsName.professionalSkills,
              style: BaseStyles.blackMedium14,
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.joblist2.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    (() => Row(
                          children: [
                            widthSpace10,
                            InkWell(
                              onTap: () {
                                controller.jobselectname2.value =
                                    controller.joblist2[index].toString();
                              },
                              child: Container(
                                height: 30,
                                // width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.jobselectname2.value ==
                                            controller.joblist2[index]
                                        ? AppColors.primaryColor
                                        : AppColors.whiteColor,
                                    border: Border.all(
                                        color: AppColors.greyprimarycolor,
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.joblist2[index].toString(),
                                        style:
                                            controller.jobselectname2.value ==
                                                    controller.joblist2[index]
                                                ? BaseStyles.whitenormal12
                                                : BaseStyles.grey2Medium12,
                                      ),
                                      widthSpace3,
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellowcolor,
                                        size: 15,
                                      ),
                                      widthSpace3,
                                      Text(
                                        '(4)',
                                        style:
                                            controller.jobselectname2.value ==
                                                    controller.joblist2[index]
                                                ? BaseStyles.whitenormal12
                                                : BaseStyles.grey2Medium12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          ),
          heightSpace10
        ],
      ),
    );
  }

///////// professional skills////////////////////////////////

  Widget _jobsoftprofessional() {
    return Container(
      height: 80,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              JobsName.softSkills,
              style: BaseStyles.blackMedium14,
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.joblist2.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    (() => Row(
                          children: [
                            widthSpace10,
                            InkWell(
                              onTap: () {
                                controller.jobselectname3.value =
                                    controller.joblist2[index].toString();
                              },
                              child: Container(
                                height: 30,
                                // width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.jobselectname3.value ==
                                            controller.joblist2[index]
                                        ? AppColors.primaryColor
                                        : AppColors.whiteColor,
                                    border: Border.all(
                                        color: AppColors.greyprimarycolor,
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.joblist2[index].toString(),
                                        style:
                                            controller.jobselectname2.value ==
                                                    controller.joblist2[index]
                                                ? BaseStyles.whitenormal12
                                                : BaseStyles.grey2Medium12,
                                      ),
                                      widthSpace3,
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellowcolor,
                                        size: 15,
                                      ),
                                      widthSpace3,
                                      Text(
                                        '(4)',
                                        style:
                                            controller.jobselectname2.value ==
                                                    controller.joblist2[index]
                                                ? BaseStyles.whitenormal12
                                                : BaseStyles.grey2Medium12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          ),
          heightSpace10
        ],
      ),
    );
  }

//////  details////////////////////////////////
  Widget Details() {
    return Container(
        // height: 50,
        width: Get.width,
        color: AppColors.whiteColor,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Details',
                      style: BaseStyles.blackMedium14,
                    ),
                    // InkWell(
                    //     onTap: () {},
                    //     child: Image.asset(
                    //       MyImages.edit,
                    //       height: 16,
                    //       width: 16,
                    //     )),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Having experience of more than 5 years in UI development for Web Application and Mobile applciations.',
                  style: BaseStyles.blacNormal14,
                ),
              ),
              heightSpace10,
            ],
          ),
        ));
  }

////// job deta

/////// designation////////////////////////////////////////////////////////////////
  Widget Overview({padding}) {
    return Container(
      color: AppColors.whiteColor,
      width: Get.width,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10.0),
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
                      backgroundColor: Color(0xffECF7F3),
                      child: Icon(
                        Icons.phone,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                      radius: 17,
                    ),
                    widthSpace10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone',
                          style: BaseStyles.grey3medium12,
                        ),
                        Text(
                          '+60 13479739479',
                          style: BaseStyles.blacNormal14,
                        ),
                        heightSpace5,
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.copy,
                            size: 16, color: AppColors.greyprimarycolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            heightSpace5,
            Divider(
              thickness: 0.5,
            ),
            heightSpace5,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffECF7F3),
                      child: Icon(
                        Icons.email,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                      radius: 17,
                    ),
                    widthSpace10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: BaseStyles.grey3medium12,
                        ),
                        Text(
                          'raman@gmail.com',
                          style: BaseStyles.blacNormal14,
                        ),
                        heightSpace5,
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.copy,
                            size: 16, color: AppColors.greyprimarycolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//   //////////////////// job name list widget ui////////////////////////////////
  Widget _item() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.clientslist.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.selectname.value =
                              controller.clientslist[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectname.value ==
                                      controller.clientslist[index]['name']
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
                              controller.clientslist[index]['value'] == ""
                                  ? controller.clientslist[index]['name']
                                      .toString()
                                  : "${controller.clientslist[index]['name'].toString()}",
                              style: controller.selectname.value ==
                                      controller.clientslist[index]['name']
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
