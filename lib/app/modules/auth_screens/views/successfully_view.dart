import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/constants/app_colors.dart';
import 'package:taliqi/app/modules/jobs_screens/views/bottombar_view.dart';

import '../../../constants/values.dart';
import '../../../widgets/decoration.dart';

class SuccessfullyView extends GetView {
  const SuccessfullyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              heightSpace50,
              heightSpace30,
              heightSpace30,
              Align(
                child: Image.asset(
                  MyImages.check,
                  fit: BoxFit.cover,
                  height: 130,
                ),
              ),
              heightSpace30,
              Text(
                'Password changed successfully!',
                style: BaseStyles.blackMedium24,
              ),
              heightSpace10,
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  'Reference site about Lorem Ipsum, giving information on its origins, as well.',
                  style: BaseStyles.grey3Normal16,
                  textAlign: TextAlign.center,
                ),
              ),
              heightSpace30,
              InkWell(
                onTap: () {
                  Get.to(BottombarView());
                },
                child: Container(
                  height: 45,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: decorationbox3(
                      border: Border.all(
                        color: AppColors.orangecolor,
                      ),
                      radius: 5.0),
                  child: Text(
                    HomeName.gotoHome,
                    style: BaseStyles.orangeMedium16,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
