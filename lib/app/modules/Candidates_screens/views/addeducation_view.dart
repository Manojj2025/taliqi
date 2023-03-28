import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/candidatesdetail_controller.dart';

class AddEducationView extends GetView<CandidatesdetailController> {
  const AddEducationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CandidatesdetailController());
    return Scaffold(
        appBar: myappbar2(
            show: false,
            title: 'Add Education',
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
                  textwidget2(
                      name: 'Qualification*',
                      text: 'Select',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      name: 'Institute Name*',
                      text: 'Enter',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      name: 'University Name *',
                      text: 'Enter',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      name: 'Qualification Title *',
                      text: 'Enter',
                      onTap: () {
                        // select(context);
                      }),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget2(name: 'Type *', text: 'Select'),
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
                            name: 'Joining Year *',
                            text: 'Select'),
                      ),
                      Expanded(
                        child: textwidget2(
                            icon: Icons.calendar_today,
                            width: Get.width * 0.45,
                            name: 'Passing Year *',
                            text: 'Select'),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    height: 25,
                  ),
                  textwidget(
                      name: 'Result *',
                      text: 'Enter',
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
