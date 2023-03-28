import 'package:taliqi/app/constants/app_basestyles.dart';
import 'package:taliqi/app/constants/app_colors.dart';
import 'package:taliqi/app/constants/strings.dart';
import 'package:taliqi/app/modules/interview_screens/views/video_player_view.dart';
import 'package:taliqi/app/widgets/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/full_screen.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/rating.dart';
import '../../../widgets/rotate.dart';
import '../../../widgets/textfiled.dart';
import '../controllers/single_play_controller.dart';
import '../controllers/video_player_custom_controller.dart';

class SinglePlayView extends GetView<SinglePlayController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SinglePlayController());
    Get.lazyPut(() => VideoPlayerCustomController());
    final scrollController = controller.scrollController;
    // ignore: unused_local_variable
    final recommandedScrollController = controller.recommandedScrollController;
    // ignore: unused_local_variable
    final aboutScrollController = controller.aboutScrollController;
    // var vc = Get.find<VideoPlayerCustomController>();

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (isPortrait) {
            return true;
          } else {
            controller.videoPlayerController.pause();
            rotate(isPortrait);
            fullScreenToggle(isPortrait);
            return false;
          }
        },
        child: Scaffold(
            appBar: isPortrait
                ? myappbar2(
                    widget: Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                        widthSpace5,
                        Text(
                          'Share Externally',
                          style: BaseStyles.whitebold14,
                        ),
                        widthSpace10
                      ],
                    ),
                    show2: Container(),
                    show: false,
                    title: HomeName.InterviewDetail,
                  )
                : null,
            body: !controller.loading.value
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VideoPlayerView(
                          thumbnail:
                              'https://media.istockphoto.com/id/635726330/photo/nahargarh-fort.jpg?s=612x612&w=0&k=20&c=z1hztb9BT6YhxT--G_cW8hBmBHWzrFdwbfM0Pc2jATI=',
                          videoPlayerController:
                              controller.videoPlayerController,
                          selectedFitBox: controller.selectedFitBox,
                        ),
                        Column(
                          children: [
                            Container(
                              width: Get.width,
                              color: AppColors.whiteColor,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: decorationbox(
                                          radius: 30.0,
                                          color: AppColors.greycolor3),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 13.0, vertical: 4),
                                        child: Text(
                                          'Question 1',
                                          style: BaseStyles.whitenormal12,
                                        ),
                                      ),
                                    ),
                                    heightSpace10,
                                    Text(
                                      'What is your education summary?',
                                      style: BaseStyles.blackMedium16,
                                    ),
                                    heightSpace10,
                                    heightSpace5,
                                    controller.ratesubmit.value == true
                                        ? Container(
                                            alignment: Alignment.center,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 0.1,
                                                    blurRadius: 1,
                                                    offset: const Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                                border: Border.all(
                                                    color: AppColors
                                                        .greyprimarycolor
                                                        .shade200),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            // height: 34,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Your Rating',
                                                            style: BaseStyles
                                                                .grey1Medium14,
                                                          ),
                                                          RatingBar.builder(
                                                            initialRating: 3,
                                                            minRating: 1,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            unratedColor: AppColors
                                                                .greyprimarycolor
                                                                .shade300,
                                                            itemSize: 20.0,
                                                            itemCount: 5,
                                                            itemPadding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        3.0),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Image.asset(
                                                        MyImages.edit,
                                                        height: 15,
                                                        color: AppColors
                                                            .greyprimarycolor,
                                                        width: 15,
                                                      )
                                                    ],
                                                  ),
                                                  heightSpace10,
                                                  Text(
                                                    'Comments',
                                                    style: BaseStyles
                                                        .grey1Medium14,
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                                    style: BaseStyles
                                                        .grey3Normal14,
                                                  )
                                                ],
                                              ),
                                            ))
                                        : InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  isDismissible: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  isScrollControlled: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(25.0),
                                                    ),
                                                  ),
                                                  builder: (context) {
                                                    return FractionallySizedBox(
                                                      heightFactor: 0.55,
                                                      child: Container(
                                                        // height: 300,
                                                        decoration: MyDecoration
                                                            .radiusonlydecoration(
                                                                tlradius: 25.0,
                                                                trradius: 25.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              heightSpace20,
                                                              Align(
                                                                child:
                                                                    Container(
                                                                  height: 4,
                                                                  width: 160,
                                                                  decoration: MyDecoration
                                                                      .simpledecoration(
                                                                          color:
                                                                              AppColors.greyprimarycolor),
                                                                ),
                                                              ),
                                                              heightSpace20,
                                                              Align(
                                                                child: Text(
                                                                  'Rate Answer',
                                                                  style: BaseStyles
                                                                      .blackMedium14,
                                                                ),
                                                              ),
                                                              heightSpace10,
                                                              Divider(
                                                                thickness: 0.5,
                                                              ),
                                                              heightSpace5,
                                                              textwidget(
                                                                  height: 150.0,
                                                                  readonly:
                                                                      false,
                                                                  onTap: () {},
                                                                  minline: 8,
                                                                  maxline: 8,
                                                                  name:
                                                                      'Comments',
                                                                  text:
                                                                      'Write'),
                                                              heightSpace5,
                                                              Divider(
                                                                thickness: 0.5,
                                                              ),
                                                              heightSpace10,
                                                              Text(
                                                                "Select a Rating",
                                                                style: BaseStyles
                                                                    .grey1Medium14,
                                                              ),
                                                              heightSpace5,
                                                              RatingBar.builder(
                                                                initialRating:
                                                                    0,
                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    true,
                                                                unratedColor:
                                                                    AppColors
                                                                        .greyprimarycolor
                                                                        .shade300,
                                                                itemSize: 30.0,
                                                                itemCount: 5,
                                                                itemPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            3.0),
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                onRatingUpdate:
                                                                    (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                              heightSpace10,
                                                              Expanded(
                                                                  child:
                                                                      Container()),
                                                              mybuttons(
                                                                  action: () {
                                                                    controller
                                                                        .ratesubmit
                                                                        .value = true;
                                                                    Get.back();
                                                                  },
                                                                  // style:
                                                                  //     BaseStyles.grey2medium16,
                                                                  name:
                                                                      'Submit',
                                                                  color: AppColors
                                                                      .orangecolor,
                                                                  height: 45.0)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0.1,
                                                      blurRadius: 1,
                                                      offset: const Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyprimarycolor
                                                          .shade200),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              height: 34,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        AppColors.orangecolor,
                                                    size: 20,
                                                  ),
                                                  widthSpace5,
                                                  Text(
                                                    'Rate Answer',
                                                    style: BaseStyles
                                                        .orangeMedium14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    heightSpace10,
                                  ],
                                ),
                              ),
                            ),
                            heightSpace10,
                            video(),
                            heightSpace10,
                            feddback()
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ))),
      ),
    );
  }

