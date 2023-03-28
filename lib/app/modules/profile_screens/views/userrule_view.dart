import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/filters.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/userrule_controller.dart';

class UserandRuleView extends GetView<UserruleController> {
  const UserandRuleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserruleController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            HomeName.UsersRoles,
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
                      jobedit(
                        height: 0.25,
                        ontab: (value) {
                          switch (value) {
                            case 0:
                              Get.back();
                              showModalBottomSheet(
                                  isDismissible: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.8,
                                      child: Container(
                                        // height: 300,
                                        decoration:
                                            MyDecoration.radiusonlydecoration(
                                                tlradius: 25.0, trradius: 25.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                heightSpace20,
                                                Align(
                                                  child: Container(
                                                    height: 4,
                                                    width: 160,
                                                    decoration: MyDecoration
                                                        .simpledecoration(
                                                            color: AppColors
                                                                .greyprimarycolor),
                                                  ),
                                                ),
                                                heightSpace20,
                                                Align(
                                                  child: Text(
                                                    'Create New User',
                                                    style: BaseStyles
                                                        .blackMedium16,
                                                  ),
                                                ),
                                                heightSpace20,
                                                textwidget(
                                                    name: 'First Name*',
                                                    text: 'Enter'),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                textwidget(
                                                    name: 'Last Name*',
                                                    text: 'Enter'),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                textwidget(
                                                    name: 'Email*',
                                                    text: 'Enter'),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                textwidget2(
                                                    name: 'Role*',
                                                    text: 'Select'),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                textwidget2(
                                                    name: 'Reporting Manager*',
                                                    text: 'Select'),
                                                const Divider(
                                                  thickness: 0.3,
                                                  height: 25,
                                                ),
                                                heightSpace10,

                                                // heightSpace5,
                                                // Expanded(child: Container()),
                                                mybuttons(
                                                    // style:
                                                    //     BaseStyles.grey2medium16,
                                                    name: 'Create',
                                                    color:
                                                        AppColors.orangecolor,
                                                    height: 45.0)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                              // Get.to(LeadNewTaskView());

                              break;
                            default:
                          }
                        },
                        context: context,
                        controller: controller,
                        listname: controller.editlist,
                        icon: controller.editlist,
                      );
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
          children: [_listWidget()],
        ));
  }

  //////////////////// job list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
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
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  // backgroundColor: AppColors.primaryColor,
                                  radius: 18,
                                  child: Image.asset('assets/image/bajaj.png'),
                                ),
                                widthSpace10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Kristin Watson',
                                          style: BaseStyles.blackMedium14,
                                        ),
                                        // widthSpace5,
                                        // Container(
                                        //   padding: EdgeInsets.symmetric(
                                        //       horizontal: 8, vertical: 3),
                                        //   decoration: decorationbox2(
                                        //       color: AppColors.primaryColor2
                                        //           .withOpacity(0.2),
                                        //       radius: 30.0),
                                        //   child: Text(
                                        //     '6 new',
                                        //     style: BaseStyles.greenMedium11,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    heightSpace5,
                                    Text(
                                      'vivek.p@taliqi.com',
                                      style: BaseStyles.grey2normal12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              MyImages.edit,
                              height: 13,
                              width: 13,
                              color: AppColors.greycolor3,
                            )
                          ],
                        ),
                        heightSpace10,
                        heightSpace5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: decorationbox2(
                                      color: index == 3
                                          ? AppColors.redcolor.withOpacity(0.1)
                                          : AppColors.primaryColor2
                                              .withOpacity(0.1),
                                      radius: 30.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 3,
                                          backgroundColor: index == 3
                                              ? Colors.red
                                              : Color(0xff02E140)),
                                      widthSpace5,
                                      Text(
                                        index == 3 ? 'Suspend' : 'Active',
                                        style: index == 3
                                            ? BaseStyles.redNormal12
                                            : BaseStyles.greennormal12,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            widthSpace10,
                            Row(
                              children: [
                                Image.asset(
                                  'assets/image/lock.png',
                                  color: AppColors.greycolor3,
                                  height: 10,
                                  width: 10,
                                ),
                                widthSpace5,
                                Text(
                                  'Admin User',
                                  style: BaseStyles.grey2normal12,
                                )
                              ],
                            ),
                            widthSpace10,
                            Row(
                              children: [
                                Icon(
                                  Icons.personal_injury_outlined,
                                  color: AppColors.greycolor3,
                                  size: 11,
                                ),
                                widthSpace5,
                                Text(
                                  'No Manager',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                          ],
                        ),
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
