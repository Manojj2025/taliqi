import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';

class BillingView extends GetView {
  const BillingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            myappbar2(title: JobsName.Billing, show: false, show2: Container()),
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
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              height: 40,
                              width: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/image/billing.png',
                                  height: 20,
                                  width: 20,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            widthSpace10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic Plan',
                                  style: BaseStyles.blackMedium16,
                                ),
                                SizedBox(
                                  width: Get.width * 0.70,
                                  child: Text(
                                    'You are currently subscribed to Basic Plan with annual billing',
                                    style: BaseStyles.grey2normal12,
                                  ),
                                ),
                                heightSpace5,
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    heightSpace5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Billing Date',
                          style: BaseStyles.blackMedium12,
                        ),
                        Text(
                          'Feb 7 2023',
                          style: BaseStyles.grey3Normal12,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            heightSpace10,
            Expanded(
              child: Container(
                width: Get.width,
                color: AppColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Billing History',
                        style: BaseStyles.blackMedium14,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  color: AppColors.whiteColor,
                                  child: Column(
                                    children: [
                                      heightSpace10,
                                      Divider(
                                        thickness: 0.3,
                                      ),
                                      heightSpace10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jan 7 2023',
                                                style: BaseStyles.blackMedium12,
                                              ),
                                              heightSpace3,
                                              Text(
                                                'Payment Method : VISA ****8879',
                                                style: BaseStyles.grey3Normal12,
                                              )
                                            ],
                                          ),
                                          Text(
                                            '299',
                                            style: BaseStyles.blackMedium12,
                                          )
                                        ],
                                      )
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
            )
          ],
        ));
  }
}
