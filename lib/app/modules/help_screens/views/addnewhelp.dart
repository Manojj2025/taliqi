import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:dotted_border/dotted_border.dart';
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
import '../controllers/help_controller.dart';

class AddHelpNewView extends GetView<HelpController> {
  const AddHelpNewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HelpController());
    return Scaffold(
        appBar: myappbar2(
            title: HomeName.AddNewTicket, show: false, show2: Container()),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae semper quis lectus nulla. Diam quis enim lobortis scelerisque fermentum dui faucibus. Molestie at elementum eu facilisis sed odio morbi.',
                      style: BaseStyles.grey3Normal14,
                    ),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Name*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(
                        name: 'Email*',
                        text: 'Enter',
                        onTap: () {
                          // select(context);
                        }),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget2(
                        name: 'Priority*',
                        text: 'Select',
                        onTap: () {
                          // select(context);
                        }),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(
                        height: 150.0,
                        readonly: false,
                        onTap: () {},
                        minline: 12,
                        maxline: 12,
                        name: 'Describe your issue*',
                        text: 'Write'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    controller.addattachment.value
                        ? DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(4),
                            padding: EdgeInsets.zero,
                            color: AppColors.greyprimarycolor.shade400,
                            child: GestureDetector(
                              onTap: () {
                                // controller.addattachment.value = true;
                              },
                              child: Container(
                                width: Get.width,
                                color: Color.fromRGBO(250, 250, 250, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 16,
                                            // backgroundColor: AppColors.primaryColor,
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: decorationbox(
                                                    radius: 5.0,
                                                    color: AppColors
                                                        .greyprimarycolor
                                                        .shade300)),
                                          ),
                                          widthSpace5,
                                          Text(
                                            'Media.jpg',
                                            style: BaseStyles.grey3Normal14,
                                          )
                                        ],
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(
                                              minWidth: 0, minHeight: 0),
                                          onPressed: () {
                                            controller.addattachment.value =
                                                false;
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            size: 20,
                                            color: AppColors.greycolor3,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    heightSpace20,
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(4),
                      padding: EdgeInsets.zero,
                      color: AppColors.greyprimarycolor.shade400,
                      child: GestureDetector(
                        onTap: () {
                          controller.addattachment.value = true;
                        },
                        child: Container(
                          width: Get.width,
                          color: Color.fromRGBO(250, 250, 250, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  // backgroundColor: AppColors.primaryColor,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(61, 179, 137, 1),
                                          Color.fromRGBO(63, 219, 163, 1)
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.cloud_download_outlined,
                                      size: 20,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                widthSpace5,
                                Text(
                                  'Add Attachment',
                                  style: BaseStyles.grey3Normal14,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    heightSpace30,
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: mybuttons(
                              style: BaseStyles.blacNormal14,
                              border: Border.all(
                                  color: AppColors.greyprimarycolor.shade200),
                              action: () {
                                // Get.to(LeadAddedView());
                                // controller
                                //     .index
                                //     .value = ;
                                print('object');
                              },
                              name: 'Cancel',
                              color: AppColors.whiteColor,
                              height: 40.0),
                        ),
                        widthSpace10,
                        Expanded(
                            child: mybuttons(
                                style: BaseStyles.whitenormal14,
                                // border: Border.all(color: AppColors.orangecolor),
                                action: () {
                                  // Get.to(LeadAddedView());
                                  // controller
                                  //     .index
                                  //     .value = ;
                                  print('object');
                                },
                                name: 'Submit',
                                color: AppColors.secondarydarkColor,
                                height: 40.0)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
