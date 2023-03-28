import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:taliqi/app/widgets/buttons.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:taliqi/app/widgets/filters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/rating.dart';
import '../../../widgets/search.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/helpdetails_controllers.dart';

class HelpdetailView extends GetView<HelpdetailsController> {
  const HelpdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HelpdetailsController());
    return Scaffold(
      appBar: myappbar2(
        title: HomeName.TicketDetail,
        show: false,
        show2: Container(),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // widthSpace10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '#808097977954333',
                                style: BaseStyles.blackMedium16,
                              ),
                              widthSpace5,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: decorationbox2(
                                    color: AppColors.primaryColor2
                                        .withOpacity(0.2),
                                    radius: 30.0),
                                child: Text(
                                  'New',
                                  style: BaseStyles.greennormal12,
                                ),
                              )
                            ],
                          ),
                          heightSpace3,
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color: AppColors.greycolor3,
                                size: 15,
                              ),
                              widthSpace3,
                              Text(
                                '07/02/2023',
                                style: BaseStyles.grey2normal12,
                              ),
                              widthSpace5,
                              Icon(
                                Icons.flag_outlined,
                                color: AppColors.redcolor,
                                size: 15,
                              ),
                              widthSpace3,
                              Text(
                                'Urgent',
                                style: BaseStyles.grey2normal12,
                              ),
                            ],
                          ),
                          heightSpace5,
                        ],
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: decorationbox2(
                            color: AppColors.primaryColor2, radius: 30.0),
                        child: Text(
                          'Open',
                          style: BaseStyles.whitenormal12,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.makesoled.value =
                            !controller.makesoled.value;
                      },
                      child: Container(
                        decoration: decorationbox(
                            radius: 5.0,
                            border: Border.all(
                                color: controller.makesoled.value
                                    ? AppColors.secondarydarkColor
                                    : AppColors.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 18,
                                color: controller.makesoled.value
                                    ? AppColors.secondarydarkColor
                                    : AppColors.primaryColor,
                              ),
                              widthSpace3,
                              Text(
                                'Mark as Solved',
                                style: controller.makesoled.value
                                    ? BaseStyles.orangenormal14
                                    : BaseStyles.greennormal14,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          heightSpace10,
          activities(context),
        ],
      ),
    );
  }

//////////////////////////ACTIVITES///////////////////////////////////
  Widget activities(context) {
    return Expanded(
      child: Container(
        // margin: const EdgeInsets.only(top: 10),
        width: Get.width,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                                  width: Get.width,
                                  // height: 80,
                                  child: TimelineTile(
                                    // startChild: Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 5.0, right: 5),
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.end,
                                    //     children: [
                                    //       Text(
                                    //         '3:00 PM',
                                    //         style: BaseStyles.blacNormal12,
                                    //       ),
                                    //       Text(
                                    //         '21st Feb, 2020',
                                    //         style: BaseStyles.grey2normal12,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    alignment: TimelineAlign.manual,
                                    lineXY: 0.0,

                                    beforeLineStyle: const LineStyle(
                                        thickness: 2,
                                        color: AppColors.primaryColor),
                                    afterLineStyle: const LineStyle(
                                        thickness: 2,
                                        color: AppColors.primaryColor),
                                    indicatorStyle: IndicatorStyle(
                                        indicatorXY: 0.1,
                                        drawGap: false,
                                        width: 8,
                                        color: AppColors.primaryColor),
                                    // lineXY: 1,
                                    endChild: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/image/p.webp'),
                                          ),
                                          widthSpace5,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.list2[index]
                                                          ['text']
                                                      .toString(),
                                                  style:
                                                      BaseStyles.blackMedium14,
                                                ),
                                                heightSpace3,
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.alarm_rounded,
                                                      color:
                                                          AppColors.greycolor3,
                                                      size: 13,
                                                    ),
                                                    widthSpace3,
                                                    Text(
                                                      controller.list2[index]
                                                              ['t2']
                                                          .toString(),
                                                      style: BaseStyles
                                                          .grey2normal12,
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller.list2[index]
                                                            ['t3']
                                                        .toString(),
                                                    style:
                                                        BaseStyles.blacNormal14,
                                                  ),
                                                ),
                                                heightSpace10
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isFirst:
                                        controller.list2[index]['first'] == true
                                            ? true
                                            : false,
                                    // isLast: true,
                                    isLast:
                                        controller.list2[index]['last'] == true
                                            ? true
                                            : false,
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              ),
              mybuttons(
                  action: () {
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
                            heightFactor: 0.73,
                            child: Container(
                              // height: 300,
                              decoration: MyDecoration.radiusonlydecoration(
                                  tlradius: 25.0, trradius: 25.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                      'Add Comment to Thread',
                                      style: BaseStyles.blackMedium16,
                                    ),
                                    heightSpace10,
                                    textwidget(
                                        height: 150.0,
                                        readonly: false,
                                        onTap: () {},
                                        minline: 20,
                                        maxline: 20,
                                        name: '',
                                        text: 'Write'),
                                    heightSpace20,
                                    DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(4),
                                      padding: EdgeInsets.zero,
                                      color:
                                          AppColors.greyprimarycolor.shade400,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          color:
                                              Color.fromRGBO(250, 250, 250, 1),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 16,
                                                  // backgroundColor: AppColors.primaryColor,
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color.fromRGBO(
                                                              61, 179, 137, 1),
                                                          Color.fromRGBO(
                                                              63, 219, 163, 1)
                                                        ],
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .cloud_download_outlined,
                                                      size: 20,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                                widthSpace5,
                                                Text(
                                                  'Add Attachment',
                                                  style:
                                                      BaseStyles.grey3Normal14,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    heightSpace20,
                                    ////

                                    mybuttons(
                                        action: () {
                                          Get.back();
                                        },
                                        name: 'Add Comment',
                                        radius: 5.0,
                                        color: AppColors.orangecolor,
                                        height: 45.0),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  // style:
                  //     BaseStyles.grey2medium16,
                  name: 'Add New Comment',
                  color: AppColors.orangecolor,
                  height: 45.0)
            ],
          ),
        ),
      ),
    );
  }
}
