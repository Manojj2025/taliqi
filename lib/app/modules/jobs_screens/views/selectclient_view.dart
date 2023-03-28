import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/modules/jobs_screens/controllers/selectclient_controller.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';

class SelectclientView extends GetView<SelectclientController> {
  const SelectclientView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SelectclientController());
    return Scaffold(
      appBar: myappbar2(show: false, title: JobsName.selectclient),
      body: Container(
        color: AppColors.whiteColor,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.selected.value = index;
                      },
                      child: ListTile(
                        horizontalTitleGap: 0.0,
                        dense: true,
                        title: Text(
                          'Bajaj Ltd.',
                          style: BaseStyles.blacNormal14,
                        ),
                        subtitle: Text(
                          'Noida',
                          style: BaseStyles.grey2Medium12,
                        ),
                        // contentPadding: const EdgeInsets.only(left: 5),
                        leading: CircleAvatar(
                          // backgroundColor: AppColors.primaryColor,
                          radius: 16,
                          child: Image.asset(
                            'assets/image/bajaj.png',
                          ),
                        ),
                        trailing: Obx(
                          () => Radio(
                            activeColor: AppColors.primaryColor,
                            visualDensity: const VisualDensity(
                                horizontal: -0.4, vertical: -0.4),
                            value: controller.selected.value,
                            groupValue: index,
                            onChanged: (value) {
                              controller.selected.value = index;
                              // if (controller
                              //         .selected
                              //         .value ==
                              //     index) {
                              //   controller
                              //           .selectaddressdata =
                              //       data;
                              //   showToast('Selected');
                              //   // controller.box.write('addresstype',
                              //   //     controller.selectaddressdata!.type);
                              //   print(controller
                              //       .selectaddressdata);
                              // } else {
                              //   // controller.selectaddressdata;
                              // }
                            },
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      thickness: 0.3,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
