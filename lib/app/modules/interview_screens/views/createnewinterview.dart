import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:timelines/timelines.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/filters.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../../jobs_screens/views/jobdescription_view.dart';
import '../controllers/createnewinterview_controller.dart';
import 'addquestion_view.dart';
import 'interviewAdded.dart';

class CreatenewinterviewView extends GetView<CreateNewInterviewController> {
  String MIN_DATETIME = '2010-05-12 10:47:00';
  String MAX_DATETIME = '2021-11-25 22:45:10';
  String INIT_DATETIME = '2019-05-17 18:13:15';

  CreatenewinterviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateNewInterviewController());
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
                  controller.interview.value == 'self'
                      ? (controller.index.value == 0
                          ? 'Create New Interview'
                          : controller.index.value == 1
                              ? 'Select a Job'
                              : controller.index.value == 2
                                  ? 'Add Questions'
                                  : controller.index.value == 3
                                      ? 'Settings'
                                      : 'Add Candidates to Interview')
                      : (controller.index.value == 0
                          ? 'Create New Interview'
                          : controller.index.value == 1
                              ? 'Select a Job'
                              : controller.index.value == 2
                                  ? 'Settings'
                                  : 'Add Candidates to Interview'),
                  style: BaseStyles.whiteMedium16,
                ),
              ),
            ),
            Container(
              color: AppColors.primaryColor3,
              height: 45,
              child: Obx(
                () => Column(
                  children: [
                    controller.interview.value == 'self'
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_sharp,
                                    size: 25,
                                    color: controller.index.value < 1
                                        ? AppColors.greyprimarycolor
                                            .withOpacity(0.6)
                                        : AppColors.whiteColor,
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 0
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '1',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 1
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '2',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 2
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '3',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 3
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '4',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(2,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 4
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '5',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
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
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_sharp,
                                    size: 25,
                                    color: controller.index.value < 1
                                        ? AppColors.greyprimarycolor
                                            .withOpacity(0.6)
                                        : AppColors.whiteColor,
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 0
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '1',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 1
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '2',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 2
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '3',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                      endConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineNode(
                                      direction: Axis.horizontal,
                                      indicator: InkWell(
                                        onTap: () {
                                          controller.pageController
                                              .animateToPage(2,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(13),
                                            decoration: BoxDecoration(
                                              color: controller.index.value >= 3
                                                  ? AppColors.primaryColor
                                                  : AppColors.greyprimarycolor
                                                      .shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '4',
                                              style: BaseStyles.whitebold14,
                                            )),
                                      ),
                                      startConnector: SolidLineConnector(
                                          // thickness: 3,
                                          color: AppColors
                                              .greyprimarycolor.shade300),
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
                          // heightSpace10,
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Select a Interview Type',
                                            style: BaseStyles.blackMedium14,
                                          ),
                                          heightSpace10,
                                          InkWell(
                                            onTap: () {
                                              controller.interview.value =
                                                  'self';
                                              controller.index.value = 1;
                                            },
                                            child: Container(
                                              decoration: decorationbox(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyprimarycolor
                                                          .shade200),
                                                  radius: 5.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: 65,
                                                        width: 65,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            colors: [
                                                              Color(0xff3DB389),
                                                              Color(0xff3FDBA3)
                                                            ],
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Image.asset(
                                                            'assets/image/user.png',
                                                            height: 50,
                                                            width: 50,
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                        )),
                                                    widthSpace20,
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Self Interview',
                                                            style: BaseStyles
                                                                .blackMedium14,
                                                          ),
                                                          Text(
                                                            'Invite candidates to record video responses to your interview questions on their own time',
                                                            style: BaseStyles
                                                                .grey2normal12,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 1,
                                                  color: AppColors
                                                      .greyprimarycolor
                                                      .shade200,
                                                  width: Get.width * 0.42,
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                    Color(0xffBDBDBD),
                                                child: Text(
                                                  'Or',
                                                  style:
                                                      BaseStyles.whitenormal12,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 1,
                                                  color: AppColors
                                                      .greyprimarycolor
                                                      .shade200,
                                                  width: Get.width * 0.42,
                                                ),
                                              ),
                                            ],
                                          ),
                                          heightSpace10,
                                          InkWell(
                                            onTap: () {
                                              controller.interview.value =
                                                  'live';
                                              controller.index.value = 1;
                                            },
                                            child: Container(
                                              decoration: decorationbox(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyprimarycolor
                                                          .shade200),
                                                  radius: 5.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: 65,
                                                        width: 65,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            colors: [
                                                              Color(0xff3DB389),
                                                              Color(0xff3FDBA3)
                                                            ],
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Image.asset(
                                                            'assets/image/liveinterview.png',
                                                            height: 50,
                                                            width: 50,
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                        )),
                                                    widthSpace20,
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Live Interview',
                                                            style: BaseStyles
                                                                .blackMedium14,
                                                          ),
                                                          Text(
                                                            'Invite a candidate to connect for a live F2F interview',
                                                            style: BaseStyles
                                                                .grey2normal12,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : controller.interview.value == 'self'
                                  ? (controller.index.value == 1
                                      ? _twoWidget()
                                      : controller.index.value == 2
                                          ? _threeWidget()
                                          : controller.index.value == 3
                                              ? _fourWidget(context)
                                              : _fiveWidget(context))
                                  : (controller.index.value == 1
                                      ? _twoWidget()
                                      : controller.index.value == 2
                                          ? _fourWidget(context)
                                          : _fiveWidget(context))
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  //////////////2////////////////////////////////////////////////////////////////

  _twoWidget() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                        'Select a Job',
                                        style: BaseStyles.blackMedium14,
                                      )
                                    ],
                                  ),
                            Row(
                              children: [
                                controller.showseach.value != true
                                    ? IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(
                                            minWidth: 0, minHeight: 0),
                                        onPressed: () {
                                          controller.showseach.value = true;
                                        },
                                        icon: Icon(
                                          Icons.search,
                                          size: 20,
                                          color: AppColors.greyprimarycolor,
                                        ))
                                    : Container(),
                                widthSpace10
                              ],
                            ),
                            // widthSpace10
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heightSpace10,
                                InkWell(
                                  onTap: () {
                                    controller.index.value = 2;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3.0),
                                    color: AppColors.whiteColor,
                                    child: Column(
                                      children: [
                                        Divider(
                                          thickness: 0.5,
                                          height: 0.5,
                                        ),
                                        heightSpace10,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  // backgroundColor: AppColors.primaryColor,
                                                  radius: 18,
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
                                                    heightSpace5,
                                                    Text(
                                                      'Tech Mahindra',
                                                      style: BaseStyles
                                                          .grey2Medium12,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // heightSpace10,
                                        heightSpace5,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: AppColors.greycolor2,
                                                  size: 16,
                                                ),
                                                widthSpace3,
                                                Text(
                                                  'New Delhi',
                                                  style:
                                                      BaseStyles.grey2Medium12,
                                                )
                                              ],
                                            ),
                                            widthSpace10,
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: AppColors.greycolor2,
                                                  size: 16,
                                                ),
                                                widthSpace3,
                                                Text(
                                                  '21 Aug',
                                                  style:
                                                      BaseStyles.grey2Medium12,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // heightSpace10
                              ],
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

////////////////Education details////////////////////////////////

  _threeWidget() {
    return Expanded(
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: controller.videoShow.value
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.index.value = 3;
                                },
                                child: Container(
                                  decoration: decorationbox(
                                      border: Border.all(
                                          color: AppColors
                                              .greyprimarycolor.shade200),
                                      radius: 5.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.orangecolor,
                                          size: 16,
                                        ),
                                        // widthSpace20,
                                        widthSpace3,
                                        Text(
                                          'Add Questions',
                                          style: BaseStyles.orangeMedium14,
                                        ),
                                        // widthSpace10,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              heightSpace10,
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: decorationbox(
                                              color: AppColors.whiteColor,
                                              border: Border.all(
                                                  color: AppColors
                                                      .greyprimarycolor
                                                      .shade200)),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    heightSpace10,
                                                    heightSpace5,
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Please introduce yourself',
                                                          style: BaseStyles
                                                              .blacNormal14,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              // skillswidget(
                                                              //     context, controller);
                                                            },
                                                            child: Image.asset(
                                                              MyImages.edit,
                                                              height: 16,
                                                              width: 16,
                                                            )),
                                                      ],
                                                    ),
                                                    heightSpace10,
                                                    Row(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/i2.png',
                                                                width: 50,
                                                                height: 30,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child:
                                                                    Container(
                                                              color: AppColors
                                                                  .blackColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              child: Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                size: 25,
                                                                color: AppColors
                                                                    .whiteColor,
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                        widthSpace5,
                                                        Text(
                                                          'question_2.mp4',
                                                          style: BaseStyles
                                                              .grey2normal12,
                                                        )
                                                      ],
                                                    ),
                                                    heightSpace5,
                                                    Divider(),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .question_mark,
                                                              size: 18,
                                                              color: AppColors
                                                                  .greycolor3,
                                                            ),
                                                            widthSpace5,
                                                            ImageIcon(
                                                              AssetImage(
                                                                "assets/image/infi.png",
                                                              ),
                                                              color: AppColors
                                                                  .greycolor3,
                                                              size: 15,
                                                            )
                                                          ],
                                                        ),
                                                        widthSpace20,
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .refresh_rounded,
                                                              size: 18,
                                                              color: AppColors
                                                                  .greycolor3,
                                                            ),
                                                            widthSpace5,
                                                            ImageIcon(
                                                              AssetImage(
                                                                "assets/image/infi.png",
                                                              ),
                                                              color: AppColors
                                                                  .greycolor3,
                                                              size: 15,
                                                            )
                                                          ],
                                                        ),
                                                        widthSpace20,
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.alarm_sharp,
                                                              size: 18,
                                                              color: AppColors
                                                                  .greycolor3,
                                                            ),
                                                            widthSpace5,
                                                            Text(
                                                              '1 min',
                                                              style: BaseStyles
                                                                  .grey3Normal14,
                                                            )
                                                          ],
                                                        ),
                                                        widthSpace20,
                                                        Icon(
                                                          Icons
                                                              .videocam_outlined,
                                                          size: 18,
                                                          color: AppColors
                                                              .greycolor3,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  decoration: MyDecoration
                                                      .radiusonlydecoration(
                                                          tlradius: 5.0,
                                                          color: AppColors
                                                              .greycolor3),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 13.0,
                                                        vertical: 3),
                                                    child: Text(
                                                      'Question 1',
                                                      style: BaseStyles
                                                          .whitenormal12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        heightSpace10
                                      ],
                                    );
                                  }),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              heightSpace50,
                              heightSpace50,
                              Text(
                                'Add Questions',
                                style: BaseStyles.blackMedium16,
                              ),
                              heightSpace5,
                              Text(
                                'Invite candidates to record video responses to your interview questions on their own time',
                                style: BaseStyles.grey2normal12,
                                textAlign: TextAlign.center,
                              ),
                              heightSpace10,
                              InkWell(
                                onTap: () {
                                  Get.to(AddquestionView());
                                },
                                child: Container(
                                  decoration: decorationbox(
                                      border: Border.all(
                                          color: AppColors
                                              .greyprimarycolor.shade200),
                                      radius: 5.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.orangecolor,
                                          size: 16,
                                        ),
                                        // widthSpace20,
                                        widthSpace3,
                                        Text(
                                          'Add Questions',
                                          style: BaseStyles.orangeMedium14,
                                        ),
                                        // widthSpace10,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Divider(),
            mybuttons(
                style: !controller.videoShow.value
                    ? BaseStyles.blackMedium16
                    : null,
                width: Get.width * 0.95,
                action: () {
                  controller.index.value = 3;
                },
                name: 'Next',
                color: !controller.videoShow.value
                    ? AppColors.greyprimarycolor.shade100
                    : AppColors.orangecolor,
                height: 40.0)
          ],
        ),
      ),
    );
  }

