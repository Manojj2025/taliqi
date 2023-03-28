import 'package:taliqi/app/modules/profile_screens/views/userrule_view.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../controllers/settings_controllers.dart';
import 'billing_view.dart';
import 'companydetail_view.dart';
import 'email_view.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    return Scaffold(
        appBar: myappbar2(
            title: HomeName.Settings, show: false, show2: Container()),
        body: ListView(
          children: [
            Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 25,
                          child: Image.asset(
                            'assets/image/profile.png',
                          ),
                        ),
                        heightSpace10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Janki Bisht',
                              style: BaseStyles.blackmedium18,
                            ),
                            heightSpace3,
                            Text(
                              'janki@taliqi.com',
                              style: BaseStyles.grey2Medium14,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: decorationbox2(
                        radius: 30.0, color: AppColors.orangecolor),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          MyImages.edit,
                          height: 12,
                          width: 12,
                          color: AppColors.whiteColor,
                        ),
                        widthSpace5,
                        Text(
                          'Edit',
                          style: BaseStyles.whitenormal14,
                        )
                      ],
                    ),
                  ),
                  heightSpace10,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 0.3,
                        ),
                        heightSpace5,
                        list(
                          ontap: () {
                            Get.to(CompanydeatilsView());
                          },
                          icon: Icons.business_outlined,
                          name: 'Company Details',
                        ),
                        heightSpace5,
                        Divider(
                          thickness: 0.3,
                        ),
                        heightSpace5,
                        list(
                          ontap: () {
                            Get.to(UserandRuleView());
                          },
                          icon: Icons.group_add,
                          name: 'Users & Roles',
                        ),
                        heightSpace5,
                        Divider(
                          thickness: 0.3,
                        ),
                        heightSpace5,
                        list(
                          ontap: () {
                            Get.to(BillingView());
                          },
                          icon: Icons.credit_card,
                          name: 'Billing',
                        ),
                        heightSpace5,
                        Divider(
                          thickness: 0.3,
                        ),
                        heightSpace5,
                        list(
                          ontap: () {
                            Get.to(EmailView());
                          },
                          icon: Icons.email_outlined,
                          name: 'Email Configuration',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            heightSpace10,
            Container(
              width: Get.width,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    list(name: 'FAQs', show: Container()),
                    heightSpace5,
                    Divider(
                      thickness: 0.3,
                    ),
                    heightSpace5,
                    list(name: 'Help', show: Container()),
                    heightSpace5,
                    Divider(
                      thickness: 0.3,
                    ),
                    heightSpace5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: BaseStyles.blacNormal14,
                        ),
                        widthSpace10,
                        FlutterSwitch(
                          width: 35.0,
                          height: 18.0,
                          toggleSize: 16.0,
                          value: true,
                          borderRadius: 30.0,
                          padding: 2.0,
                          toggleColor: AppColors.whiteColor,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.greyprimarycolor.shade200,
                          onToggle: (val) {},
                        ),
                      ],
                    ),
                    heightSpace5,
                    Divider(
                      thickness: 0.3,
                    ),
                    heightSpace5,
                    list(name: 'Terms & Services', show: Container()),
                  ],
                ),
              ),
            ),
            heightSpace10,
            Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: decorationbox(
                      border: Border.all(
                          color: AppColors.greyprimarycolor.shade200),
                      radius: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.power_settings_new_outlined,
                          size: 16,
                          color: Color(0xff828282),
                        ),
                        widthSpace10,
                        Text('Logout',
                            style: GoogleFonts.roboto(
                              color: const Color(0xff828282),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  InkWell list({ontap, icon, name, show}) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              show ??
                  Icon(
                    icon,
                    color: AppColors.greycolor3,
                    size: 20,
                  ),
              show ?? widthSpace5,
              Text(
                name,
                style: BaseStyles.blacNormal14,
              )
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: AppColors.greycolor3,
            size: 20,
          )
        ],
      ),
    );
  }
}
