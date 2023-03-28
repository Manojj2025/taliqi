import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
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
import '../controllers/candidatesdetail_controller.dart';
import 'addcertifications_view.dart';
import 'addeducation_view.dart';
import 'addemployment_view.dart';
import 'candidateAddedView.dart';
import 'description.dart';

class CandidateNewTaskView extends GetView<CandidatesdetailController> {
  const CandidateNewTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CandidatesdetailController());
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
                      ? 'Add Candidate'
                      : controller.index.value == 1
                          ? 'Employment History'
                          : controller.index.value == 2
                              ? 'Education History'
                              : controller.index.value == 3
                                  ? 'Certifications History'
                                  : controller.index.value == 4
                                      ? 'Add Skills'
                                      : 'Add 6 Additional Info',
                  style: BaseStyles.whiteMedium16,
                ),
              ),
            ),
            // Container(
            //   height: 55,
            //   color: AppColors.primaryColor,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         InkWell(
            //           onTap: () => Get.back(),
            //           child: Icon(
            //             Icons.arrow_back,
            //             color: AppColors.whiteColor,
            //           ),
            //         ),
            //         widthSpace10,
            //         Obx(
            //           () => Text(
            //             controller.index.value == 0
            //                 ? 'Add Candidate'
            //                 : controller.index.value == 1
            //                     ? 'Employment History'
            //                     : controller.index.value == 2
            //                         ? 'Education History'
            //                         : controller.index.value == 3
            //                             ? 'Certifications History'
            //                             : controller.index.value == 4
            //                                 ? 'Add Skills'
            //                                 : 'Add 6 Additional Info',
            //             style: BaseStyles.whiteMedium16,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                          color: controller.index.value < 1
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
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 0
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '1',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 1
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '2',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                controller.pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 2
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '3',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                controller.pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 3
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '4',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                controller.pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 4
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '5',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: controller.index.value >= 5
                                        ? AppColors.primaryColor
                                        : AppColors.greyprimarycolor.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '6',
                                    style: BaseStyles.whitebold14,
                                  )),
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textwidget(
                                                name: 'Name *', text: 'Enter'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Gender *',
                                                text: 'Select',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Phone *',
                                                  style:
                                                      BaseStyles.grey1Medium14,
                                                ),
                                                heightSpace5,
                                                textfiled(
                                                  prifixshow: true,
                                                  // onchange: () {},
                                                  // controller:
                                                  //     controller,
                                                  maxline: 1,
                                                  // ontap: () {},
                                                  readonly: false,
                                                  text: 'Enter',
                                                  // height: 40.0,
                                                  // minline: 1,
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Email * ',
                                                text: 'Enter',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Total Experience * ',
                                                text: 'Enter',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Notice Period *  ',
                                                text: 'Select',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Current Designation ',
                                                text: 'Enter',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Current Salary',
                                                  style:
                                                      BaseStyles.grey1Medium14,
                                                ),
                                                heightSpace5,
                                                textfiled(
                                                  prifixshow: true,
                                                  prifixtext: 'INR',
                                                  // onchange: () {},
                                                  // controller:
                                                  //     controller,
                                                  maxline: 1,
                                                  // ontap: () {},
                                                  readonly: false,
                                                  text: 'Select',
                                                  // height: 40.0,
                                                  // minline: 1,
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
                                                  'Expected Salary',
                                                  style:
                                                      BaseStyles.grey1Medium14,
                                                ),
                                                heightSpace5,
                                                textfiled(
                                                  prifixshow: true,
                                                  prifixtext: 'INR',
                                                  // onchange: () {},
                                                  // controller:
                                                  //     controller,
                                                  maxline: 1,
                                                  // ontap: () {},
                                                  readonly: false,
                                                  text: 'Select',
                                                  // height: 40.0,
                                                  // minline: 1,
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'DOB',
                                                text: 'Select',
                                                icon: Icons.calendar_month),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Street Name',
                                                text: 'Enter'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'State', text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Country/Region',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'City/District',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Zip Code',
                                                text: 'Enter',
                                                onTap: () {
                                                  // select(context);
                                                }),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget2(
                                                name: 'Source * ',
                                                text: 'Select'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                height: 150.0,
                                                readonly: true,
                                                onTap: () {
                                                  Get.to(DescriptionView());
                                                },
                                                minline: 5,
                                                maxline: 5,
                                                name: 'Summary',
                                                text: 'Write'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            mybuttons(
                                                action: () {
                                                  controller.index.value = 1;
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
                                  ? _twoWidget()
                                  : controller.index.value == 2
                                      ? _threeWidget()
                                      : controller.index.value == 3
                                          ? _fourWidget()
                                          : controller.index.value == 4
                                              ? _fiveWidget(context)
                                              : _SixWidget(context)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Employment',
                                style: BaseStyles.blackMedium14,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // print('kk');
                              Get.to(AddemploymentView());
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
                          itemCount: 1,
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
                                              widthSpace10,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'UI/UX Designer',
                                                        style: BaseStyles
                                                            .blackMedium14,
                                                      ),
                                                    ],
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Tech Mahindra, Gurugram',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Dec 18 - Present . 3 year(s) 8 months',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                controller.index.value = 2;
              },
              name: 'Next',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }

