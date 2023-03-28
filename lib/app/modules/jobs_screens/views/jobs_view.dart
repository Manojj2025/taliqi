import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/filters.dart';
import '../controllers/jobs_controller.dart';
import 'invitecandidate.dart';
import 'jobdetail_view.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => JobsController());
    return Scaffold(
        appBar: myappbar(),
        body: Column(
          children: [
            //// filters and soryby widget ui//////
            Card(
              elevation: 0,
              color: AppColors.whiteColor,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        filter(context, controller);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            MyImages.filter,
                            height: 20,
                            width: 20,
                          ),
                          widthSpace10,
                          Text(
                            JobsName.filters,
                            style: BaseStyles.lightblackMedium14,
                          ),
                          widthSpace5,
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              '2',
                              style: BaseStyles.whitesmall10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: AppColors.greyprimarycolor,
                    ),
                    InkWell(
                      onTap: () {
                        sortby(
                            context: context,
                            controller: controller,
                            height: 0.4);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            MyImages.sort,
                            height: 20,
                            width: 20,
                          ),
                          widthSpace10,
                          Text(
                            JobsName.sortby,
                            style: BaseStyles.lightblackMedium14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //////////////////// job name list widget ui////////////////////////////////
            heightSpace10,
            _jobname(), heightSpace10,
            _listWidget()
          ],
        ));
  }

  //////////////////// job name list widget ui////////////////////////////////
  _jobname() {
    return Container(
      height: 50,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.joblist.length,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              (() => Row(
                    children: [
                      widthSpace10,
                      InkWell(
                        onTap: () {
                          controller.jobselectname.value =
                              controller.joblist[index]['name'].toString();
                        },
                        child: Container(
                          height: 30,
                          // width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.jobselectname.value ==
                                      controller.joblist[index]['name']
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
                              "${controller.joblist[index]['name'].toString()} (${controller.joblist[index]['value'].toString()})",
                              style: controller.jobselectname.value ==
                                      controller.joblist[index]['name']
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

  //////////////////// job list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const JobdetailView());
                  },
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          decoration: decorationbox2(
                                              color: AppColors.primaryColor2
                                                  .withOpacity(0.2),
                                              radius: 30.0),
                                          child: Text(
                                            '6 new',
                                            style: BaseStyles.greenMedium11,
                                          ),
                                        )
                                      ],
                                    ),
                                    heightSpace5,
                                    Text(
                                      'Tech Mahindra',
                                      style: BaseStyles.blackMedium12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                onPressed: () {
                                  jobedit(
                                    height: 0.45,
                                    ontab: (value) {
                                      switch (value) {
                                        case 0:
                                          Get.back();
                                          Get.to(JobdetailView());
                                          break;
                                        case 1:
                                          Get.back();
                                          Get.to(InviteCandidateView());
                                          break;
                                        case 5:
                                          Get.back();
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    titlePadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    // <-- SEE HERE
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Are you sure want to delete?',
                                                          style: BaseStyles
                                                              .blackMedium16,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: AppColors
                                                                  .greyprimarycolor,
                                                            ))
                                                      ],
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                            'Reference site about Loerm ipusm, giving information on the on.',
                                                            style: BaseStyles
                                                                .grey2normal14,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        8),
                                                            decoration: decorationbox(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .greyprimarycolor
                                                                        .shade200),
                                                                radius: 5.0),
                                                            child: Text(
                                                              'Close',
                                                              style: BaseStyles
                                                                  .blacNormal14,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        8),
                                                            decoration: decorationbox(
                                                                color: AppColors
                                                                    .secondarydarkColor,
                                                                radius: 5.0),
                                                            child: Text(
                                                              'Delete',
                                                              style: BaseStyles
                                                                  .whitenormal14,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  ));
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
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  size: 16,
                                  color: AppColors.greyprimarycolor,
                                )),
                          ],
                        ),
                        heightSpace10,
                        heightSpace5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  'New Delhi',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_sharp,
                                  size: 18,
                                  color: AppColors.greyprimarycolor,
                                ),
                                widthSpace3,
                                Text(
                                  '21 Aug',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: AppColors.greyprimarycolor,
                                  size: 18,
                                ),
                                widthSpace3,
                                Text(
                                  '12 Candidates',
                                  style: BaseStyles.lightblackMedium12,
                                )
                              ],
                            ),
                            Text(
                              '₹ 20 LPA',
                              style: BaseStyles.lightblackMedium12,
                            )
                          ],
                        ),
                        heightSpace5,
                        Divider(
                          thickness: 0.5,
                        ),
                        // heightSpace10,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MS Office,MIS,Tally,Exce...',
                                style: BaseStyles.lightblackMedium12,
                              ),
                              InkWell(
                                onTap: () {
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
                                          heightFactor: 0.3,
                                          child: Container(
                                            // height: 300,
                                            decoration: MyDecoration
                                                .radiusonlydecoration(
                                                    tlradius: 25.0,
                                                    trradius: 25.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  heightSpace20,
                                                  Container(
                                                    height: 4,
                                                    width: 160,
                                                    decoration: MyDecoration
                                                        .simpledecoration(
                                                            color: AppColors
                                                                .greyprimarycolor),
                                                  ),
                                                  heightSpace20,
                                                  Text(
                                                    'Job Status',
                                                    style: BaseStyles
                                                        .blackMedium16,
                                                  ),
                                                  // heightSpace10,
                                                  ////

                                                  heightSpace10,
                                                  Expanded(
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: 3,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return ListTile(
                                                            minVerticalPadding:
                                                                0.0,
                                                            minLeadingWidth:
                                                                30.0,
                                                            horizontalTitleGap:
                                                                0.0,
                                                            visualDensity:
                                                                VisualDensity(
                                                                    horizontal:
                                                                        -0.4,
                                                                    vertical:
                                                                        -0.4),
                                                            dense: true,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15),
                                                            title: Text(
                                                              index == 0
                                                                  ? 'Active'
                                                                  : index == 1
                                                                      ? 'Inactive'
                                                                      : 'Close',
                                                              style: BaseStyles
                                                                  .grey1Medium14,
                                                            ),
                                                            leading:
                                                                CircleAvatar(
                                                              radius: 5,
                                                              backgroundColor: index ==
                                                                      0
                                                                  ? AppColors
                                                                      .activecolor
                                                                  : index == 1
                                                                      ? AppColors
                                                                          .orangecolor
                                                                      : AppColors
                                                                          .blackColor,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.activecolor,
                                    ),
                                    widthSpace5,
                                    Text(
                                      'Active',
                                      style: BaseStyles.greyNormal12,
                                    ),
                                    widthSpace5,
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.greyprimarycolor,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
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
