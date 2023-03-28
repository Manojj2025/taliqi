import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/createnewinterview_controller.dart';

class AddquestionView extends GetView<CreateNewInterviewController> {
  const AddquestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateNewInterviewController());
    return Scaffold(
        appBar: myappbar2(
            show: false,
            title: HomeName.AddQuestion,
            widget: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Obx(
                  () => Text(
                    'Save',
                    style: !controller.videoShow.value
                        ? BaseStyles.whitelight16
                        : BaseStyles.whiteMedium16,
                  ),
                ),
              ),
            )),
        body: Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  textwidget(
                      nameicon: Icon(
                        Icons.info_sharp,
                        color: AppColors.greycolor3,
                        size: 18,
                      ),
                      height: 150.0,
                      readonly: false,
                      onTap: () {},
                      minline: 8,
                      maxline: 8,
                      name: 'Write Question',
                      text: 'Write'),
                  heightSpace10,
                  Divider(
                    height: 1.0,
                    thickness: 0.5,
                  ),
                  heightSpace10,
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Upload Video',
                              style: BaseStyles.grey1Medium14,
                            ),
                            widthSpace5,
                            Icon(
                              Icons.info_sharp,
                              color: AppColors.greycolor3,
                              size: 18,
                            ),
                          ],
                        ),
                        heightSpace5,
                        controller.videoShow.value == true
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                child: Image.asset(
                                                  'assets/image/i2.png',
                                                  width: 50,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned.fill(
                                                  child: Container(
                                                color: AppColors.blackColor
                                                    .withOpacity(0.1),
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  size: 25,
                                                  color: AppColors.whiteColor,
                                                ),
                                              )),
                                            ],
                                          ),
                                          widthSpace5,
                                          Text(
                                            'question_2.mp4',
                                            style: BaseStyles.grey2normal12,
                                          )
                                        ],
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(
                                              minWidth: 0, minHeight: 0),
                                          onPressed: () {
                                            controller.videoShow.value = false;
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 18,
                                            color: AppColors.greycolor3,
                                          ))
                                    ],
                                  ),
                                  heightSpace10,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LinearPercentIndicator(
                                            padding: EdgeInsets.zero,
                                            alignment: MainAxisAlignment.start,
                                            width: Get.width * 0.82,
                                            lineHeight: 6.0,
                                            percent: 1.0,
                                            animation: true,
                                            barRadius:
                                                const Radius.circular(20),
                                            // center:
                                            //     Text("50.0%", style: BaseStyles.whitebold14),
                                            // trailing: Icon(Icons.mood),

                                            backgroundColor: AppColors
                                                .greyprimarycolor
                                                .withOpacity(0.6),
                                            progressColor:
                                                AppColors.primaryColor),
                                        Text(
                                          '100%',
                                          style: BaseStyles.lightblackMedium14,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : InkWell(
                                onTap: () {
                                  controller.videoShow.value = true;
                                },
                                child:
                                    Image.asset('assets/image/uploadvideo.png'))
                      ],
                    ),
                  ),
                  heightSpace10,
                  Divider(
                    height: 1.0,
                    thickness: 0.5,
                  ),
                  heightSpace10,
                  textwidget2(
                    name: 'Maximum think time',
                    text: 'Select',
                    nameicon: Icon(
                      Icons.info_sharp,
                      color: AppColors.greycolor3,
                      size: 18,
                    ),
                  ),
                  heightSpace10,
                  Divider(
                    height: 1.0,
                    thickness: 0.5,
                  ),
                  heightSpace10,
                  textwidget2(
                    name: 'Maximum number of retakes',
                    text: 'Select',
                    nameicon: Icon(
                      Icons.info_sharp,
                      color: AppColors.greycolor3,
                      size: 18,
                    ),
                  ),
                  heightSpace10,
                  Divider(
                    height: 1.0,
                    thickness: 0.5,
                  ),
                  heightSpace10,
                  textwidget2(
                    name: 'Maximum answer length',
                    text: 'Select',
                    nameicon: Icon(
                      Icons.info_sharp,
                      color: AppColors.greycolor3,
                      size: 18,
                    ),
                  ),
                ],
              ),
            )));
  }
}
