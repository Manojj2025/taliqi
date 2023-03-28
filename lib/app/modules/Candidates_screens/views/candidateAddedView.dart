import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/modules/jobs_screens/views/bottombar_view.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../controllers/candidatesdetail_controller.dart';
import 'candidatesdetail_view.dart';

class CandidateAddedView extends GetView<CandidatesdetailController> {
  const CandidateAddedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar2(
          show: false,
          title: HomeName.CandidateAdded,
          widget: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    color: AppColors.whiteColor,
                    size: 16,
                  ),
                  widthSpace5,
                  Text(
                    'Share',
                    style: BaseStyles.whiteMedium16,
                  ),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // heightSpace30,
                    Align(
                      child: Image.asset(
                        MyImages.check,
                        fit: BoxFit.cover,
                        height: 130,
                      ),
                    ),
                    heightSpace30,
                    Text(
                      'Candidate Added Successfully',
                      style: BaseStyles.blackMedium24,
                    ),
                    heightSpace10,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'information on its origins, as well as a random Lipsum generator.',
                        style: BaseStyles.grey3Normal16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    heightSpace30,
                    Text(
                      'Assign Jobs',
                      style: BaseStyles.blackMedium14,
                    ),
                    heightSpace10,
                    Align(
                      child: Container(
                        width: Get.width,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: decorationbox3(
                            radius: 5.0,
                            color: AppColors.redcolor.withOpacity(0.1)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View recommended jobs',
                              style: BaseStyles.orangeMedium14,
                            ),
                            widthSpace5,
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.orangecolor,
                              child: Text(
                                '3',
                                style: BaseStyles.whitenormal12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    heightSpace20
                  ],
                ),
              ),
            ),
            heightSpace10,
            Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'If you entered wrong information, don’t panic. We’ve made it easy for you to update the job.',
                      style: BaseStyles.blackMedium14,
                    ),
                    heightSpace20,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.check,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Check on the status of the candidate',
                        title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.calendar_month,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Edit the informations of candidate',
                        title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.add_to_photos_outlined,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Assign candidate, interviews to candidate',
                        title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.block_outlined,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Block the Candidate',
                        title2: ''),
                    heightSpace20,
                    mybuttons(
                        action: () {
                          Get.to(CandidatesdetailView());
                        },
                        name: 'View candidate',
                        color: AppColors.orangecolor,
                        height: 40.0)
                  ],
                ),
              ),
            ),
            // heightSpace10,
            jobapplication()
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
                      'Similar Candidates(4)',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                Row(
                  children: [
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
