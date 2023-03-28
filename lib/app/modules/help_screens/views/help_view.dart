import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/decoration.dart';
import '../controllers/help_controller.dart';
import 'addnewhelp.dart';
import 'helpdetails_view.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HelpController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            HomeName.HelpDesk,
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
                    onTap: () {
                      Get.to(AddHelpNewView());
                    },
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
                  )
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            heightSpace10,
            _name(), heightSpace10,
            _list()
            // _listWidget()
          ],
        ));
  }

  ////////////////////chat list widget ui////////////////////////////////
  _list() {
    return Expanded(
      child: Container(
        width: Get.width,
        color: AppColors.whiteColor,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(HelpdetailView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // widthSpace10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '#808097977954333',
                                      style: BaseStyles.blackMedium16,
                                    ),
                                    widthSpace5,
                                    index == 1
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 3),
                                            decoration: decorationbox2(
                                                color: AppColors.primaryColor2
                                                    .withOpacity(0.2),
                                                radius: 30.0),
                                            child: Text(
                                              'New',
                                              style: BaseStyles.greennormal12,
                                            ),
                                          )
                                  ],
                                ),
                                heightSpace3,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: AppColors.greycolor3,
                                      size: 15,
                                    ),
                                    widthSpace3,
                                    Text(
                                      '07/02/2023',
                                      style: BaseStyles.grey2normal12,
                                    ),
                                    widthSpace5,
                                    Icon(
                                      Icons.flag_outlined,
                                      color: AppColors.redcolor,
                                      size: 15,
                                    ),
                                    widthSpace3,
                                    Text(
                                      'Urgent',
                                      style: BaseStyles.grey2normal12,
                                    ),
                                  ],
                                ),
                                heightSpace5,
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: decorationbox2(
                                  color: index == 1
                                      ? AppColors.greyprimarycolor.shade200
                                      : AppColors.primaryColor2,
                                  radius: 30.0),
                              child: Text(
                                index == 1 ? 'Close' : 'Open',
                                style: index == 1
                                    ? BaseStyles.grey3Normal12
                                    : BaseStyles.whitenormal12,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 10.0,
                          height: 25,
                          color: AppColors.greyprimarycolor.shade100,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  ////////////////////name list widget ui////////////////////////////////
  _name() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.jobselectname.value =
                              controller.list[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.jobselectname.value ==
                                      controller.list[index]['name']
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              border: Border.all(
                                  color: AppColors.greyprimarycolor,
                                  width: 0.2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              "${controller.list[index]['name'].toString()}  ${controller.list[index]['value'].toString()}",
                              style: controller.jobselectname.value ==
                                      controller.list[index]['name']
                                  ? BaseStyles.whitemedium14
                                  : BaseStyles.greyMedium14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
