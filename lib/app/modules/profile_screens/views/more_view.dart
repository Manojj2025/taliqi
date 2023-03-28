import 'package:taliqi/app/modules/profile_screens/views/settings_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../Candidates_screens/views/candidates_view.dart';
import '../../help_screens/views/help_view.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MoreController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: myappbar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Get.to(SettingsView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 25,
                          child: Image.asset(
                            'assets/image/profile.png',
                          ),
                        ),
                        widthSpace10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: AppColors.greyprimarycolor,
                      size: 30,
                    )
                  ],
                ),
              ),
              heightSpace20,
              ListView.separated(
                  separatorBuilder: ((context, index) => Divider(
                        thickness: 0.5,
                        height: 4.8,
                      )),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.profillist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(CandidatesView());

                              break;

                            case 7:
                              Get.to(HelpView());

                              break;

                            default:
                          }
                        },
                        horizontalTitleGap: 0.0,
                        visualDensity:
                            VisualDensity(horizontal: -0.4, vertical: -0.4),
                        contentPadding: EdgeInsets.zero,
                        // minVerticalPadding: 0.0,
                        dense: true,
                        leading: Image.asset(
                          controller.profillist[index]['image'].toString(),
                          height: 22,
                          width: 22,
                        ),
                        title: Text(
                          controller.profillist[index]['name'].toString(),
                          style: BaseStyles.blacNormal16,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
