import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:taliqi/app/modules/jobs_screens/controllers/createnewjob_controller.dart';
import 'package:taliqi/app/modules/jobs_screens/views/selectclient_view.dart';
import 'package:taliqi/app/widgets/buttons.dart';
import 'package:taliqi/app/widgets/textfiled.dart';
import 'package:timelines/timelines.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/filters.dart';
import '../../../widgets/jobdetailwidget.dart';
import 'jobdescription_view.dart';
import 'jobpost_view.dart';

class JobformView extends GetView<CreatenewjobController> {
  const JobformView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreatenewjobController());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(children: [
            AppBar(
              elevation: 0,
              leadingWidth: 30,
              toolbarHeight: 55,
              title: Obx(
                () => Text(
                  controller.index.value == 0
                      ? JobsName.jobdetail
                      : controller.index.value == 1
                          ? 'Job Description'
                          : controller.index.value == 2
                              ? 'Skills'
                              : 'Preview',
                  style: BaseStyles.whiteMedium16,
                ),
              ),
            ),
            Container(
              color: AppColors.primaryColor3,
              height: 45,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: 25,
                          color: controller.index.value < 3
                              ? AppColors.greyprimarycolor.withOpacity(0.6)
                              : AppColors.whiteColor,
                        ),
                        Expanded(
                          child: TimelineNode(
                            direction: Axis.horizontal,
                            indicator: InkWell(
                              onTap: () {
                                controller.pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: controller.index.value >= 0
                                      ? AppColors.primaryColor
                                      : AppColors.greyprimarycolor.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  MyImages.form,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            endConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                          ),
                        ),
                        Expanded(
                          child: TimelineNode(
                            direction: Axis.horizontal,
                            indicator: InkWell(
                              onTap: () {
                                controller.pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: controller.index.value >= 1
                                      ? AppColors.primaryColor
                                      : AppColors.greyprimarycolor.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  MyImages.file,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            startConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                            endConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                          ),
                        ),
                        Expanded(
                          child: TimelineNode(
                            direction: Axis.horizontal,
                            indicator: InkWell(
                              onTap: () {
                                controller.pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: controller.index.value >= 2
                                      ? AppColors.primaryColor
                                      : AppColors.greyprimarycolor.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  MyImages.on,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            startConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                            endConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                          ),
                        ),
                        Expanded(
                          child: TimelineNode(
                            direction: Axis.horizontal,
                            indicator: InkWell(
                              onTap: () {
                                controller.pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: controller.index.value >= 3
                                      ? AppColors.primaryColor
                                      : AppColors.greyprimarycolor.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  MyImages.eye,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            startConnector: SolidLineConnector(
                                // thickness: 3,
                                color: AppColors.greyprimarycolor.shade300),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.whiteColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            controller.index.value = index;
          },
          children: [
            Obx(() => Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Job Role',
                                    style: BaseStyles.grey2Medium12,
                                  ),
                                  heightSpace5,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            // backgroundColor: AppColors.primaryColor,
                                            radius: 16,
                                            child: Image.asset(
                                                'assets/image/bajaj.png'),
                                          ),
                                          widthSpace5,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Php Developer',
                                                    style: BaseStyles
                                                        .blackMedium14,
                                                  ),
                                                ],
                                              ),
                                              heightSpace3,
                                              Text(
                                                'Bajaj Ltd.Noida',
                                                style: BaseStyles.grey2normal14,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(SelectclientView());
                                        },
                                        child: Image.asset(
                                          MyImages.edit,
                                          height: 20,
                                          width: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  heightSpace5,
                                  controller.index.value == 3
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color:
                                                      AppColors.lightblackColor,
                                                  size: 18,
                                                ),
                                                widthSpace3,
                                                Text(
                                                  'New Delhi',
                                                  style: BaseStyles
                                                      .lightblackMedium14,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      AppColors.activecolor,
                                                ),
                                                widthSpace5,
                                                Text(
                                                  'Active',
                                                  style:
                                                      BaseStyles.greyMedium14,
                                                ),
                                                widthSpace5,
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: AppColors
                                                      .greyprimarycolor,
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          heightSpace10,
                          controller.index.value == 0
                              ? Expanded(
                                  child: Container(
                                    width: Get.width,
                                    color: AppColors.whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textwidget(
                                                name: 'Job ID',
                                                text: '0984923842347398734'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Opportunity Name',
                                                text: 'Enter'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Department *',
                                                text: 'Select',
                                                onTap: () {
                                                  select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Country *',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'State *',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Location *",
                                                  style:
                                                      BaseStyles.grey1Medium14,
                                                ),
                                                heightSpace5,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // singlefiled(
                                                    //     style: BaseStyles
                                                    //         .blacNormal14,
                                                    //     name: 'Off Site',
                                                    //     color: AppColors
                                                    //         .greyprimarycolor
                                                    //         .shade300),
                                                    // widthSpace5,
                                                    Expanded(
                                                      child: singlefiled(
                                                          name: 'Select'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Experience (In Years) *",
                                                  style:
                                                      BaseStyles.grey1Medium14,
                                                ),
                                                heightSpace5,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: singlefiled(
                                                        name: 'From',
                                                      ),
                                                    ),
                                                    widthSpace10,
                                                    Expanded(
                                                      child: singlefiled(
                                                          name: 'To'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Job Type *',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'No. of Openings *',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Placement Currency*',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Placement Type*',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Placement Value*',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Division',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "CTC per Annum *",
                                                      style: BaseStyles
                                                          .grey1Medium14,
                                                    ),
                                                    singlefiled(
                                                        height: 25.0,
                                                        name: 'Currency',
                                                        color: AppColors
                                                            .greyprimarycolor
                                                            .shade300,
                                                        style: BaseStyles
                                                            .blacNormal14),
                                                  ],
                                                ),
                                                heightSpace5,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: singlefiled(
                                                        name: 'From',
                                                      ),
                                                    ),
                                                    widthSpace10,
                                                    Expanded(
                                                      child: singlefiled(
                                                          name: 'To'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: AppColors.whiteColor,
                                                    size: 12,
                                                  ),
                                                ),
                                                widthSpace5,
                                                Text(
                                                  'Add due date',
                                                  style:
                                                      BaseStyles.blacNormal14,
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                icon: Icons
                                                    .calendar_today_outlined,
                                                name: 'Select due date & time*',
                                                text: 'Select'),
                                            heightSpace50,
                                            heightSpace30,
                                            mybuttons(
                                                action: () {
                                                  controller.index.value = 1;
                                                  print('object');
                                                },
                                                name: 'Next',
                                                color: AppColors.orangecolor,
                                                height: 40.0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : controller.index.value == 1
                                  ? Expanded(
                                      child: Container(
                                        // height: Get.height * 0.75,
                                        width: Get.width,
                                        color: AppColors.whiteColor,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 10.0),
                                          child: Column(
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    textwidget(
                                                        height: 150.0,
                                                        controller: controller
                                                            .descriptionstext,
                                                        readonly: true,
                                                        onTap: () {
                                                          Get.to(
                                                              JobdescriptionView());
                                                        },
                                                        minline: 8,
                                                        maxline: 8,
                                                        name:
                                                            'Job Description*',
                                                        text: 'Enter'),
                                                    const Divider(
                                                      thickness: 0.3,
                                                      height: 25,
                                                    ),
                                                    textwidget2(
                                                        name:
                                                            'Minimum Qualification',
                                                        text: 'Select'),
                                                    const Divider(
                                                      thickness: 0.3,
                                                      height: 25,
                                                    ),
                                                    textwidget(
                                                        name: 'Specialization',
                                                        text: 'Enter'),
                                                  ],
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              mybuttons(
                                                  action: () {
                                                    controller.index.value = 2;
                                                    print('object');
                                                  },
                                                  name: 'Next',
                                                  color: AppColors.orangecolor,
                                                  height: 40.0)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : controller.index.value == 2
                                      ? Expanded(
                                          child: Container(
                                            width: Get.width,
                                            color: AppColors.whiteColor,
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 10.0),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      width: Get.width,
                                                      color:
                                                          AppColors.whiteColor,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'The total weightage should be 100.',
                                                            style: BaseStyles
                                                                .blacNormal12,
                                                          ),
                                                          heightSpace5,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              LinearPercentIndicator(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  alignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  width:
                                                                      Get.width *
                                                                          0.80,
                                                                  lineHeight:
                                                                      6.0,
                                                                  percent: 0.5,
                                                                  animation:
                                                                      true,
                                                                  barRadius:
                                                                      const Radius
                                                                              .circular(
                                                                          20),
                                                                  // center:
                                                                  //     Text("50.0%", style: BaseStyles.whitebold14),
                                                                  // trailing: Icon(Icons.mood),

                                                                  backgroundColor: AppColors
                                                                      .greyprimarycolor
                                                                      .withOpacity(
                                                                          0.6),
                                                                  progressColor:
                                                                      AppColors
                                                                          .primaryColor),
                                                              Text(
                                                                '0/100',
                                                                style: BaseStyles
                                                                    .lightblackMedium14,
                                                              )
                                                            ],
                                                          ),
                                                          heightSpace10,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Professional Skills',
                                                                style: BaseStyles
                                                                    .blackMedium14,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  skillswidget(
                                                                      context,
                                                                      controller);
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons.add,
                                                                      color: AppColors
                                                                          .orangecolor,
                                                                      size: 18,
                                                                    ),
                                                                    Text(
                                                                      'Add More',
                                                                      style: BaseStyles
                                                                          .orangeMedium14,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          _listskillWidget(),
                                                        ],
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      width: Get.width,
                                                      color:
                                                          AppColors.whiteColor,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'The total weightage should be 100.',
                                                            style: BaseStyles
                                                                .blacNormal12,
                                                          ),
                                                          heightSpace5,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              LinearPercentIndicator(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  alignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  width:
                                                                      Get.width *
                                                                          0.80,
                                                                  lineHeight:
                                                                      6.0,
                                                                  percent: 0.5,
                                                                  animation:
                                                                      true,
                                                                  barRadius:
                                                                      const Radius
                                                                              .circular(
                                                                          20),
                                                                  // center:
                                                                  //     Text("50.0%", style: BaseStyles.whitebold14),
                                                                  // trailing: Icon(Icons.mood),

                                                                  backgroundColor: AppColors
                                                                      .greyprimarycolor
                                                                      .withOpacity(
                                                                          0.6),
                                                                  progressColor:
                                                                      AppColors
                                                                          .primaryColor),
                                                              Text(
                                                                '0/100',
                                                                style: BaseStyles
                                                                    .lightblackMedium14,
                                                              )
                                                            ],
                                                          ),
                                                          heightSpace10,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Soft Skills',
                                                                style: BaseStyles
                                                                    .blackMedium14,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.add,
                                                                    color: AppColors
                                                                        .orangecolor,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    'Add',
                                                                    style: BaseStyles
                                                                        .orangeMedium14,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          // Expanded(
                                                          //     child:
                                                          //         Container()),

                                                          // _listskillWidget()
                                                        ],
                                                      )),
                                                ),
                                                Expanded(child: Container()),
                                                mybuttons(
                                                    action: () {
                                                      controller.index.value =
                                                          3;
                                                      print('object');
                                                    },
                                                    name: 'Next',
                                                    color:
                                                        AppColors.orangecolor,
                                                    height: 40.0)
                                              ],
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      jobDetails(),
                                                      heightSpace10,
                                                      jobDescription(),
                                                      heightSpace10,
                                                      jobprofessional(
                                                          controller),
                                                      heightSpace10,
                                                      jobsoftprofessional(
                                                          controller),
                                                      heightSpace10,
                                                      jobprofile(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10.0)),
                                                      heightSpace10,
                                                      Container(
                                                        height: 215,
                                                        width: Get.width,
                                                        color: AppColors
                                                            .whiteColor,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 10.0,
                                                                  top: 10.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Similar Profiles',
                                                                style: BaseStyles
                                                                    .blackMedium14,
                                                              ),
                                                              heightSpace10,
                                                              Align(
                                                                child:
                                                                    CircularPercentIndicator(
                                                                  radius: 55.0,
                                                                  lineWidth:
                                                                      5.0,
                                                                  percent: 0.5,
                                                                  center:
                                                                      Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "245",
                                                                        style: BaseStyles
                                                                            .blackMedium24,
                                                                      ),
                                                                      Text(
                                                                        "Applicants found",
                                                                        style: BaseStyles
                                                                            .grey3Normal12,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  progressColor:
                                                                      AppColors
                                                                          .primaryColor,
                                                                ),
                                                              ),
                                                              heightSpace20,
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      mybuttons(
                                                          width:
                                                              Get.width * 0.95,
                                                          action: () {
                                                            Get.to(
                                                                JobpostView());
                                                          },
                                                          name: 'Next',
                                                          color: AppColors
                                                              .orangecolor,
                                                          height: 40.0)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  //////////////////// job skill list widget ui////////////////////////////////
  _listskillWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace10,
              Divider(
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: CircularPercentIndicator(
                          radius: 20.0,
                          lineWidth: 5.0,
                          percent: 0.5,
                          center: Text(
                            "80",
                            style: BaseStyles.blacNormal12,
                          ),
                          progressColor: AppColors.primaryColor,
                        ),
                      ),
                      widthSpace5,
                      Text(
                        'Php',
                        style: BaseStyles.blacNormal14,
                      ),
                      widthSpace10,
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
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(SelectclientView());
                        },
                        child: Image.asset(
                          MyImages.edit,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      widthSpace20,
                      Icon(Icons.close, color: AppColors.greycolor3)
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }

  //////////////select department////////////////////////////////////////////////////////////////

  select(context) {
    return showModalBottomSheet(
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
            heightFactor: 0.5,
            child: Container(
              // height: 300,
              decoration: MyDecoration.radiusonlydecoration(
                  tlradius: 25.0, trradius: 25.0),
              child: Column(
                children: [
                  heightSpace20,
                  Container(
                    height: 4,
                    width: 160,
                    decoration: MyDecoration.simpledecoration(
                        color: AppColors.greyprimarycolor),
                  ),
                  heightSpace20,
                  Text(
                    "Select Department",
                    style: BaseStyles.blackMedium16,
                  ),
                  heightSpace10,
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selected.value = index;
                              },
                              child: ListTile(
                                horizontalTitleGap: 0.0,
                                dense: true,
                                title: Text(
                                  controller.list[index],
                                  style: BaseStyles.blacNormal14,
                                ),
                                leading: Obx(
                                  () => Radio(
                                    activeColor: AppColors.primaryColor,
                                    visualDensity: const VisualDensity(
                                        horizontal: -0.4, vertical: -0.4),
                                    value: controller.selected.value,
                                    groupValue: index,
                                    onChanged: (value) {
                                      controller.selected.value = index;
                                      // if (controller
                                      //         .selected
                                      //         .value ==
                                      //     index) {
                                      //   controller
                                      //           .selectaddressdata =
                                      //       data;
                                      //   showToast('Selected');
                                      //   // controller.box.write('addresstype',
                                      //   //     controller.selectaddressdata!.type);
                                      //   print(controller
                                      //       .selectaddressdata);
                                      // } else {
                                      //   // controller.selectaddressdata;
                                      // }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0.5,
                              thickness: 0.3,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
