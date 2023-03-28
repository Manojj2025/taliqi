import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../Candidates_screens/views/candidateNewtask_view.dart';
import '../../interview_screens/views/createnewinterview.dart';
import '../controllers/bottombar_controller.dart';
import 'bottom_nav_item.dart';
import 'createnewjob_view.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BottombarController());

    controller.showTutorial(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: AppColors.secondarydarkColor,
          onPressed: () {
            print(controller.pageIndex.value);
            // controller.setPage(2);
            showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 0),
                    height: 240,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        Container(
                          height: 300,
                          color: Colors.transparent,
                          child: Container(
                            decoration: MyDecoration.radiusonlydecoration(
                                tlradius: 25.0, trradius: 25.0),
                            margin: const EdgeInsets.only(bottom: 50),
                            child: Column(
                              children: [
                                heightSpace20,
                                Container(
                                  height: 4,
                                  width: 160,
                                  decoration: MyDecoration.simpledecoration(
                                      color: AppColors.greyprimarycolor),
                                ),
                                heightSpace20,
                                Text(
                                  HomeName.create,
                                  style: BaseStyles.blackMedium16,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.to(CreatenewjobView());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(MyImages.jobs,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.greycolor2),
                                        widthSpace8,
                                        Text(
                                          HomeName.createjob,
                                          style: BaseStyles.blacNormal14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                heightSpace20,
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.to(CreatenewinterviewView());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(MyImages.interviews,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.greycolor2),
                                        widthSpace8,
                                        Text(
                                          HomeName.createinterview,
                                          style: BaseStyles.blacNormal14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                heightSpace20,
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.to(CandidateNewTaskView());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(MyImages.createcandidate,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.greycolor2),
                                        widthSpace8,
                                        Text(
                                          HomeName.createcandidate,
                                          style: BaseStyles.blacNormal14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // heightSpace20,
                                // InkWell(
                                //   onTap: () {
                                //     Get.back();
                                //     Get.to(AddNewClientView());
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 15.0),
                                //     child: Row(
                                //       children: [
                                //         Image.asset(MyImages.createclient,
                                //             height: 20,
                                //             width: 20,
                                //             color: AppColors.greycolor2),
                                //         widthSpace8,
                                //         Text(
                                //           HomeName.createclient,
                                //           style: BaseStyles.blacNormal14,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.whiteColor,
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: AppColors.greyprimarycolor,
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Icon(
            Icons.add,
            size: 35.sp,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
          color: AppColors.greyprimarycolor.shade200,
        ))),
        child: BottomAppBar(
          elevation: 0,
          notchMargin: 0,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: Obx(
            () => Row(children: [
              BottomNavItem(
                  iconData: MyImages.home,
                  name: BottombarName.home,
                  isSelected: controller.pageIndex.value == 0,
                  onTap: () => controller.setPage(0)),
              BottomNavItem(
                  iconData: MyImages.jobs,
                  name: BottombarName.jobs,
                  isSelected: controller.pageIndex.value == 1,
                  onTap: () => controller.setPage(1)),
              const Expanded(child: SizedBox()),
              BottomNavItem(
                  iconData: MyImages.interviews,
                  name: BottombarName.interviews,
                  isSelected: controller.pageIndex.value == 2,
                  onTap: () => controller.setPage(2)),
              BottomNavItem(
                  iconData: MyImages.more,
                  name: BottombarName.more,
                  isSelected: controller.pageIndex.value == 3,
                  onTap: () => controller.setPage(3)),
            ]),
          ),
        ),
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.children.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return controller.children[index];
        },
      ),
    );
  }
}
