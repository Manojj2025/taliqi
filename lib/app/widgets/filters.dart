import 'package:taliqi/app/constants/app_basestyles.dart';
import 'package:taliqi/app/constants/values.dart';
import 'package:taliqi/app/widgets/buttons.dart';
import 'package:taliqi/app/widgets/search.dart';
import 'package:taliqi/app/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'decoration.dart';
import 'jobdetailwidget.dart';

filter(context, controller) {
  return showModalBottomSheet(
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
            decoration: MyDecoration.radiusonlydecoration(
                tlradius: 25.0, trradius: 25.0),
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
                  HomeName.filters,
                  style: BaseStyles.blackMedium16,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.filterlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        controller.selectfilter.value = '';
                        return Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.selectfilter.value !=
                                        controller.filterlist[index]) {
                                      controller.selectfilter.value =
                                          controller.filterlist[index];
                                    } else {
                                      controller.selectfilter.value = '';
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.filterlist[index]
                                                .toString(),
                                            style: BaseStyles.blacNormal14,
                                          ),
                                          widthSpace5,
                                          index == 0
                                              ? CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      AppColors.primaryColor,
                                                  child: Text(
                                                    '2',
                                                    style:
                                                        BaseStyles.whitesmall10,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Icon(
                                        controller.selectfilter.value !=
                                                controller.filterlist[index]
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up,
                                        color: AppColors.greyprimarycolor,
                                      ),
                                    ],
                                  ),
                                ),
                                heightSpace10,
                                index == 0 &&
                                        controller.selectfilter.value ==
                                            controller.filterlist[index]
                                    ? mysearch(
                                        width: Get.width * 0.90,
                                        readonly: true,
                                        decoration: decorationbox2(
                                            radius: 5.0,
                                            color: AppColors
                                                .greyprimarycolor.shade200))
                                    : Container(),
                                heightSpace10,
                                controller.filterlist[index] == 'Experience' &&
                                        controller.selectfilter.value ==
                                            'Experience'
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          heightSpace10,
                                          Text(
                                            'Experience (In Years)*',
                                            style: BaseStyles.blacNormal14,
                                          ),
                                          Theme(
                                            data: ThemeData(
                                                accentColor: Colors.black),
                                            child: SfRangeSelector(
                                              activeColor:
                                                  AppColors.primaryColor,
                                              min: 0,
                                              max: 10,
                                              initialValues:
                                                  SfRangeValues(0, 10),
                                              labelPlacement:
                                                  LabelPlacement.onTicks,
                                              interval: 2,
                                              showTicks: true,
                                              showLabels: true,
                                              child: Container(),
                                            ),
                                          ),

                                          // SfRangeSelector(
                                          //   labelPlacement:
                                          //       LabelPlacement.onTicks,
                                          //   // stepDuration:
                                          //   //     SliderStepDuration(years: 5),
                                          //   // stepSize: 0.0,
                                          //   showDividers: false,
                                          //   activeColor: AppColors.primaryColor,
                                          //   min: 0,
                                          //   max: 10,
                                          //   initialValues: SfRangeValues(0, 10),
                                          //   // value:
                                          //   //     controller.experienceyear.value,
                                          //   interval: 20,
                                          //   showTicks: true,
                                          //   showLabels: true,
                                          //   enableTooltip: true,
                                          //   dividerShape: SfDividerShape(),
                                          //   child: Container(),

                                          //   minorTicksPerInterval: 5,
                                          //   onChanged: (dynamic value) {
                                          //     controller.experienceyear.value =
                                          //         value;
                                          //   },
                                          // ),
                                        ],
                                      )
                                    : Container(),
                                controller.filterlist[index] == 'CTC' &&
                                        controller.selectfilter.value == 'CTC'
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "CTC per Annum *",
                                                style: BaseStyles.grey1Medium14,
                                              ),
                                              singlefiled(
                                                  height: 25.0,
                                                  name: 'Currency',
                                                  color: AppColors
                                                      .greyprimarycolor
                                                      .shade300,
                                                  style:
                                                      BaseStyles.blacNormal14),
                                            ],
                                          ),
                                          heightSpace5,
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: singlefiled(
                                                  show: Container(),
                                                  name: 'From',
                                                ),
                                              ),
                                              widthSpace10,
                                              Expanded(
                                                child: singlefiled(
                                                  name: 'To',
                                                  show: Container(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(),
                                controller.selectfilter.value ==
                                            controller.filterlist[index] &&
                                        controller.filterlist[index] != 'CTC' &&
                                        controller.filterlist[index] !=
                                            'Experience'
                                    ? Column(
                                        children: List.generate(
                                          controller.subfilterlist.length,
                                          (i) => Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Theme(
                                                      data: Theme.of(context).copyWith(
                                                          unselectedWidgetColor:
                                                              AppColors
                                                                  .greyprimarycolor),
                                                      child: SizedBox(
                                                          height: 20.0,
                                                          width: 20.0,
                                                          child: Checkbox(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            splashRadius: 5.0,
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                            activeColor: AppColors
                                                                .primaryColor,
                                                            // checkColor: AppColors.secondary2Color,
                                                            value: false,
                                                            onChanged: (value) {
                                                              // controller.agree.value = value ?? false;
                                                            },
                                                          ))),
                                                  widthSpace5,
                                                  Expanded(
                                                      child: Text(
                                                    controller.subfilterlist[i]
                                                        .toString(),
                                                    style:
                                                        BaseStyles.blacNormal14,
                                                  ))
                                                ],
                                              ),
                                              heightSpace10,
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                                controller.selectfilter.value ==
                                        controller.filterlist[index]
                                    ? heightSpace10
                                    : Container(),
                                Divider(
                                  thickness: 0.5,
                                  height: 4.8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 150,
                        decoration: decorationbox(
                          border: Border.all(
                            color: AppColors.greyprimarycolor.shade200,
                          ),
                          color: AppColors.whiteColor,
                        ),
                        child: Text(
                          HomeName.reset,
                          style: BaseStyles.grey2Medium14,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 150,
                        decoration: decorationbox(
                          border: Border.all(
                            color: AppColors.greyprimarycolor.shade200,
                          ),
                          color: AppColors.orangecolor,
                        ),
                        child: Text(
                          HomeName.apply,
                          style: BaseStyles.whitenormal14,
                        ),
                      ),
                    )
                  ],
                ),
                heightSpace10
              ],
            ),
          ),
        );
      });
}