///////////////// overall feedback//////////////////////
  Widget feddback() {
    return Container(
      width: Get.width,
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overall Feedback',
                  style: BaseStyles.blackMedium14,
                ),
                controller.ratesubmit.value == true
                    ? InkWell(
                        onTap: () {
                          controller.ratesubmit.value = false;
                        },
                        child: Image.asset(
                          MyImages.edit,
                          height: 15,
                          color: AppColors.greyprimarycolor,
                          width: 15,
                        ),
                      )
                    : Container()
              ],
            ),
            const Divider(
              thickness: 0.3,
              height: 25,
            ),
            heightSpace10,
            Text(
              "Python",
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
            Text(
              "Full Stack",
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
            Text(
              "Teamwork",
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
            textwidget(
                height: 150.0,
                readonly: false,
                onTap: () {},
                minline: 8,
                maxline: 8,
                name: 'Feedback',
                text: 'Write'),
            heightSpace10,
            mybuttons(
                action: () {
                  Get.back();
                },
                name: 'Submit',
                radius: 5.0,
                color: AppColors.orangecolor,
                height: 45.0),
          ],
        ),
      ),
    );
  }

  ///////// watch interviews////////////////////////////////////////
  Widget video() {
    return Container(
      height: 210,
      width: Get.width,
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Videos',
              style: BaseStyles.blackMedium14,
            ),
            const Divider(
              thickness: 0.3,
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () => Get.to(SinglePlayView()),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    'assets/image/u.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                  child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: AppColors.whiteColor,
                              )),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '10:17',
                                      style: BaseStyles.whitesmall10,
                                    ),
                                  ))
                            ],
                          ),
                          heightSpace10,
                          Container(
                            decoration: decorationbox(
                                radius: 30.0, color: AppColors.greycolor3),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 4),
                              child: Text(
                                'Question 1',
                                style: BaseStyles.whitenormal12,
                              ),
                            ),
                          ),
                          heightSpace10,
                          SizedBox(
                            width: Get.width * 0.30,
                            child: Text(
                              'In publishing and graphic design...',
                              style: BaseStyles.blacNormal14,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
