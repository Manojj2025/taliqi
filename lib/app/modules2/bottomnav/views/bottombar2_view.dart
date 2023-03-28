import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/values.dart';
import '../controllers/bottombar2_controller.dart';

class BottomBar2View extends GetView<BottomBar2Controller> {
  const BottomBar2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BottomBar2Controller());
    return Obx(
      () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: AppColors.greyprimarycolor,
              unselectedLabelStyle: robotoMedium.copyWith(
                fontSize: Dimensions.fontSizeSmall,
                color: AppColors.greyprimarycolor,
              ),
              backgroundColor: Color(0xffF9F9F9),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.secondarydarkColor,
              selectedLabelStyle: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: AppColors.secondarydarkColor),
              onTap: controller.onTabTapped,
              currentIndex: controller
                  .currentIndex.value, // this will be set when a tab is tapped
              items: [
                BottomNavigationBarItem(
                  label: BottombarName.home,
                  icon: Image.asset(
                    MyImages.home,
                    color: controller.currentIndex.value == 0
                        ? AppColors.secondarydarkColor
                        : AppColors.greyprimarycolor,
                    height: 25,
                    width: 25,
                  ),
                ),
                BottomNavigationBarItem(
                  label: BottombarName.jobs,
                  icon: Image.asset(
                    MyImages.jobs,
                    color: controller.currentIndex.value == 1
                        ? AppColors.secondarydarkColor
                        : AppColors.greyprimarycolor,
                    height: 25,
                    width: 25,
                  ),
                ),
                BottomNavigationBarItem(
                  label: BottombarName.interviews,
                  icon: Image.asset(
                    MyImages.interviews,
                    height: 25,
                    width: 25,
                    color: controller.currentIndex.value == 2
                        ? AppColors.secondarydarkColor
                        : AppColors.greyprimarycolor,
                  ),
                ),
                BottomNavigationBarItem(
                  label: BottombarName.Resume,
                  icon: Image.asset(
                    MyImages.cv,
                    height: 25,
                    width: 25,
                    color: controller.currentIndex.value == 3
                        ? AppColors.secondarydarkColor
                        : AppColors.greyprimarycolor,
                  ),
                ),
              ]),
          body: controller.children[controller.currentIndex.value]),
    );
  }
}
