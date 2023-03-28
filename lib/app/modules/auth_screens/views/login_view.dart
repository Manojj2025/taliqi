import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/constants/strings.dart';
import 'package:taliqi/app/modules/auth_screens/views/resetpassword_view.dart';
import 'package:taliqi/app/modules/jobs_screens/views/bottombar_view.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:taliqi/app/widgets/textfiled.dart';
import '../../../constants/values.dart';
import '../../../modules2/bottomnav/views/bottombar2_view.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heightSpace30,
                  Column(
                    children: [
                      Container(
                        decoration:
                            MyDecoration.simple2decoration(radius: 15.0),
                        child: Image.asset(
                          MyImages.logo,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      heightSpace50,
                      Text(
                        HomeName.login,
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
                      heightSpace20,
                      textfiled(
                        eyeshow: true,
                        style: BaseStyles.grey3Normal16,
                        controller: controller.passwordtxt,
                        readonly: false,
                        text: 'Password',
                      )
                      // textfiled(
                      //     text: 'Mobile Number',
                      //     controller: controller.mobiletxt),
                    ],
                  ),
                  heightSpace30,
                  mybuttons(
                    action: () {
                      Get.to(BottombarView());
                      // Get.to(BottomBar2View());
                    },
                    // height: 45.0,
                    color: AppColors.orangecolor,
                    radius: 8.0,
                    name: HomeName.login,
                  ),
                  heightSpace20,
                  InkWell(
                    onTap: () {
                      Get.to(ResetpasswordView());
                    },
                    child: Text(
                      HomeName.resetpass,
                      style: BaseStyles.blueMediuml16,
                    ),
                  ),
                  heightSpace20,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          width: Get.width * 0.40,
                          color: AppColors.greyprimarycolor,
                        ),
                      ),
                      widthSpace3,
                      Text(
                        HomeName.loginwith,
                        style: BaseStyles.grey3Normal14,
                      ),
                      widthSpace3,
                      Expanded(
                        child: Container(
                          height: 1,
                          width: Get.width * 0.40,
                          color: AppColors.greyprimarycolor,
                        ),
                      ),
                    ],
                  ),
                  heightSpace20,
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            width: Get.width * 0.45,
                            decoration: decorationbox3(
                                border: Border.all(
                                  color: AppColors.bluecolor,
                                ),
                                radius: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  MyImages.linkdin,
                                  height: 20,
                                  width: 20,
                                ),
                                widthSpace5,
                                Text(
                                  HomeName.linkedIn,
                                  style: BaseStyles.blueNormal14,
                                )
                              ],
                            ),
                          ),
                        ),
                        widthSpace10,
                        Expanded(
                          child: Container(
                            height: 40,
                            width: Get.width * 0.45,
                            decoration: decorationbox3(
                                border: Border.all(
                                  color: AppColors.redcolor,
                                ),
                                radius: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  MyImages.google,
                                  height: 20,
                                  width: 20,
                                ),
                                widthSpace5,
                                Text(
                                  HomeName.google,
                                  style: BaseStyles.redNormal14,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
