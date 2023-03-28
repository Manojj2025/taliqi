import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taliqi/app/widgets/decoration.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/filters.dart';
import '../controllers/candidates_controller.dart';
import 'candidateNewtask_view.dart';
import 'candidatesdetail_view.dart';

class CandidatesView extends GetView<CandidatesController> {
  const CandidatesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CandidatesController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Text(
            HomeName.candidates,
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
                      Get.to(CandidateNewTaskView());
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
                            height: 0.5,
                            context: context,
                            controller: controller,
                            sortlist: controller.sortlist);
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
            _name(), heightSpace10,
            _listWidget()
          ],
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

  //////////////////// job application list widget ui////////////////////////////////
  _listWidget() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            controller.save.clear();
            for (var i = 0; i < 10; i++) {
              controller.save.add(false);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const CandidatesdetailView());
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
                                          'Nikita Sharma',
                                          style: BaseStyles.blackMedium16,
                                        ),
                                        widthSpace3,
                                        index == 0
                                            ? Icon(
                                                Icons.info,
                                                color: AppColors.redcolor,
                                                size: 16,
                                              )
                                            : Container()
                                      ],
                                    ),
                                    heightSpace5,
                                    Text(
                                      'Tech Mahindra',
                                      style: BaseStyles.grey2Medium12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Obx(
                                () => Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (controller.save[index] == true) {
                                          controller.save[index] = false;
                                        } else {
                                          controller.save[index] = true;
                                        }
                                      },
                                      child: Icon(
                                        controller.save[index] == true
                                            ? Icons.bookmark
                                            : Icons.bookmark_border_rounded,
                                        size: 16,
                                        color: controller.save[index] == true
                                            ? AppColors.yellowcolor
                                            : AppColors.greyprimarycolor,
                                      ),
                                    ),
                                    widthSpace10,
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(
                                            minWidth: 0, minHeight: 0),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert_outlined,
                                          size: 16,
                                          color: AppColors.greyprimarycolor,
                                        )),
                                  ],
                                ),
                              ),
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
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.greycolor2,
                                  size: 18,
                                ),
                                widthSpace3,
                                Text(
                                  'New Delhi',
                                  style: BaseStyles.grey2Medium12,
                                )
                              ],
                            ),
                            widthSpace10,
                            Row(
                              children: [
                                Image.asset(
                                  MyImages.bag,
                                  color: AppColors.greycolor2,
                                  height: 16,
                                  width: 16,
                                ),
                                widthSpace3,
                                Text(
                                  '14 year',
                                  style: BaseStyles.grey2Medium12,
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
                              style: BaseStyles.grey2Medium12,
                            )
                          ],
                        ),
                        Divider(
                          thickness: 0.5,
                        ),

                        // heightSpace10,
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'MS Office,MIS,Tally,Exce...',
                                    style: BaseStyles.grey3Normal12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
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
                                          heightFactor: 0.5,
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
                                                    'Applied Jobs (2)',
                                                    style: BaseStyles
                                                        .blackMedium16,
                                                  ),
                                                  heightSpace10,
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
                                                          return Column(
                                                            children: [
                                                              ListTile(
                                                                horizontalTitleGap:
                                                                    2.0,
                                                                dense: true,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15),
                                                                title: Text(
                                                                  'Nikita Sharma',
                                                                  style: BaseStyles
                                                                      .blacNormal14,
                                                                ),
                                                                subtitle: Text(
                                                                  'Tech Mahindra, 1st Sep 22',
                                                                  style: BaseStyles
                                                                      .grey2Medium12,
                                                                ),
                                                                leading:
                                                                    CircleAvatar(
                                                                  // backgroundColor: AppColors.primaryColor,
                                                                  radius: 16,
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/image/bajaj.png'),
                                                                ),
                                                              ),
                                                              index == 1
                                                                  ? Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          30,
                                                                      width: Get
                                                                              .width *
                                                                          0.90,
                                                                      decoration: decorationbox2(
                                                                          radius:
                                                                              5.0,
                                                                          color: AppColors
                                                                              .primaryColor
                                                                              .withOpacity(0.2)),
                                                                      child:
                                                                          Text(
                                                                        'Pending',
                                                                        style: BaseStyles
                                                                            .greennormal14,
                                                                      ),
                                                                    )
                                                                  : Container(),
                                                              Divider(
                                                                thickness: 0.5,
                                                              ),
                                                            ],
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
                                child: Text(
                                  'Applied Jobs (2)',
                                  style: BaseStyles.orangenormal14,
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
