import 'package:taliqi/app/widgets/decoration.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/email_controller.dart';

class EmailserviceView extends GetView<EmailController> {
  const EmailserviceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EmailController());
    return Scaffold(
        appBar: myappbar2(
            title: HomeName.EmailConfiguration,
            show: false,
            show2: Container()),
        body: Container(
          width: Get.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect Email service to App',
                  style: BaseStyles.blackMedium14,
                ),
                heightSpace10,
                heightSpace5,
                _listWidget()
              ],
            ),
          ),
        ));
  }

  //////////////////// job list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    decoration: decorationbox(
                        border: Border.all(
                            color: AppColors.greyprimarycolor.shade200)),
                    // padding: EdgeInsets.all(8.0),
                    // color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffF7F7F7),
                                    child: Image.asset(
                                      index == 2
                                          ? 'assets/image/setting.png'
                                          : index == 1
                                              ? 'assets/image/outlook.png'
                                              : 'assets/image/mail.png',
                                      height: 15,
                                      width: 15,
                                    ),
                                    radius: 17,
                                  ),
                                  widthSpace10,
                                  Row(
                                    children: [
                                      Text(
                                        index == 2
                                            ? 'Custom'
                                            : index == 1
                                                ? 'Outlook'
                                                : 'Gmail',
                                        style: BaseStyles.blackMedium14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(EmailserviceView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: 20,
                                    color: AppColors.orangecolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightSpace10,
                  heightSpace5,
                ],
              ),
            );
          }),
    );
  }
}
