import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taliqi/app/modules/auth_screens/controllers/otp_controller.dart';
import 'package:taliqi/app/modules/auth_screens/views/successfully_view.dart';

import '../../../constants/values.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/textfiled.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OtpController());
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
                        HomeName.enterdigit,
                        style: BaseStyles.blackMedium24,
                      ),
                      heightSpace10,
                      Text(
                        'Lorem ipsum is a dummy text ',
                        style: BaseStyles.grey3Normal16,
                      ),
                      heightSpace20,
                      Container(
                        decoration: decorationbox3(
                          border: Border.all(
                              color: AppColors.greyprimarycolor.shade100),
                          color: AppColors.greyprimarycolor.shade100,
                          radius: 4.0,
                        ),
                        width: Get.width,
                        // margin: const EdgeInsets.only(left: 5, right: 5),

                        child: TextField(
                          controller: controller.emailtxt,
                          // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          keyboardType: TextInputType.text,
                          style: BaseStyles.grey3Normal16,

                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Change',
                                style: BaseStyles.blueMediuml16,
                              ),
                            ),
                            hintStyle: BaseStyles.grey3Normal14,
                            isDense: true,
                            contentPadding: const EdgeInsets.all(15.0),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      heightSpace20,
                      PinCodeTextField(
                        appContext: context,
                        enablePinAutofill: false,
                        autoDismissKeyboard: true,

                        pastedTextStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          return null;
                          // if (v.length < 5) {
                          //   return 'Invalid Pin';
                          // } else {
                          //   return null;
                          // }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(0)),
                          fieldHeight: 45,
                          borderWidth: .10,
                          fieldWidth: 70,
                          activeColor: AppColors.greyprimarycolor.shade300,
                          inactiveColor: AppColors.greyprimarycolor.shade300,
                          inactiveFillColor:
                              AppColors.greyprimarycolor.shade100,
                          activeFillColor: AppColors.whiteColor,
                          selectedFillColor: AppColors.whiteColor,
                        ),
                        cursorColor: AppColors.primaryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            height: 1.6,
                            color: AppColors.greyprimarycolor),
                        enableActiveFill: true,
                        controller: controller.otptxt,
                        keyboardType: TextInputType.number,

                        // boxShadows: [
                        //   BoxShadow(
                        //     offset: Offset(0, 1),
                        //     color: Colors.grey.withAlpha(10),
                        //     // blurRadius: 10,
                        //   )
                        // ],
                        onCompleted: (v) {
                          print('Completed');
                        },
                        // onTap: () {
                        //   print('Pressed');
                        // },
                        onChanged: (value) {
                          print(value);
                          // controller.currentText.value = value;
                        },
                        beforeTextPaste: (text) {
                          print('Allowing to paste $text');
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ],
                  ),
                  heightSpace20,
                  mybuttons(
                    action: () {
                      Get.to(const SuccessfullyView());
                    },
                    // height: 45.0,
                    color: AppColors.orangecolor,
                    radius: 8.0,
                    name: HomeName.verify,
                  ),
                  heightSpace10,
                  Container(
                    height: 45,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: decorationbox3(
                        border: Border.all(
                          color: AppColors.orangecolor,
                        ),
                        radius: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend code:", style: BaseStyles.grey3medium16),
                        widthSpace5,
                        Obx(
                          () => Text(
                            "0:${controller.start.value.toString()}",
                            style: BaseStyles.orangeMedium16,
                          ),
                        ),
                      ],
                    ),
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
