import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/constants/values.dart';
import 'package:taliqi/app/modules/jobs_screens/controllers/enterjob_controller.dart';

import '../../../constants/strings.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/createnewjob_controller.dart';

class EnterjobView extends GetView<CreatenewjobController> {
  const EnterjobView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreatenewjobController());
    return Scaffold(
        appBar: myappbar2(show: false, title: JobsName.jobtitle),
        body: Column(
          children: [
            textfiled5(
                suffixIcon: Obx(
                  () => !controller.show.value
                      ? Container()
                      : CircleAvatar(
                          radius: 13,
                          backgroundColor: AppColors.greyprimarycolor,
                          child: const Icon(
                            Icons.clear,
                            color: AppColors.whiteColor,
                            size: 15,
                          ),
                        ),
                ),
                onclear: () {
                  controller.searchtxt.clear();
                  controller.show.value = false;
                },
                controller: controller.searchtxt,
                text: 'Enter Job Title',
                ontap: () {
                  Get.to(EnterjobView());
                }),
            Divider(
              thickness: 0.5,
              height: 0.5,
            ),
            Expanded(
              child: Container(
                color: AppColors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace10,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Trending Jobs',
                        style: BaseStyles.grey3Normal12,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                onTap: () {
                                  controller.show.value = true;
                                  controller.searchtxt.text = 'Php Developer';
                                },
                                horizontalTitleGap: 0.0,
                                dense: true,
                                title: Text(
                                  'Php Developer',
                                  style: BaseStyles.blacNormal14,
                                ),

                                // contentPadding: const EdgeInsets.only(left: 5),
                                leading: Image.asset(
                                  'assets/image/trend.png',
                                  height: 20,
                                  width: 20,
                                  color: AppColors.greycolor2,
                                ));
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
