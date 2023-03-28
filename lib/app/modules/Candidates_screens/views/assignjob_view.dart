import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/modules/jobs_screens/views/bottombar_view.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../controllers/candidatesdetail_controller.dart';
import 'clientAdded.dart';

class AssignJobView extends GetView<CandidatesdetailController> {
  const AssignJobView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myappbar2(
          show: false,
          title: JobsName.AssignJob,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                    radius: 20,
                                    child: Image.asset(
                                      'assets/image/bajaj.png',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Nikita Sharma',
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
                                              '6 new',
                                              style: BaseStyles.greenMedium11,
                                            ),
                                          )
                                        ],
                                      ),
                                      heightSpace3,
                                      Text(
                                        'Tech Mahindra',
                                        style: BaseStyles.grey2normal12,
                                      ),
                                      heightSpace5,
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightSpace10,
                  _jobrecommaneded(),
                ],
              ),
            ),
            Expanded(child: Container()),
            mybuttons(
                width: Get.width * 0.95,
                action: () {
                  Get.off(CandidateAddedView());
                },
                name: 'Assign Jobs',
                color: AppColors.orangecolor,
                height: 40.0),
          ],
        ));
  }
  ////////jobrecomm////////////////////////////////

  Widget _jobrecommaneded() {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
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
                      'Assign Jobs',
                      style: BaseStyles.blackMedium14,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.greyprimarycolor,
                      size: 20,
                    ),
                    widthSpace20,
                    Image.asset(
                      MyImages.filter,
                      height: 20,
                      width: 20,
                      color: AppColors.greyprimarycolor,
                    ),
                    // widthSpace10
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
        itemCount: 2,
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
                                        'UI/UX Designer',
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
                                      value: controller.agree.value,
                                      onChanged: (value) {
                                        controller.agree.value = value ?? false;
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
                                size: 16,
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
                              Icon(
                                Icons.calendar_month,
                                color: AppColors.greyprimarycolor,
                                size: 16,
                              ),
                              widthSpace3,
                              Text(
                                '21 Aug',
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
                                size: 16,
                              ),
                              widthSpace3,
                              Text(
                                '12 Candidates',
                                style: BaseStyles.lightblackMedium12,
                              )
                            ],
                          ),
                          // Text(
                          //   '₹ 20 LPA',
                          //   style: BaseStyles.lightblackMedium12,
                          // )
                        ],
                      ),

                      // heightSpace10,
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinearPercentIndicator(
                                padding: EdgeInsets.zero,
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
                                progressColor: AppColors.primaryColor),
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
