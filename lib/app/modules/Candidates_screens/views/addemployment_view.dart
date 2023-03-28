import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/candidatesdetail_controller.dart';

class AddemploymentView extends GetView<CandidatesdetailController> {
  const AddemploymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CandidatesdetailController());
    return Scaffold(
        appBar: myappbar2(
            show: false,
            title: 'Add Employment',
            widget: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Text(
                  'Save',
                  style: !controller.show2.value
                      ? BaseStyles.whitelight16
                      : BaseStyles.whiteMedium16,
                ),
              ),
            )),
        body: SingleChildScrollView(
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
                  textwidget(
                      name: 'Organization*',
                      text: 'Enter',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      name: 'Designation*',
                      text: 'Enter',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary',
                        style: BaseStyles.grey1Medium14,
                      ),
                      heightSpace5,
                      textfiled(
                        prifixshow: true,
                        prifixtext: 'INR',
                        // onchange: () {},
                        // controller:
                        //     controller,
                        maxline: 1,
                        // ontap: () {},
                        readonly: false,
                        text: 'Select',
                        // height: 40.0,
                        // minline: 1,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'Job Type *', text: 'Select'),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'Country *', text: 'Select'),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'Street *', text: 'Select'),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'State *', text: 'Select'),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'City *', text: 'Select'),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    children: [
                      Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  AppColors.greyprimarycolor),
                          child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                splashRadius: 5.0,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: AppColors.primaryColor,
                                // checkColor: AppColors.secondary2Color,
                                value: controller.agree.value,
                                onChanged: (value) {
                                  controller.agree.value = value ?? false;
                                },
                              ))),
                      widthSpace5,
                      Expanded(
                          child: Text(
                        'Current Employer',
                        style: BaseStyles.blacNormal14,
                      ))
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: textwidget2(
                            icon: Icons.calendar_today,
                            width: Get.width * 0.45,
                            name: 'Start Date',
                            text: 'Select'),
                      ),
                      Expanded(
                        child: textwidget2(
                            icon: Icons.calendar_today,
                            width: Get.width * 0.45,
                            name: 'End Date',
                            text: 'Select'),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      height: 150.0,
                      readonly: false,
                      onTap: () {},
                      minline: 5,
                      maxline: 5,
                      name: 'Summary',
                      text: 'Write'),
                  heightSpace20,
                ],
              ),
            ),
          ),
        ));
  }
}
