import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';
import 'package:taliqi/app/widgets/textfiled.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/search.dart';
import '../controllers/jobdetail_controller.dart';

class InviteCandidateView extends GetView<JobdetailController> {
  const InviteCandidateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => JobdetailController());
    return Scaffold(
        appBar: myappbar2(show: false, title: JobsName.InviteCandidate),
        body: Obx(
          () => Column(
            children: [
              Container(
                color: AppColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            // backgroundColor: AppColors.primaryColor,
                            radius: 20,
                            child: Image.asset('assets/image/bajaj.png'),
                          ),
                          widthSpace10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'UI/UX Designer',
                                    style: BaseStyles.blackMedium16,
                                  ),
                                  widthSpace5,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: decorationbox2(
                                        color: AppColors.primaryColor2
                                            .withOpacity(0.2),
                                        radius: 30.0),
                                    child: Text(
                                      '4 Selected',
                                      style: BaseStyles.greenMedium11,
                                    ),
                                  )
                                ],
                              ),
                              heightSpace5,
                              Text(
                                'Tech Mahindra',
                                style: BaseStyles.grey2normal12,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              heightSpace10,
              _name(),
              // heightSpace10,
              controller.selectinvitelist.value == 'Recommended Candidates'
                  ? _jobrecommaneded('Recommended Candidates')
                  : controller.selectinvitelist.value == 'All Candidates'
                      ? _jobrecommaneded('All Candidates')
                      : _jobrecommaneded('Search for Candidate'),
              mybuttons(
                  width: Get.width * 0.95,
                  action: () {
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
                            heightFactor: 0.45,
                            child: Container(
                              // height: 300,
                              decoration: MyDecoration.radiusonlydecoration(
                                  tlradius: 25.0, trradius: 25.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    heightSpace20,
                                    Align(
                                      child: Container(
                                        height: 4,
                                        width: 160,
                                        decoration:
                                            MyDecoration.simpledecoration(
                                                color:
                                                    AppColors.greyprimarycolor),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/image/invite.png',
                                      height: 180,
                                      width: Get.width,
                                    ),
                                    heightSpace10,
                                    Text(
                                      'Invitation Sent Successfully!',
                                      style: BaseStyles.blackMedium16,
                                    ),
                                    heightSpace3,
                                    Text(
                                      'information on its origins, as well as a random Lipsum generator.',
                                      style: BaseStyles.grey2normal14,
                                      textAlign: TextAlign.center,
                                    ),
                                    heightSpace20,
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  name: 'Invite Candidates',
                  color: AppColors.orangecolor,
                  height: 40.0),
            ],
          ),
        ));
  }

  //////////////////// job name list widget ui////////////////////////////////
  _name() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.invitelist.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.selectinvitelist.value =
                              controller.invitelist[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectinvitelist.value ==
                                      controller.invitelist[index]['name']
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              border: Border.all(
                                  color: AppColors.greyprimarycolor,
                                  width: 0.2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              "${controller.invitelist[index]['name'].toString()}",
                              style: controller.selectinvitelist.value ==
                                      controller.invitelist[index]['name']
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

  ////////jobrecomm////////////////////////////////

  Widget _jobrecommaneded(name) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: Get.width,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              heightSpace10,
              name == 'Search for Candidate'
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search for Candidate',
                            style: BaseStyles.blackMedium14,
                          ),
                          heightSpace10,
                          heightSpace5,
                          textfiled(
                            prifixshow: true,
                            prefixtext: Icon(
                              Icons.search,
                              size: 25,
                            ),
                            prifixiconshow: true,
                            // prefixicon: Icon(Icons.search),
                            suffixsize: 20.0,
                            eyeshow: false,
                            // suffixontab: () {
                            //   // controller.showseach.value = false;
                            // },

                            style: BaseStyles.grey3Normal16,
                            // controller: controller.emailtxt,
                            readonly: false,
                            text: 'Search',
                            suffixicon: null,
                            // suffixIconcolor: AppColors.greyprimarycolor,
                          )
                        ],
                      ),
                    )
                  : Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.showseach.value == true
                              ? Expanded(
                                  child: textfiled(
                                  suffixsize: 20.0,
                                  eyeshow: true,
                                  suffixontab: () {
                                    controller.showseach.value = false;
                                  },

                                  style: BaseStyles.grey3Normal16,
                                  // controller: controller.emailtxt,
                                  readonly: false,
                                  text: 'Search',
                                  suffixicon: Icons.close,
                                  suffixIconcolor: AppColors.greyprimarycolor,
                                ))
                              : Row(
                                  children: [
                                    Text(
                                      name ?? '',
                                      style: BaseStyles.blackMedium14,
                                    )
                                  ],
                                ),
                          Row(
                            children: [
                              controller.showseach.value != true
                                  ? IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(
                                          minWidth: 0, minHeight: 0),
                                      onPressed: () {
                                        controller.showseach.value = true;
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        color: AppColors.greyprimarycolor,
                                      ))
                                  : Container(),
                              widthSpace20,
                              Image.asset(
                                MyImages.filter,
                                height: 20,
                                width: 20,
                                color: AppColors.greyprimarycolor,
                              ),
                              widthSpace10
                            ],
                          ),
                          // widthSpace10
                        ],
                      ),
                    ),
              _listrecomWidget()
            ],
          ),
        ),
      ),
    );
  }

  //////////////////// job application list widget ui////////////////////////////////
  _listrecomWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace10,
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        const Divider(
                          thickness: 0.5,
                        ),
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
                                          'Manoj Sharma',
                                          style: BaseStyles.blackMedium14,
                                        ),
                                      ],
                                    ),
                                    heightSpace5,
                                    Text(
                                      'Web Developer',
                                      style: BaseStyles.grey2Medium12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Theme(
                                data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        AppColors.greyprimarycolor),
                                child: SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      splashRadius: 5.0,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: AppColors.primaryColor,
                                      // checkColor: AppColors.secondary2Color,
                                      value: controller.agree.value,
                                      onChanged: (value) {
                                        controller.agree.value = value ?? false;
                                      },
                                    ))),
                          ],
                        ),
                        heightSpace10,
                        heightSpace5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.greyprimarycolor,
                                  size: 18,
                                ),
                                widthSpace3,
                                Text(
                                  'Gurgaon',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            widthSpace10,
                            Row(
                              children: [
                                Image.asset(
                                  MyImages.bag,
                                  color: AppColors.greyprimarycolor,
                                  height: 16,
                                  width: 16,
                                ),
                                widthSpace3,
                                Text(
                                  '14 year',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            widthSpace10,
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.person_outline,
                            //       color: AppColors.greyprimarycolor,
                            //       size: 18,
                            //     ),
                            //     widthSpace3,
                            //     Text(
                            //       '12 Candidates',
                            //       style: BaseStyles.lightblackMedium12,
                            //     )
                            //   ],
                            // ),
                            Text(
                              '₹ 20 LPA',
                              style: BaseStyles.lightblackMedium12,
                            )
                          ],
                        ),

                        // heightSpace10,
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LinearPercentIndicator(
                                  alignment: MainAxisAlignment.start,
                                  width: Get.width * 0.80,
                                  lineHeight: 6.0,
                                  percent: 0.5,
                                  animation: true,
                                  barRadius: const Radius.circular(20),
                                  // center:
                                  //     Text("50.0%", style: BaseStyles.whitebold14),
                                  // trailing: Icon(Icons.mood),

                                  backgroundColor: AppColors.greyprimarycolor
                                      .withOpacity(0.6),
                                  progressColor: AppColors.orangecolor),
                              Text(
                                '70%',
                                style: BaseStyles.lightblackMedium14,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // heightSpace10
              ],
            );
          }),
    );
  }
}
