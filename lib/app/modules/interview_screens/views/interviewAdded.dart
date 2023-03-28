import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/modules/jobs_screens/views/bottombar_view.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../controllers/createnewinterview_controller.dart';

class InterviewAddedView extends GetView<CreateNewInterviewController> {
  const InterviewAddedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar2(
          show: false,
          title: JobsName.clientadded,
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
                    heightSpace50,
                    Align(
                      child: Image.asset(
                        MyImages.check,
                        fit: BoxFit.cover,
                        height: 130,
                      ),
                    ),
                    heightSpace30,
                    Text(
                      'Interview Created Successfully!',
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
                    heightSpace10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.greyprimarycolor.shade200,
                              width: Get.width * 0.42,
                            ),
                          ),
                          Text(
                            'Open Interview Link',
                            style: BaseStyles.blackMedium14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.greyprimarycolor.shade200,
                              width: Get.width * 0.42,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // heightSpace10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'https://demo.taliqone.com/applicant/open/MTIw/QUlTSk9CMDAwMDM2/',
                        style: BaseStyles.grey2normal14,
                      ),
                    ),
                    Container(
                      decoration: decorationbox(
                          border: Border.all(
                              color: AppColors.greyprimarycolor.shade200),
                          radius: 5.0,
                          color: AppColors.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: 18,
                              color: AppColors.greycolor3,
                            ),
                            widthSpace5,
                            Text(
                              'Copy URL',
                              style: BaseStyles.blackMedium14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            heightSpace10,
            Container(
              width: Get.width,
              // height: Get.height,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'If you entered wrong information, don’t panic. We’ve made it easy for you to update the detail.',
                      style: BaseStyles.blackMedium14,
                    ),
                    heightSpace20,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.check,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Check on the status of the interview',
                        title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.calendar_month,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Edit the informations of interview',
                        title2: ''),
                    // heightSpace10,
                    // jobdetails(
                    //     color: AppColors.primaryColor.withOpacity(0.2),
                    //     icon: Icons.add_to_photos_outlined,
                    //     width: Get.width * 0.80,
                    //     iconcolor: AppColors.primaryColor,
                    //     title: 'Assign candidate, interviews to job',
                    //     title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.add_box_outlined,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Clone interview',
                        title2: ''),
                    heightSpace10,
                    jobdetails(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        icon: Icons.person_add_alt,
                        width: Get.width * 0.80,
                        iconcolor: AppColors.primaryColor,
                        title: 'Cancel the interview',
                        title2: ''),
                    heightSpace20,
                    mybuttons(
                        action: () {
                          Get.offAll(BottombarView());
                        },
                        name: 'View Interview',
                        color: AppColors.orangecolor,
                        height: 40.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