////////////////Certifications details////////////////////////////////

  _fourWidget(context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                                    'Settings',
                                    style: BaseStyles.blackMedium14,
                                  )
                                ],
                              ),
                            ],
                          ),
                          heightSpace10,
                          Divider(
                            thickness: 0.5,
                          ),
                          heightSpace10,
                          textwidget(name: 'Interview Title', text: 'Enter'),
                          const Divider(
                            thickness: 0.3,
                            height: 25,
                          ),
                          controller.interview.value == 'self'
                              ? textwidget2(
                                  name: 'Select Due Date & Time *',
                                  text: 'Select',
                                  icon: Icons.calendar_today_outlined)
                              : Container(),
                          controller.interview.value == 'self'
                              ? Divider(
                                  thickness: 0.3,
                                  height: 25,
                                )
                              : Container(),
                          textwidget2(
                            name: 'Select brand',
                            text: 'Select',
                          ),
                          const Divider(
                            thickness: 0.3,
                            height: 25,
                          ),
                          textwidget2(
                            name: 'Get feedback from candidates *',
                            text: 'Select',
                          ),
                          const Divider(
                            thickness: 0.3,
                            height: 25,
                          ),
                          Row(
                            children: [
                              Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor:
                                          AppColors.greyprimarycolor),
                                  child: SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        splashRadius: 5.0,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        activeColor: AppColors.primaryColor,
                                        // checkColor: AppColors.secondary2Color,
                                        value: false,
                                        onChanged: (value) {
                                          // controller.agree.value = value ?? false;
                                        },
                                      ))),
                              widthSpace5,
                              Expanded(
                                  child: Text(
                                'Create Open Interview Link',
                                style: BaseStyles.blacNormal14,
                              ))
                            ],
                          ),
                          heightSpace10,
                          controller.interview.value != 'self'
                              ? Row(
                                  children: [
                                    Theme(
                                        data: Theme.of(context).copyWith(
                                            unselectedWidgetColor:
                                                AppColors.greyprimarycolor),
                                        child: SizedBox(
                                            height: 20.0,
                                            width: 20.0,
                                            child: Checkbox(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              splashRadius: 5.0,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor:
                                                  AppColors.primaryColor,
                                              // checkColor: AppColors.secondary2Color,
                                              value: false,
                                              onChanged: (value) {
                                                // controller.agree.value = value ?? false;
                                              },
                                            ))),
                                    widthSpace5,
                                    Expanded(
                                        child: Text(
                                      'Remind before Interview',
                                      style: BaseStyles.blacNormal14,
                                    ))
                                  ],
                                )
                              : Container(),
                          controller.interview.value != 'self'
                              ? Divider(
                                  thickness: 0.3,
                                  height: 25,
                                )
                              : Container(),
                          controller.interview.value != 'self'
                              ? textwidget2(
                                  name: 'Select Date & Time *',
                                  text: 'Select',
                                  icon: Icons.calendar_today_outlined)
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  controller.interview.value != 'self'
                      ? heightSpace10
                      : Container(),
                  controller.interview.value != 'self'
                      ? Container(
                          width: Get.width,
                          color: AppColors.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Set Available Time Slots',
                                  style: BaseStyles.blackMedium14,
                                ),
                                heightSpace5,
                                Text(
                                  'This is where you specify the days and times you will be available for meetings',
                                  style: BaseStyles.grey3Normal12,
                                ),
                                Divider(
                                  thickness: 0.3,
                                  height: 25,
                                ),
                                Text(
                                  'Fri Dec 09 2022',
                                  style: BaseStyles.blackMedium14,
                                ),
                                heightSpace5,
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 5,
                                  children: [
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: List.generate(
                                            1,
                                            (index) => Container(
                                                  height: 33,
                                                  decoration: decorationbox(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .greyprimarycolor
                                                              .shade200),
                                                      radius: 5.0),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        '10:00 AM (30 mins)',
                                                        style: BaseStyles
                                                            .blacNormal14,
                                                      )),
                                                ))),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            isDismissible: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(25.0),
                                              ),
                                            ),
                                            builder: (context) {
                                              return FractionallySizedBox(
                                                heightFactor: 0.43,
                                                child: Container(
                                                  // height: 300,
                                                  decoration: MyDecoration
                                                      .radiusonlydecoration(
                                                          tlradius: 25.0,
                                                          trradius: 25.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
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
                                                          'Add Time Block',
                                                          style: BaseStyles
                                                              .blackMedium14,
                                                        ),
                                                        textwidget2(
                                                            icon: Icons
                                                                .alarm_sharp,
                                                            width: Get.width,
                                                            name:
                                                                'Select From Time *',
                                                            text: 'Select'),
                                                        heightSpace10,
                                                        textwidget2(
                                                            onTap: () {
                                                              Get.back();
                                                              TimePicker(
                                                                  context);
                                                            },
                                                            width: Get.width,
                                                            name:
                                                                'Select Interview Slot *',
                                                            text: 'Select'),
                                                        heightSpace10,
                                                        Row(
                                                          children: [
                                                            Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                        unselectedWidgetColor:
                                                                            AppColors
                                                                                .greyprimarycolor),
                                                                child: SizedBox(
                                                                    height:
                                                                        20.0,
                                                                    width: 20.0,
                                                                    child:
                                                                        Checkbox(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      splashRadius:
                                                                          5.0,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      activeColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      // checkColor: AppColors.secondary2Color,
                                                                      value:
                                                                          false,
                                                                      onChanged:
                                                                          (value) {
                                                                        // controller.agree.value = value ?? false;
                                                                      },
                                                                    ))),
                                                            widthSpace5,
                                                            Expanded(
                                                                child: Text(
                                                              'Add this time slot for all dates',
                                                              style: BaseStyles
                                                                  .blacNormal14,
                                                            ))
                                                          ],
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: mybuttons(
                                                                  style: BaseStyles
                                                                      .grey2normal14,
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .greyprimarycolor
                                                                          .shade200),
                                                                  action: () {
                                                                    // Get.to(LeadAddedView());
                                                                    // controller
                                                                    //     .index
                                                                    //     .value = ;
                                                                    print(
                                                                        'object');
                                                                  },
                                                                  name:
                                                                      'Cancel',
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  height: 45.0),
                                                            ),
                                                            widthSpace10,
                                                            Expanded(
                                                                child: mybuttons(
                                                                    color: AppColors
                                                                        .orangecolor,
                                                                    name: 'Add',
                                                                    height:
                                                                        45.0))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        height: 33,
                                        width: 100,
                                        decoration: decorationbox(
                                            border: Border.all(
                                                color: AppColors
                                                    .greyprimarycolor.shade200),
                                            radius: 5.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: AppColors.orangecolor,
                                                size: 16,
                                              ),
                                              // widthSpace20,
                                              widthSpace3,
                                              Text(
                                                'Add Block',
                                                style:
                                                    BaseStyles.orangeMedium14,
                                              ),
                                              // widthSpace10,
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  thickness: 0.3,
                                  height: 25,
                                ),
                                Text(
                                  'Sat Dec 10 2022',
                                  style: BaseStyles.blackMedium14,
                                ),
                                heightSpace5,
                                Wrap(
                                  spacing: 5,
                                  runSpacing: 10,
                                  children: [
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: List.generate(
                                            1,
                                            (index) => Container(
                                                  height: 33,
                                                  decoration: decorationbox(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .greyprimarycolor
                                                              .shade200),
                                                      radius: 5.0),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        '10:00 AM (30 mins)',
                                                        style: BaseStyles
                                                            .blacNormal14,
                                                      )),
                                                ))),
                                    Container(
                                      width: 100,
                                      height: 33,
                                      decoration: decorationbox(
                                          border: Border.all(
                                              color: AppColors
                                                  .greyprimarycolor.shade200),
                                          radius: 5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: AppColors.orangecolor,
                                              size: 16,
                                            ),
                                            // widthSpace20,
                                            widthSpace3,
                                            Text(
                                              'Add Block',
                                              style: BaseStyles.orangeMedium14,
                                            ),
                                            // widthSpace10,
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  heightSpace10,
                  Container(
                    width: Get.width,
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Assesment Criteria',
                            style: BaseStyles.blackMedium14,
                          ),
                          const Divider(
                            thickness: 0.3,
                            height: 25,
                          ),
                          Text(
                            'Professional Skills',
                            style: BaseStyles.blackMedium14,
                          ),
                          Row(
                            children: [
                              Circularwidget(
                                rate: '70',
                                text: 'Php',
                              ),
                              widthSpace5,
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                unratedColor:
                                    AppColors.greyprimarycolor.shade300,
                                itemSize: 16.0,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.3,
                            height: 25,
                          ),
                          Text(
                            'Soft Skills',
                            style: BaseStyles.blackMedium14,
                          ),
                          Row(
                            children: [
                              Circularwidget(
                                rate: '70',
                                text: 'English',
                              ),
                              widthSpace5,
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                unratedColor:
                                    AppColors.greyprimarycolor.shade300,
                                itemSize: 16.0,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                controller.index.value = 4;
              },
              name: 'Next',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }

  void TimePicker(context) {
    showCupertinoModalPopup(
        barrierDismissible: true,
        context: context,
        builder: (context) => Material(
              child: Container(
                height: 250,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              // setState(() {
                              //   dateSelected = val.toString();
                              // });
                            }),
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: mybuttons(
                                  style: BaseStyles.grey2normal14,
                                  border: Border.all(
                                      color:
                                          AppColors.greyprimarycolor.shade200),
                                  action: () {
                                    // Get.to(LeadAddedView());
                                    // controller
                                    //     .index
                                    //     .value = ;
                                    print('object');
                                  },
                                  name: 'Cancel',
                                  color: AppColors.whiteColor,
                                  height: 45.0),
                            ),
                            widthSpace10,
                            Expanded(
                                child: mybuttons(
                                    action: () {
                                      Get.back();
                                    },
                                    color: AppColors.orangecolor,
                                    name: 'Add',
                                    height: 45.0))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget Circularwidget({rate, text}) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 50,
          child: CircularPercentIndicator(
            animation: true,
            radius: 18.0,
            lineWidth: 3.0,
            percent: 0.8,
            center: Text(
              rate,
              style: BaseStyles.grey2normal12,
            ),
            progressColor: AppColors.primaryColor,
          ),
        ),
        widthSpace5,
        Text(
          text,
          style: BaseStyles.grey2normal12,
        )
      ],
    );
  }
////////////////Certifications details////////////////////////////////

  _fiveWidget(context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [_jobrecommaneded(context)],
                  ),
                ),
              ),
            ),
          ),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                Get.to(InterviewAddedView());
              },
              name: 'Next',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }

  ////////jobrecomm////////////////////////////////

  Widget _jobrecommaneded(context) {
    return Column(
      children: [
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
                          'Recommended Candidates',
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
                            size: 20,
                            color: AppColors.greyprimarycolor,
                          ))
                      : Container(),
                  // widthSpace20,
                ],
              ),
              // widthSpace10
            ],
          ),
        ),
        _listrecomWidget()
      ],
    );
  }

  //////////////////// job application list widget ui////////////////////////////////
  _listrecomWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
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
                            child: Theme(
                                data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        AppColors.greyprimarycolor),
                                child: SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      splashRadius: 5.0,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: AppColors.primaryColor,
                                      // checkColor: AppColors.secondary2Color,
                                      value: false,
                                      onChanged: (value) {
                                        // controller.agree.value = value ?? false;
                                      },
                                    ))),
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
}
