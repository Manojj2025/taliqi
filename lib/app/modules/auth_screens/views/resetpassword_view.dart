import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/modules/auth_screens/controllers/resetpassword_controller.dart';
import 'package:taliqi/app/modules/auth_screens/views/otp_view.dart';
import 'package:taliqi/app/modules/auth_screens/views/successfully_view.dart';

import '../../../constants/values.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/textfiled.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetpasswordController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  heightSpace30,
                  Column(
                    children: [
                      // Container(
                      //   decoration:
                      //       MyDecoration.simple2decoration(radius: 15.0),
                      //   child: Image.asset(
                      //     MyImages.logo,
                      //     fit: BoxFit.cover,
                      //     height: 100,
                      //   ),
                      // ),
                      heightSpace50,
                      Text(
                        HomeName.resetpass,
                        style: BaseStyles.blackMedium24,
                      ),
                      heightSpace10,
                      Text(
                        HomeName.emailstart,
                        style: BaseStyles.grey3Normal16,
                      ),
                      heightSpace20,
                      textfiled(
                        style: BaseStyles.grey3Normal16,
                        controller: controller.emailtxt,
                        readonly: false,
                        text: 'Email',
                      ),
                    ],
                  ),
                  heightSpace30,
                  mybuttons(
                    action: () {
                      Get.to(OtpView());
                    },
                    // height: 45.0,
                    color: AppColors.orangecolor,
                    radius: 8.0,
                    name: HomeName.otp,
                  ),
                  heightSpace20,
                  Text(
                    HomeName.backtoLogin,
                    style: BaseStyles.blueMediuml16,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
