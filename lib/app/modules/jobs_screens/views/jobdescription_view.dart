import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/createnewjob_controller.dart';

class JobdescriptionView extends GetView<CreatenewjobController> {
  const JobdescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreatenewjobController());
    return Scaffold(
        appBar: myappbar2(
            show: false,
            title: JobsName.jobdescription,
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
        body: Container(
          height: Get.height,
          width: Get.width,
          color: AppColors.whiteColor,
          child: textwidget(
            onTap: () {
              if (controller.descriptionstext.text == '') {
                controller.show2.value = false;
              } else {
                controller.show2.value = true;
              }
            },
            minline: 500,
            controller: controller.descriptionstext,
            maxline: 500,
            text: 'Enter Job description',
          ),
        ));
  }

  textwidget({text, minline, readonly, onTap, maxline, controller}) {
    return textfiled(
      style: BaseStyles.blacNormal16,
      ontap: onTap,
      controller: controller,
      readonly: readonly ?? false,
      text: text,
      height: Get.height,
      maxline: maxline,
      minline: minline,
    );
  }
}
