import 'package:taliqi/app/modules2/home_view/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/values.dart';
import '../../../widgets/decoration.dart';

class Home2View extends GetView<Home2Controller> {
  const Home2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Home2Controller());
    return Scaffold(
      body: ListView(
        children: [
          Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      heightSpace30,
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 30,
                        child: Image.asset(
                          'assets/image/profile.png',
                        ),
                      ),
                      heightSpace10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Janki Bisht',
                            style: BaseStyles.blackmedium18,
                          ),
                          heightSpace3,
                          Text(
                            'UI/UX Designer',
                            style: BaseStyles.grey3Normal14,
                          )
                        ],
                      ),
                      heightSpace20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Profile Completion',
                                style: BaseStyles.grey3Normal12,
                              ),
                              Text(
                                '70%',
                                style: BaseStyles.grey3Normal12,
                              ),
                            ],
                          ),
                          heightSpace10,
                          LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              alignment: MainAxisAlignment.start,
                              // width: Get.width * 0.95,
                              lineHeight: 8.0,
                              percent: 0.5,
                              animation: true,
                              barRadius: const Radius.circular(20),
                              // center:
                              //     Text("50.0%", style: BaseStyles.whitebold14),
                              // trailing: Icon(Icons.mood),

                              backgroundColor:
                                  AppColors.greyprimarycolor.shade200,
                              progressColor: AppColors.primaryColor),
                        ],
                      ),
                      heightSpace10,
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        color: AppColors.whiteColor,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 180,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0),
                            itemCount: controller.list.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.2,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          controller.list[index]['img']
                                              .toString(),
                                          height: 25,
                                          width: 25,
                                        ),
                                        // widthSpace10,
                                        // Container(
                                        //   height: 40,
                                        //   width: 1,
                                        //   color: AppColors
                                        //       .greyprimarycolor.shade100,
                                        // ),
                                        heightSpace10,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.list[index]['value']
                                                  .toString(),
                                              style: BaseStyles.blackMedium18,
                                            ),
                                            heightSpace3,
                                            Text(
                                              controller.list[index]['title']
                                                  .toString(),
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
                    ],
                  ),
                ),
              ])),
          heightSpace10,
          Container(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Interview Invitations',
                        style: BaseStyles.blackMedium14,
                      ),
                      Text(
                        'See All',
                        style: BaseStyles.greenMedium14,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
