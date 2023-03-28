import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';

import '../constants/values.dart';
import '../modules/jobs_screens/views/jobdetail_view.dart';
import 'decoration.dart';

////// job details////////////////////////////////
Widget jobDetails({icon, title, title2, text, color, iconcolor}) {
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
            Text(
              text ?? JobsName.jobdetail,
              style: BaseStyles.blackMedium14,
            ),
            heightSpace10,
            heightSpace5,
            jobdetails(
                icon: icon ?? Icons.add,
                title: title ?? 'Experience',
                title2: title2 ?? '1 to 3 year'),
            heightSpace10,
            jobdetails(
                icon: icon ?? Icons.add_box_sharp,
                title: title ?? 'CTC',
                title2: title2 ?? '6 to 8 LPA'),
            heightSpace10,
            jobdetails(
                icon: icon ?? Icons.location_on,
                title: title ?? 'Job Location',
                title2: 'Gurugram'),
            heightSpace10,
            jobdetails(
                icon: icon ?? Icons.person_add,
                title: title ?? 'Job Type',
                title2: title2 ?? 'Full Time'),
            heightSpace10,
            jobdetails(
                icon: icon ?? Icons.add_box_sharp,
                title: title ?? 'No of Jobs',
                title2: title2 ?? '2'),
          ],
        ),
      ));
}

Row jobdetails({icon, title, title2, color, iconcolor, width}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 12,
        backgroundColor: color ?? AppColors.primaryColor,
        child: Icon(
          icon,
          color: iconcolor ?? AppColors.whiteColor,
          size: 12,
        ),
      ),
      widthSpace10,
      SizedBox(
        width: width ?? Get.width * 0.26,
        child: Text(
          '$title:',
          style: BaseStyles.grey2normal14,
        ),
      ),
      // widthSpace30,
      Flexible(
        child: Text(
          title2,
          style: BaseStyles.blackNormal14,
        ),
      )
    ],
  );
}
/////////job description////////////////////////////////////////////////////////////////

Widget jobDescription() {
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
            Text(
              JobsName.jobDescription,
              style: BaseStyles.blackMedium14,
            ),
            heightSpace10,
            heightSpace5,
            ReadMoreText(
              "We are looking for a Java developer responsible for building Java applications with Springboot Framework. This includes anything between complex groups of back-end services and their client-end (desktop and mobile) counterparts. Your primary responsibility",
              trimLines: 4,
              style: BaseStyles.blacNormal14,
              colorClickableText: AppColors.primaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
          ],
        ),
      ));
}
///////// professional skills////////////////////////////////

Widget jobprofessional(controller) {
  return Container(
    height: 80,
    width: Get.width,
    color: AppColors.whiteColor,
    margin: EdgeInsets.zero,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                                child: Text(
                                  controller.joblist2[index].toString(),
                                  style: controller.jobselectname2.value ==
                                          controller.joblist2[index]
                                      ? BaseStyles.whitenormal12
                                      : BaseStyles.grey2Medium12,
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

Widget jobsoftprofessional(controller) {
  return Container(
    height: 80,
    width: Get.width,
    color: AppColors.whiteColor,
    margin: EdgeInsets.zero,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                                child: Text(
                                  controller.joblist2[index].toString(),
                                  style: controller.jobselectname3.value ==
                                          controller.joblist2[index]
                                      ? BaseStyles.whitenormal12
                                      : BaseStyles.grey2Medium12,
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

/////// designation////////////////////////////////////////////////////////////////
Widget jobprofile({padding}) {
  return Container(
    color: AppColors.whiteColor,
    width: Get.width,
    child: Padding(
      padding: padding ?? const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              widthSpace10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Designation',
                      style: BaseStyles.lightblackMedium12,
                    ),
                    heightSpace5,
                    Text(
                      'UX Designer',
                      style: BaseStyles.blacNormal14,
                    )
                  ],
                ),
              ),
              // widthSpace20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department',
                      style: BaseStyles.lightblackMedium12,
                    ),
                    heightSpace5,
                    Text(
                      'Design',
                      style: BaseStyles.blacNormal14,
                    )
                  ],
                ),
              )
            ],
          ),
          heightSpace20,
          Row(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              widthSpace10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minimun Qualification',
                      style: BaseStyles.lightblackMedium12,
                    ),
                    heightSpace5,
                    Text(
                      'B Tech',
                      style: BaseStyles.blacNormal14,
                    )
                  ],
                ),
              ),
              // widthSpace50,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Due Date',
                      style: BaseStyles.lightblackMedium12,
                    ),
                    heightSpace5,
                    Text(
                      '28th Feb 2022',
                      style: BaseStyles.blacNormal14,
                    )
                  ],
                ),
              )
            ],
          ),
          heightSpace10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: Get.width,
              decoration: decorationbox2(
                  radius: 5.0, color: AppColors.primaryColor.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No due Date',
                  style: BaseStyles.greenMedium14,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget jobapplication() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    width: Get.width,
    color: AppColors.whiteColor,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          heightSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Applications(4)',
                    style: BaseStyles.blackMedium14,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.greyprimarycolor,
                  ),
                  widthSpace20,
                  Image.asset(
                    MyImages.filter,
                    height: 25,
                    width: 25,
                    color: AppColors.greyprimarycolor,
                  ),
                  widthSpace10
                ],
              ),
              // widthSpace10
            ],
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

///////// textfiled///////////////////////////////////////////////////
Container singlefiled({name, width, color, style, height, show}) {
  return Container(
    decoration: decorationbox3(
      border: Border.all(color: AppColors.greyprimarycolor.shade100),
      color: color ?? AppColors.greyprimarycolor.shade100,
      radius: 4.0,
    ),
    width: width ?? Get.width * 0.25,
    // margin: const EdgeInsets.only(left: 5, right: 5),
    height: height ?? 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            name,
            style: style ?? BaseStyles.grey1Medium14,
          ),
        ),
        show ??
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: AppColors.greyprimarycolor,
              size: 20,
            )
      ],
    ),
  );
}

Column textwidget2(
    {name, text, width, icon, onTap, textwidget, nameicon, iconwidget}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      children: [
        Text(
          name,
          style: BaseStyles.grey1Medium14,
        ),
        widthSpace5,
        nameicon ?? Container()
      ],
    ),
    heightSpace5,
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: decorationbox3(
          border: Border.all(color: AppColors.greyprimarycolor.shade100),
          color: AppColors.greyprimarycolor.shade100,
          radius: 4.0,
        ),
        width: width ?? Get.width,
        // margin: const EdgeInsets.only(left: 5, right: 5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textwidget ??
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    text,
                    style: BaseStyles.grey3Normal16,
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconwidget ??
                  Icon(
                    icon ?? Icons.keyboard_arrow_down_sharp,
                    color: AppColors.greyprimarycolor,
                    size: 20,
                  ),
            )
          ],
        ),
      ),
    )
  ]);
}

/////selectedwidget/////////
selected({text, width, icon, onTap}) {
  return Container(
    decoration: decorationbox3(
      border: Border.all(color: AppColors.greyprimarycolor.shade100),
      color: AppColors.greyprimarycolor.shade100,
      radius: 4.0,
    ),
    width: width ?? Get.width,
    // margin: const EdgeInsets.only(left: 5, right: 5),
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: BaseStyles.grey3Normal16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon ?? Icons.keyboard_arrow_down_sharp,
            color: AppColors.greyprimarycolor,
            size: 20,
          ),
        )
      ],
    ),
  );
}
