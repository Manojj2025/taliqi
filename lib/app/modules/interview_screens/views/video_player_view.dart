import 'package:taliqi/app/constants/app_colors.dart';
import 'package:taliqi/app/modules/interview_screens/views/prograss_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../../../widgets/full_screen.dart';
import '../../../widgets/rotate.dart';
import '../controllers/video_player_custom_controller.dart';

class VideoPlayerView extends GetView<VideoPlayerCustomController> {
  // final videoURL;
  final thumbnail;
  final VideoPlayerController videoPlayerController;
  // final subtitleController;
  final selectedFitBox;

  VideoPlayerView({
    // @required this.videoURL,
    @required this.thumbnail,
    required this.videoPlayerController,
    // @required this.subtitleController,
    @required this.selectedFitBox,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    controller.checkBuffering(videoPlayerController);
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: isPortrait ? Get.width / 1.7 : Get.height,
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                // fit: BoxFit.,
                fit: selectedFitBox.value == 1
                    ? BoxFit.cover
                    : selectedFitBox.value == 2
                        ? BoxFit.fill
                        : selectedFitBox.value == 3
                            ? BoxFit.fitHeight
                            : BoxFit.fitWidth,
                child: SizedBox(
                    width: videoPlayerController.value.size.width,
                    height: videoPlayerController.value.size.height,
                    child: VideoPlayer(videoPlayerController)),
                //  SizedBox(
                //   width: videoPlayerController.value.size.width,
                //   height: videoPlayerController.value.size.height,
                //   child: !isPortrait
                //       ? VideoPlayer(videoPlayerController)
                //       : Image.network(
                //           thumbnail,
                //           fit: BoxFit.cover,
                //         ),
                // ),
              ),
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: isPortrait ? Get.width * 0.59 : Get.width * 0.47,
          child: Stack(
            children: [
              // !controller.t!.isActive
              //     ? GestureDetector(
              //         onTap: () {
              //           controller.visibilityControl();
              //         },
              //         child: Container(
              //           width: Get.width,
              //           height: Get.height,
              //           color: Colors.transparent,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Expanded(
              //                 child: GestureDetector(
              //                     onDoubleTap: () {
              //                       controller.visiicon();
              //                       Duration oldposition =
              //                           videoPlayerController.value.position;
              //                       int seconds = oldposition.inSeconds - 10;
              //                       Duration newposition =
              //                           Duration(seconds: seconds);
              //                       videoPlayerController.seekTo(newposition);
              //                     },
              //                     child: Container(
              //                         color: Colors.transparent,
              //                         height: isPortrait
              //                             ? MediaQuery.of(context).size.height /
              //                                 3.2
              //                             : MediaQuery.of(context).size.height /
              //                                 1.0,
              //                         // width: MediaQuery.of(context).size.width / 3.2),
              //                         child: FadeTransition(
              //                           opacity: controller.animationl,
              //                           child: Icon(
              //                             controller.a,
              //                             size: 40,
              //                             color: Colors.white,
              //                           ),
              //                         ))),
              //               ),
              //               SizedBox(
              //                 width: isPortrait
              //                     ? MediaQuery.of(context).size.width / 2
              //                     : MediaQuery.of(context).size.width / 2,
              //               ),
              //               Expanded(
              //                   child: Container(
              //                 color: Colors.transparent,
              //                 height: isPortrait
              //                     ? MediaQuery.of(context).size.height / 3.2
              //                     : MediaQuery.of(context).size.height / 1.0,
              //                 child: GestureDetector(
              //                   onDoubleTap: () {
              //                     controller.visiicon2();
              //                     Duration oldposition =
              //                         videoPlayerController.value.position;
              //                     int seconds = oldposition.inSeconds + 10;
              //                     Duration newposition =
              //                         Duration(seconds: seconds);
              //                     videoPlayerController.seekTo(newposition);
              //                   },
              //                   child: FadeTransition(
              //                     opacity: controller.animationR,
              //                     child: Icon(
              //                       controller.b,
              //                       size: 40,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //               ))
              //             ],
              //           ),
              //         ),
              //       )
              //     :
              FadeTransition(
                opacity: controller.animation1,
                child: GestureDetector(
                  onTap: () {
                    // controller.visibilityControl(toggle: true);
                    controller.visibilityControl();
                  },
                  child: Container(
                    color: Colors.black54,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  onDoubleTap: () {
                                    controller.visiicon();
                                    Duration oldposition =
                                        videoPlayerController.value.position;
                                    int seconds = oldposition.inSeconds - 10;
                                    Duration newposition =
                                        Duration(seconds: seconds);
                                    videoPlayerController.seekTo(newposition);
                                  },
                                  child: Container(
                                      // color: Colors.transparent,
                                      color: Colors.transparent,
                                      height: isPortrait
                                          ? MediaQuery.of(context).size.height /
                                              3.2
                                          : MediaQuery.of(context).size.height /
                                              1.0,
                                      child: FadeTransition(
                                        opacity: controller.animationl,
                                        child: Icon(
                                          controller.a,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ))),
                            ),
                            SizedBox(
                              width: isPortrait
                                  ? MediaQuery.of(context).size.width / 2.3
                                  : MediaQuery.of(context).size.width / 2,
                            ),
                            Expanded(
                                child: Container(
                              color: Colors.transparent,
                              height: isPortrait
                                  ? MediaQuery.of(context).size.height / 3.2
                                  : MediaQuery.of(context).size.height / 1.0,
                              child: GestureDetector(
                                onDoubleTap: () {
                                  controller.visiicon2();
                                  Duration oldposition =
                                      videoPlayerController.value.position;
                                  int seconds = oldposition.inSeconds + 10;
                                  Duration newposition =
                                      Duration(seconds: seconds);
                                  videoPlayerController.seekTo(newposition);
                                },
                                child: FadeTransition(
                                  opacity: controller.animationR,
                                  child: Icon(
                                    controller.b,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(18.0),
                        //   child: !isPortrait
                        //       ? InkWell(
                        //           onTap: () {
                        //             information(context, isPortrait);
                        //           },
                        //           child: SvgPicture.asset(
                        //             'assets/icons/cast.svg',
                        //             height: 35,
                        //             width: 30,
                        //             color: Colors.white,
                        //           ),
                        //         )
                        //       : Container(),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       // InkWell(
                        //       //   onTap: () {},
                        //       //   child: Icon(
                        //       //     Icons.subtitles,
                        //       //     color: Colors.white,
                        //       //   ),
                        //       // ),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       // InkWell(
                        //       //   onTap: () {
                        //       //     // setting(
                        //       //     //   context,
                        //       //     //   isPortrait,
                        //       //     //   controller,
                        //       //     // );
                        //       //   },
                        //       //   child: Icon(
                        //       //     Icons.settings,
                        //       //     color: Colors.white,
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        Positioned.fill(
                          child: Center(
                            child: Container(
                              color: Colors.transparent,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.visibilityControl(),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      // decoration: BoxDecoration(
                                      //     color: Colors.blue.withAlpha(50),
                                      //     borderRadius:
                                      //         BorderRadius.circular(35)),
                                      child: Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: videoPlayerController
                                            .value.isBuffering
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.primaryColor),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              controller.visibilityControl(
                                                  toggle: true);

                                              videoPlayerController
                                                      .value.isPlaying
                                                  ? videoPlayerController
                                                      .pause()
                                                  : videoPlayerController
                                                      .play();
                                              videoPlayerController
                                                      .value.isPlaying
                                                  ? controller.ishow.value =
                                                      false
                                                  : controller.ishow.value =
                                                      true;
                                              print(controller.ishow.value);
                                            },
                                            child: Container(
                                              height: 70,
                                              width: 70,
                                              // decoration: BoxDecoration(
                                              //   color:
                                              //       Colors.blue.withAlpha(50),
                                              //   borderRadius:
                                              //       BorderRadius.circular(35),
                                              // ),
                                              child: Icon(
                                                videoPlayerController
                                                        .value.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.visibilityControl(),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      // decoration: BoxDecoration(
                                      //     color: Colors.blue.withAlpha(50),
                                      //     borderRadius:
                                      //         BorderRadius.circular(35)),
                                      child: Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              height: 38,
                              padding: EdgeInsets.only(top: 5),
                              child: Padding(
                                padding: isPortrait
                                    ? const EdgeInsets.only(bottom: 0.0)
                                    : const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: isPortrait
                                          ? Get.width * .8
                                          : Get.width * .8,
                                      child: ProgressBar(
                                        buffered: videoPlayerController
                                                    .value.buffered.length ==
                                                0
                                            ? Duration.zero
                                            : videoPlayerController
                                                .value.buffered[0].end,
                                        progress: videoPlayerController
                                            .value.position,
                                        total: videoPlayerController
                                            .value.duration,
                                        progressBarColor:
                                            AppColors.primaryColor,
                                        baseBarColor:
                                            Colors.white.withOpacity(0.14),
                                        bufferedBarColor:
                                            Colors.white.withOpacity(0.4),
                                        thumbColor: AppColors.primaryColor,
                                        barHeight: 3.0,
                                        thumbRadius: 6.0,
                                        timeLabelTextStyle:
                                            TextStyle(color: Colors.white),
                                        thumbGlowRadius: 0.0,
                                        onSeekUpdate: () {
                                          controller.visibilityControl(
                                            toggle: true,
                                          );
                                        },
                                        onSeek: (duration) {
                                          videoPlayerController
                                              .seekTo(duration);
                                        },
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    Container(
                                      height: 40,
                                      width: 55,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // controller.visibilityControl();
                                              // controller.visibilityControl(
                                              //     toggle: true);
                                              // if (selectedFitBox.value < 4) {
                                              //   selectedFitBox.value =
                                              //       selectedFitBox.value + 1;
                                              // } else {
                                              //   selectedFitBox.value = 1;
                                              // }
                                            },
                                            child: Icon(
                                              Icons.volume_up_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.visibilityControl(
                                                  toggle: true);
                                              videoPlayerController.pause();
                                              rotate(isPortrait);
                                              fullScreenToggle(isPortrait);
                                            },
                                            child: Icon(
                                              Icons.fullscreen_exit,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