////////////////Education details////////////////////////////////

  _threeWidget() {
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
                              Get.to(AddEducationView());
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Bachelor of Computer Application',
                                                        style: BaseStyles
                                                            .blackMedium14,
                                                      ),
                                                    ],
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'IGNOU',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    '2009',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
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
              ),
            ),
          ),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                controller.index.value = 3;
              },
              name: 'Next',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }

////////////////Certifications details////////////////////////////////

  _fourWidget() {
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
                              Get.to(AddCertificationsView());
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
                          itemCount: 1,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Project Management Professional (PMP)®',
                                                        style: BaseStyles
                                                            .blackMedium14,
                                                      ),
                                                    ],
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Project Management Institute',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Issued Jan 2022 · Expires Jan 2026',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Credential ID 5456484546',
                                                    style: BaseStyles
                                                        .lightblackMedium12,
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

////////////////Certifications details////////////////////////////////

  _fiveWidget(context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Professional Skills',
                              style: BaseStyles.blackMedium14,
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
                                    heightFactor: 0.5,
                                    child: Container(
                                      // height: 300,
                                      decoration:
                                          MyDecoration.radiusonlydecoration(
                                              tlradius: 25.0, trradius: 25.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            heightSpace20,
                                            Align(
                                              child: Container(
                                                height: 4,
                                                width: 160,
                                                decoration: MyDecoration
                                                    .simpledecoration(
                                                        color: AppColors
                                                            .greyprimarycolor),
                                              ),
                                            ),
                                            heightSpace20,
                                            Align(
                                              child: Text(
                                                JobsName.addprofessional,
                                                style: BaseStyles.blackMedium14,
                                              ),
                                            ),
                                            heightSpace10,
                                            heightSpace5,
                                            textwidget(
                                                name: 'Professional Skills*',
                                                text: 'Enter'),
                                            heightSpace30,
                                            Text(
                                              "Rate Skills*",
                                              style: BaseStyles.grey1Medium14,
                                            ),
                                            heightSpace5,
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              unratedColor: AppColors
                                                  .greyprimarycolor.shade300,
                                              itemSize: 30.0,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            heightSpace10,
                                            Divider(
                                              thickness: 0.5,
                                            ),
                                            heightSpace5,
                                            Expanded(child: Container()),
                                            mybuttons(
                                                // style:
                                                //     BaseStyles.grey2medium16,
                                                name: 'Add',
                                                color: AppColors.orangecolor,
                                                height: 45.0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
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
                        itemCount: 1,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'php',
                                              style: BaseStyles.blacNormal14,
                                            ),
                                            widthSpace5,
                                            RatingBarIndicator(
                                              rating: 4.0,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 15.0,
                                              unratedColor: AppColors
                                                  .greyprimarycolor.shade300,
                                              direction: Axis.horizontal,
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
            ),
          ),
          heightSpace10,
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Soft Skills',
                                style: BaseStyles.blackMedium14,
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
                                      heightFactor: 0.5,
                                      child: Container(
                                        // height: 300,
                                        decoration:
                                            MyDecoration.radiusonlydecoration(
                                                tlradius: 25.0, trradius: 25.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              heightSpace20,
                                              Align(
                                                child: Container(
                                                  height: 4,
                                                  width: 160,
                                                  decoration: MyDecoration
                                                      .simpledecoration(
                                                          color: AppColors
                                                              .greyprimarycolor),
                                                ),
                                              ),
                                              heightSpace20,
                                              Align(
                                                child: Text(
                                                  'Add Soft Skills',
                                                  style:
                                                      BaseStyles.blackMedium14,
                                                ),
                                              ),
                                              heightSpace10,
                                              heightSpace5,
                                              textwidget(
                                                  name: 'Soft Skills*',
                                                  text: 'Enter'),
                                              heightSpace30,
                                              Text(
                                                "Rate Skills*",
                                                style: BaseStyles.grey1Medium14,
                                              ),
                                              heightSpace5,
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                unratedColor: AppColors
                                                    .greyprimarycolor.shade300,
                                                itemSize: 30.0,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              heightSpace10,
                                              Divider(
                                                thickness: 0.5,
                                              ),
                                              heightSpace5,
                                              Expanded(child: Container()),
                                              mybuttons(
                                                  // style:
                                                  //     BaseStyles.grey2medium16,
                                                  name: 'Add',
                                                  color: AppColors.orangecolor,
                                                  height: 45.0)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
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
                          itemCount: 1,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Communications',
                                                style: BaseStyles.blacNormal14,
                                              ),
                                              widthSpace5,
                                              RatingBarIndicator(
                                                rating: 4.0,
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 15.0,
                                                unratedColor: AppColors
                                                    .greyprimarycolor.shade300,
                                                direction: Axis.horizontal,
                                              ),
                                            ],
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
              ),
            ),
          ),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                controller.index.value = 5;
              },
              name: 'Next',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }

  //////////////////// job list widget ui////////////////////////////////
  _SixWidget(context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              padding: EdgeInsetsDirectional.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Upload Docoments',
                              style: BaseStyles.blackMedium14,
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
                                    heightFactor: 0.8,
                                    child: Container(
                                      // height: 300,
                                      decoration:
                                          MyDecoration.radiusonlydecoration(
                                              tlradius: 25.0, trradius: 25.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            heightSpace20,
                                            Align(
                                              child: Container(
                                                height: 4,
                                                width: 160,
                                                decoration: MyDecoration
                                                    .simpledecoration(
                                                        color: AppColors
                                                            .greyprimarycolor),
                                              ),
                                            ),
                                            heightSpace20,
                                            Align(
                                              child: Text(
                                                'Upload Docoments',
                                                style: BaseStyles.blackMedium16,
                                              ),
                                            ),
                                            // heightSpace10,
                                            // const Divider(
                                            //   thickness: 0.3,
                                            //   height: 25,
                                            // ),
                                            Image.asset(
                                              'assets/image/i2.png',
                                              width: Get.width,
                                              height: 100,
                                            ),
                                            Text(
                                              'Resume.pdf',
                                              style: BaseStyles.grey1normal12,
                                            ),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                name: 'Title* * ',
                                                text: 'Enter'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            textwidget(
                                                height: 150.0,
                                                readonly: false,
                                                onTap: () {},
                                                minline: 5,
                                                maxline: 5,
                                                name: 'Summary * ',
                                                text: 'Write'),
                                            const Divider(
                                              thickness: 0.3,
                                              height: 25,
                                            ),
                                            heightSpace30,
                                            mybuttons(
                                                action: () {
                                                  Get.back();
                                                },
                                                name: 'Upload',
                                                radius: 5.0,
                                                color: AppColors.orangecolor,
                                                height: 45.0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
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
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  // padding: EdgeInsets.all(8.0),
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
                                                    style: BaseStyles
                                                        .blackMedium14,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Reference site information on its origins',
                                                    style:
                                                        BaseStyles.blacNormal14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {},
                                                child: Image.asset(
                                                  MyImages.edit,
                                                  height: 15,
                                                  width: 15,
                                                )),
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
                ),
              ),
            ),
          ),
          mybuttons(
              width: Get.width * 0.95,
              action: () {
                Get.to(CandidateAddedView());
              },
              name: 'Save Candidate',
              color: AppColors.orangecolor,
              height: 40.0)
        ],
      ),
    );
  }
}