sortby({context, controller, sortlist, height}) {
  return showModalBottomSheet(
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
          heightFactor: height ?? 0.4,
          child: Container(
            // height: 300,
            decoration: MyDecoration.radiusonlydecoration(
                tlradius: 25.0, trradius: 25.0),
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
                  JobsName.sortby,
                  style: BaseStyles.blackMedium16,
                ),
                heightSpace10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: Get.width * 0.45,
                        decoration: decorationbox2(
                          radius: 30.0,
                          color: AppColors.primaryColor,
                        ),
                        child: Text(
                          'Accending',
                          style: BaseStyles.whitenormal12,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: Get.width * 0.45,
                        decoration: decorationbox2(
                          radius: 30.0,
                          color: AppColors.greyprimarycolor.shade100,
                        ),
                        child: Text(
                          'Descending',
                          style: BaseStyles.blacNormal12,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sortlist == null
                          ? controller.sortlist.length
                          : sortlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          horizontalTitleGap: 2.0,
                          dense: true,
                          contentPadding: const EdgeInsets.only(left: 5),
                          title: Text(
                            sortlist == null
                                ? controller.sortlist[index].toString()
                                : sortlist[index],
                            style: BaseStyles.blacNormal14,
                          ),
                          leading: Radio(
                            activeColor: AppColors.primaryColor,
                            visualDensity: const VisualDensity(
                                horizontal: -0.4, vertical: -0.4),
                            value: true,
                            groupValue: false,
                            onChanged: (value) {},
                          ),
                        );
                      }),
                ),
                heightSpace10
              ],
            ),
          ),
        );
      });
}

