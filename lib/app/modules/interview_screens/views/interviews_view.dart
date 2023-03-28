import 'package:taliqi/app/modules/interview_screens/views/single_play_view.dart';
import 'package:taliqi/app/modules/interview_screens/views/video_player_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/filters.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../controllers/interviews_controller.dart';
import '../videocall_screens/views/videocall2_view.dart';
import '../videocall_screens/views/videocall_view.dart';
import 'interviewdetail_view.dart';

class InterviewsView extends GetView<InterviewsController> {
  const InterviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InterviewsController());
    return Scaffold(
        appBar: myappbar(),
        body: Column(
          children: [
            //// filters and soryby widget ui//////
            Card(
              elevation: 0,
              color: AppColors.whiteColor,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        filter(context, controller);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            MyImages.filter,
                            height: 20,
                            width: 20,
                          ),
                          widthSpace10,
                          Text(
                            JobsName.filters,
                            style: BaseStyles.lightblackMedium14,
                          ),
                          widthSpace5,
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              '2',
                              style: BaseStyles.whitesmall10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: AppColors.greyprimarycolor,
                    ),
                    InkWell(
                      onTap: () {
                        sortby(context: context, controller: controller);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            MyImages.sort,
                            height: 20,
                            width: 20,
                          ),
                          widthSpace10,
                          Text(
                            JobsName.sortby,
                            style: BaseStyles.lightblackMedium14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //////////////////// job name list widget ui////////////////////////////////
            heightSpace10,
            _jobname(), heightSpace10,
            _listWidget()
          ],
        ));
  }

  //////////////////// job name list widget ui////////////////////////////////
  _jobname() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.selectname.value =
                              controller.list[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectname.value ==
                                      controller.list[index]['name']
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
                              "${controller.list[index]['name'].toString()} (${controller.list[index]['value'].toString()})",
                              style: controller.selectname.value ==
                                      controller.list[index]['name']
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

  //////////////////// job list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(InterviewDetailView());
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
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
                                          'Nikita Sharma',
                                          style: BaseStyles.blackMedium16,
                                        ),
                                        // widthSpace5,
                                        // Container(
                                        //   padding: EdgeInsets.symmetric(
                                        //       horizontal: 8, vertical: 3),
                                        //   decoration: decorationbox2(
                                        //       color: AppColors.primaryColor2
                                        //           .withOpacity(0.2),
                                        //       radius: 30.0),
                                        //   child: Text(
                                        //     '6 new',
                                        //     style: BaseStyles.greenMedium11,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    heightSpace5,
                                    Text(
                                      'nikita@gmail.com',
                                      style: BaseStyles.grey2Medium12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                onPressed: () {
                                  jobedit(
                                    ontab: (value) {
                                      switch (value) {
                                        case 3:
                                          Get.back();
                                          showModalBottomSheet(
                                              isDismissible: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              isScrollControlled: true,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(25.0),
                                                ),
                                              ),
                                              builder: (context) {
                                                return FractionallySizedBox(
                                                  heightFactor: 0.50,
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
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Extend Interview',
                                                                style: BaseStyles
                                                                    .blackMedium14,
                                                              ),
                                                              heightSpace3,
                                                              Text(
                                                                'Select a new date and time for the interview',
                                                                style: BaseStyles
                                                                    .grey2normal12,
                                                              )
                                                            ],
                                                          ),
                                                          heightSpace5,
                                                          Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  CircleAvatar(
                                                                    // backgroundColor: AppColors.primaryColor,
                                                                    radius: 20,
                                                                    child: Image
                                                                        .asset(
                                                                            'assets/image/bajaj.png'),
                                                                  ),
                                                                  widthSpace10,
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Nikita Sharma',
                                                                            style:
                                                                                BaseStyles.blackMedium16,
                                                                          ),
                                                                          // widthSpace5,
                                                                          // Container(
                                                                          //   padding: EdgeInsets.symmetric(
                                                                          //       horizontal: 8, vertical: 3),
                                                                          //   decoration: decorationbox2(
                                                                          //       color: AppColors.primaryColor2
                                                                          //           .withOpacity(0.2),
                                                                          //       radius: 30.0),
                                                                          //   child: Text(
                                                                          //     '6 new',
                                                                          //     style: BaseStyles.greenMedium11,
                                                                          //   ),
                                                                          // )
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
                                                          heightSpace10,
                                                          heightSpace5,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    MyImages
                                                                        .bag,
                                                                    color: AppColors
                                                                        .greycolor2,
                                                                    height: 16,
                                                                    width: 16,
                                                                  ),
                                                                  widthSpace5,
                                                                  Text(
                                                                    'Accountant',
                                                                    style: BaseStyles
                                                                        .lightblackMedium12,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    MyImages
                                                                        .build,
                                                                    color: AppColors
                                                                        .greycolor2,
                                                                    height: 16,
                                                                    width: 16,
                                                                  ),
                                                                  widthSpace5,
                                                                  Text(
                                                                    'Oodles Technologies',
                                                                    style: BaseStyles
                                                                        .lightblackMedium12,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    MyImages
                                                                        .cal,
                                                                    color: AppColors
                                                                        .greycolor2,
                                                                    height: 16,
                                                                    width: 16,
                                                                  ),
                                                                  widthSpace5,
                                                                  Text(
                                                                    '2 Days ago',
                                                                    style: BaseStyles
                                                                        .lightblackMedium12,
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          heightSpace5,
                                                          Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          heightSpace10,
                                                          textwidget2(
                                                              icon: Icons
                                                                  .calendar_today,
                                                              width: Get.width,
                                                              name:
                                                                  'Start Date & Time',
                                                              text: 'Select'),
                                                          Expanded(
                                                              child:
                                                                  Container()),
                                                          mybuttons(
                                                              color: AppColors
                                                                  .orangecolor,
                                                              name:
                                                                  'Extend Due Date',
                                                              height: 45.0)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                          // Get.to(SettingView());

                                          break;
                                        default:
                                      }
                                    },
                                    height: 0.45,
                                    context: context,
                                    controller: controller,
                                    listname: controller.editlist,
                                    icon: controller.editlist,
                                  );
                                },
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  size: 16,
                                  color: AppColors.greyprimarycolor,
                                )),
                          ],
                        ),
                        heightSpace10,
                        heightSpace5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  MyImages.bag,
                                  color: AppColors.greycolor2,
                                  height: 16,
                                  width: 16,
                                ),
                                widthSpace5,
                                Text(
                                  'Accountant',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  MyImages.build,
                                  color: AppColors.greycolor2,
                                  height: 16,
                                  width: 16,
                                ),
                                widthSpace5,
                                Text(
                                  'Oodles Technologies',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  MyImages.cal,
                                  color: AppColors.greycolor2,
                                  height: 16,
                                  width: 16,
                                ),
                                widthSpace5,
                                Text(
                                  '2 Days ago',
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
                        heightSpace10,
                        index == 3
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: AppColors
                                                .primaryColor2
                                                .withOpacity(0.2),
                                          ),
                                          widthSpace10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Live Interview',
                                                style: BaseStyles.blackMedium14,
                                              ),
                                              heightSpace3,
                                              Text(
                                                'Status : Accepted at 10:00 AM, 25th July 22',
                                                style: BaseStyles
                                                    .lightblackMedium12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  heightSpace10,
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => MyVideoCall()),
                                      );
                                      // Get.to(MyVideoCall());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 0.1,
                                              blurRadius: 1,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                          border: Border.all(
                                              color: AppColors
                                                  .greyprimarycolor.shade200),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 34,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_circle_outline_sharp,
                                            color: AppColors.orangecolor,
                                            size: 20,
                                          ),
                                          widthSpace5,
                                          Text(
                                            'Start Interview',
                                            style: BaseStyles.orangeMedium14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  heightSpace10,
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        // backgroundColor: AppColors.primaryColor,
                                        radius: 10,
                                        child: Image.asset(
                                            'assets/image/profile.png'),
                                      ),
                                      widthSpace3,
                                      Text(
                                        'Nikita Sharma',
                                        style: BaseStyles.blacNormal12,
                                      ),
                                      Text(
                                        ' is waiting',
                                        style: BaseStyles.greyNormal12,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppColors.primaryColor2
                                            .withOpacity(0.2),
                                      ),
                                      widthSpace10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Live Interview',
                                            style: BaseStyles.blackMedium14,
                                          ),
                                          heightSpace3,
                                          Text(
                                            'Status:Completed',
                                            style:
                                                BaseStyles.lightblackMedium12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_outline_sharp,
                                        color: AppColors.orangecolor,
                                        size: 20,
                                      ),
                                      widthSpace5,
                                      Text(
                                        'Watch',
                                        style: BaseStyles.orangeMedium14,
                                      ),
                                    ],
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ),
                heightSpace10
              ],
            );
          }),
    );
  }
}
