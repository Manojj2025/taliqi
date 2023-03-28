import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../controllers/email_controller.dart';
import 'emailcreate_view.dart';
import 'emailservice_view.dart';

class EmailView extends GetView<EmailController> {
  const EmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EmailController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            HomeName.EmailConfiguration,
            style: BaseStyles.whiteMedium16,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                    size: 18,
                  ),
                  widthSpace10,
                  // widthSpace5,

                  InkWell(
                    onTap: (() => Get.to(CreateEmailView())),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 18,
                          ),
                          widthSpace5,
                          Text(
                            'New',
                            style: BaseStyles.whitebold14,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [_listWidget()],
        ));
  }

  //////////////////// job list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: AppColors.whiteColor,
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
                                    index == 1
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
                                      'Gmail',
                                      style: BaseStyles.blackMedium14,
                                    ),
                                    widthSpace5,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: decorationbox2(
                                          color: index == 1
                                              ? AppColors.redcolor
                                                  .withOpacity(0.1)
                                              : AppColors.primaryColor2
                                                  .withOpacity(0.1),
                                          radius: 30.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              radius: 3,
                                              backgroundColor: index == 1
                                                  ? Colors.red
                                                  : Color(0xff02E140)),
                                          widthSpace5,
                                          Text(
                                            index == 1 ? 'Suspend' : 'Active',
                                            style: index == 1
                                                ? BaseStyles.redNormal12
                                                : BaseStyles.greennormal12,
                                          ),
                                        ],
                                      ),
                                    )
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
                                  Icons.settings,
                                  size: 16,
                                  color: AppColors.greycolor3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightSpace5,
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Some important notes',
                            style: BaseStyles.grey3Normal12,
                          ),
                        ),
                        heightSpace10,
                      ],
                    ),
                  ),
                ),
                heightSpace10
              ],
            );
          }),
    );
  }
}