////
skillswidget(context, controller) {
  return showModalBottomSheet(
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
          heightFactor: 0.6,
          child: Container(
            // height: 300,
            decoration: MyDecoration.radiusonlydecoration(
                tlradius: 25.0, trradius: 25.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace20,
                  Align(
                    child: Container(
                      height: 4,
                      width: 160,
                      decoration: MyDecoration.simpledecoration(
                          color: AppColors.greyprimarycolor),
                    ),
                  ),
                  heightSpace20,
                  Text(
                    JobsName.addprofessional,
                    style: BaseStyles.blackMedium16,
                  ),
                  heightSpace10,
                  textwidget(
                      name: 'Professional skills*',
                      text: 'Enter',
                      controller: controller.psearchtxt),
                  heightSpace10,
                  controller.psearchtxt.text != '' ||
                          controller.psearchtxt.text.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nothing found named “Php”',
                              style: BaseStyles.grey3medium12,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColors.orangecolor,
                                  size: 18,
                                ),
                                Text(
                                  'Add More',
                                  style: BaseStyles.orangeMedium14,
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),
                  Divider(
                    thickness: 0.5,
                  ),
                  heightSpace5,
                  Text(
                    "Rate Skills*",
                    style: BaseStyles.grey1Medium14,
                  ),
                  heightSpace5,
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: AppColors.greyprimarycolor.shade300,
                    itemSize: 30.0,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  heightSpace10,
                  Divider(
                    thickness: 0.5,
                  ),
                  heightSpace5,
                  textwidget(name: 'Weightage*', text: 'Enter'),
                  Expanded(child: Container()),
                  mybuttons(
                      style: BaseStyles.grey2medium16,
                      name: 'Create',
                      color: AppColors.greyprimarycolor.shade100,
                      height: 45.0)
                ],
              ),
            ),
          ),
        );
      });
}

jobedit({
  context,
  controller,
  listname,
  indexdivider,
  icon,
  required Function(int value) ontab,
  height,
}) {
  return showModalBottomSheet(
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
          heightFactor: height ?? 0.4,
          child: Container(
            // height: 300,
            decoration: MyDecoration.radiusonlydecoration(
                tlradius: 25.0, trradius: 25.0),
            child: Column(
              children: [
                heightSpace20,
                Container(
                  height: 4,
                  width: 160,
                  decoration: MyDecoration.simpledecoration(
                      color: AppColors.greyprimarycolor),
                ),
                // heightSpace20,
                // Text(
                //   JobsName.sortby,
                //   style: BaseStyles.blackMedium16,
                // ),
                heightSpace10,
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listname.length,
                      itemBuilder: (BuildContext context, int index) {
                        // int i = index;
                        return InkWell(
                          //  () {
                          //   if (routename == null) return;
                          //   switch (index) {
                          //     case 2:
                          //       Get.back();
                          //       Get.to(routename);
                          //       break;
                          //     default:
                          //   }
                          // },
                          onTap: () {
                            ontab(index);
                          },

                          child: Column(
                            children: [
                              ListTile(
                                  horizontalTitleGap: 2.0,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  title: Text(
                                    listname[index]['name'].toString(),
                                    style: BaseStyles.blacNormal14,
                                  ),
                                  leading: Icon(
                                    icon[index]['icon'],
                                    size: 16,
                                    color: AppColors.lightblackColor,
                                  )),
                              index == (indexdivider == null ? 2 : indexdivider)
                                  ? Divider(
                                      thickness: 0.5,
                                      height: 0.5,
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      }),
                ),
                heightSpace10
              ],
            ),
          ),
        );
      });
}

status({context, controller, title, list, button, size}) {
  return showModalBottomSheet(
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
          heightFactor: size ?? 0.30,
          child: Container(
            // height: 300,
            decoration: MyDecoration.radiusonlydecoration(
                tlradius: 25.0, trradius: 25.0),
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
                  title,
                  style: BaseStyles.blackMedium16,
                ),
                heightSpace10,
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          horizontalTitleGap: 2.0,
                          dense: true,
                          contentPadding: const EdgeInsets.only(left: 5),
                          title: Text(
                            list[index].toString(),
                            style: BaseStyles.blacNormal14,
                          ),
                          leading: Radio(
                            activeColor: AppColors.primaryColor,
                            visualDensity: const VisualDensity(
                                horizontal: -0.4, vertical: -0.4),
                            value: true,
                            groupValue: false,
                            onChanged: (value) {},
                          ),
                        );
                      }),
                ),
                heightSpace10,
                button ?? Container()
              ],
            ),
          ),
        );
      });
}
