// import 'package:taliqi/app/widgets/buttons.dart';
// import 'package:taliqi/app/widgets/decoration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

// import 'package:get/get.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// import '../../../../constants/values.dart';
// import '../../../../widgets/appbar.dart';
// import '../controllers/videocall_controller.dart';

// class VideoCallView extends GetView<VideoCallController> {
//   const VideoCallView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut(() => VideoCallController());

//     return Scaffold(
//         backgroundColor: Color.fromRGBO(23, 23, 23, 1),
//         appBar: AppBar(
//           // systemOverlayStyle: controller.changestatusbarcolor(),
//           centerTitle: true,
//           backgroundColor: Color(0xff202020),
//           title: Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: AppColors.whiteColor,
//                 radius: 10,
//                 child: Image.asset(
//                   'assets/image/infinity.png',
//                   height: 12,
//                 ),
//               ),
//               widthSpace5,
//               Text(
//                 'Oodles Tech...',
//                 style: BaseStyles.whitebold14,
//               ),
//               widthSpace5,
//               Icon(Icons.arrow_drop_down, size: 20, color: AppColors.whiteColor)
//             ],
//           ),
//           actions: [
//             Row(
//               children: [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   size: 20,
//                   color: AppColors.whiteColor,
//                 ),
//                 widthSpace10,
//                 Icon(
//                   Icons.info_outline,
//                   size: 20,
//                   color: AppColors.whiteColor,
//                 ),
//                 widthSpace20
//               ],
//             )
//           ],
//         ),
//         body: Obx(
//           () => Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: controller.nextscreen.value
//                 ? Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       controller.accept.value
//                           ? Positioned(
//                               bottom: 110,
//                               child: Container(
//                                 width: Get.width * 0.90,
//                                 height: Get.height * 0.65,
//                                 decoration: decorationbox2(
//                                     radius: 8.0,
//                                     color: Color.fromRGBO(32, 32, 32, 1)),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Anurag Kuradia',
//                                                 style: BaseStyles.whitebold14,
//                                               ),
//                                               widthSpace10,
//                                               CircleAvatar(
//                                                 radius: 15,
//                                                 backgroundColor: Colors.black,
//                                                 child: Icon(
//                                                   Icons.mic_off,
//                                                   size: 18,
//                                                   color: AppColors.whiteColor,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                           Icon(
//                                             Icons.more_vert_outlined,
//                                             size: 18,
//                                             color: AppColors.whiteColor,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     heightSpace10,
//                                     Image.asset(
//                                       'assets/image/p.webp',
//                                       height: Get.height * 0.50,
//                                       width: Get.width,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               ImageIcon(
//                                 AssetImage('assets/image/f.png'),
//                                 size: 18,
//                                 color: AppColors.whiteColor,
//                               ),
//                               widthSpace10,
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.fiber_manual_record_rounded,
//                                     color: AppColors.redcolor,
//                                     size: 20,
//                                   ),
//                                   widthSpace3,
//                                   Text(
//                                     'Rec',
//                                     style: BaseStyles.grey4normal14,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                           Expanded(
//                             child: !controller.showdialog.value
//                                 ? Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       heightSpace50,
//                                       heightSpace50,
//                                       heightSpace20,
//                                       heightSpace5,
//                                       Text(
//                                         'You’re the only one in the interview',
//                                         style: BaseStyles.whiteMedium16,
//                                       ),
//                                       heightSpace5,
//                                       Text(
//                                         'Please wait for others to join',
//                                         style: BaseStyles.grey4normal14,
//                                       ),
//                                       heightSpace10,
//                                       heightSpace5,
//                                       Text(
//                                         'Share this link with others',
//                                         style: BaseStyles.whitemedium14,
//                                       ),
//                                       heightSpace5,
//                                       InkWell(
//                                         onTap: () {
//                                           controller.showdialog.value = true;
//                                           showDialog(
//                                               // useSafeArea: true,
//                                               // barrierColor: Colors.black,
//                                               context: context,
//                                               barrierDismissible: true,
//                                               builder: (context) =>
//                                                   WillPopScope(
//                                                     onWillPop: () async =>
//                                                         false,
//                                                     child: AlertDialog(
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8),
//                                                       ),
//                                                       actionsAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       // buttonPadding: EdgeInsets.zero,
//                                                       elevation: 10,
//                                                       backgroundColor:
//                                                           Color.fromRGBO(255,
//                                                               255, 255, 0.2),
//                                                       // backgroundColor: Color.fromRGBO(
//                                                       //     255, 255, 255, 0.2),
//                                                       insetPadding:
//                                                           EdgeInsets.all(10),
//                                                       titlePadding:
//                                                           EdgeInsets.only(
//                                                               left: 15,
//                                                               right: 15,
//                                                               top: 10),
//                                                       contentPadding:
//                                                           EdgeInsets.only(
//                                                               left: 15,
//                                                               right: 15),
//                                                       // <-- SEE HERE
//                                                       title: Text(
//                                                         'Anurag wants to join this interview',
//                                                         style: BaseStyles
//                                                             .whitelarge16,
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                       content: Container(
//                                                           width: Get.width,
//                                                           margin:
//                                                               EdgeInsets.only(
//                                                                   top: 10),
//                                                           height: 50,
//                                                           decoration:
//                                                               new BoxDecoration(
//                                                             shape: BoxShape
//                                                                 .rectangle,
//                                                             // color: Color.fromRGBO(
//                                                             //     255, 255, 255, 0.2),
//                                                             borderRadius:
//                                                                 new BorderRadius
//                                                                     .all(new Radius
//                                                                         .circular(
//                                                                     32.0)),
//                                                           ),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .center,
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               CircleAvatar(
//                                                                 radius: 12,
//                                                                 child: Image.asset(
//                                                                     'assets/image/pic.png'),
//                                                               ),
//                                                               heightSpace5,
//                                                               Text(
//                                                                 'Rajat Kumar',
//                                                                 style: BaseStyles
//                                                                     .whitemedium14,
//                                                               )
//                                                             ],
//                                                           )),
//                                                       actions: <Widget>[
//                                                         TextButton(
//                                                           child: Container(
//                                                               padding: EdgeInsets
//                                                                   .symmetric(
//                                                                       horizontal:
//                                                                           50,
//                                                                       vertical:
//                                                                           8),
//                                                               decoration: decorationbox(
//                                                                   border: Border.all(
//                                                                       color: AppColors
//                                                                           .greyprimarycolor
//                                                                           .shade200),
//                                                                   radius: 50.0),
//                                                               child: Text(
//                                                                 'Deny',
//                                                                 style: BaseStyles
//                                                                     .redMedium16,
//                                                               )),
//                                                           onPressed: () {
//                                                             controller
//                                                                 .showdialog
//                                                                 .value = false;
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop();
//                                                           },
//                                                         ),
//                                                         TextButton(
//                                                           child: Container(
//                                                               padding: EdgeInsets
//                                                                   .symmetric(
//                                                                       horizontal:
//                                                                           50,
//                                                                       vertical:
//                                                                           8),
//                                                               decoration: decorationbox(
//                                                                   color: AppColors
//                                                                       .secondarydarkColor,
//                                                                   radius: 50.0),
//                                                               child: Text(
//                                                                 'Accept',
//                                                                 style: BaseStyles
//                                                                     .whitelarge16,
//                                                               )),
//                                                           onPressed: () {
//                                                             controller
//                                                                 .showdialog
//                                                                 .value = true;
//                                                             controller.accept
//                                                                 .value = true;
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop();
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ));
//                                         },
//                                         child: Container(
//                                           decoration: decorationbox2(
//                                               radius: 8.0,
//                                               color: Color.fromRGBO(
//                                                   255, 255, 255, 0.2)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Text(
//                                                   'https://interview.taliqone.com/52368',
//                                                   style:
//                                                       BaseStyles.whitemedium14,
//                                                 ),
//                                                 widthSpace5,
//                                                 Icon(
//                                                   Icons.copy,
//                                                   size: 20,
//                                                   color: AppColors.whiteColor,
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 : Container(),
//                           ),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: SizedBox(
//                                   height: 150,
//                                   width: 120,
//                                   child: RTCVideoView(
//                                     controller.localRTCVideoRenderer,
//                                     mirror:
//                                         controller.isFrontCameraSelected.value,
//                                     objectFit: RTCVideoViewObjectFit
//                                         .RTCVideoViewObjectFitCover,
//                                   ),
//                                 ),
//                                 // Image.asset(
//                                 //   'assets/image/pic.png',
//                                 //   height: 150,
//                                 //   width: 120,
//                                 //   fit: BoxFit.cover,
//                                 // ),
//                               ),
//                             ),
//                           ),
//                           heightSpace20,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor:
//                                     Color.fromRGBO(255, 255, 255, 0.2),
//                                 radius: 20,
//                                 child: Icon(
//                                   Icons.videocam_outlined,
//                                   size: 20,
//                                   color: AppColors.whiteColor,
//                                 ),
//                               ),
//                               // widthSpace20,
//                               Obx(
//                                 () => GestureDetector(
//                                   onTap: () {
//                                     controller.micmute.value =
//                                         !controller.micmute.value;
//                                   },
//                                   child: CircleAvatar(
//                                     backgroundColor: controller.micmute.value
//                                         ? AppColors.whiteColor
//                                         : Color.fromRGBO(255, 255, 255, 0.2),
//                                     radius: 20,
//                                     child: Icon(
//                                       controller.micmute.value
//                                           ? Icons.mic_off
//                                           : Icons.mic,
//                                       size: 20,
//                                       color: controller.micmute.value
//                                           ? AppColors.greycolor3
//                                           : AppColors.whiteColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               // widthSpace20,
//                               CircleAvatar(
//                                 backgroundColor:
//                                     Color.fromRGBO(255, 255, 255, 0.2),
//                                 radius: 20,
//                                 child: Icon(
//                                   Icons.group_outlined,
//                                   size: 20,
//                                   color: AppColors.whiteColor,
//                                 ),
//                               ),
//                               // widthSpace20,
//                               CircleAvatar(
//                                 backgroundColor:
//                                     Color.fromRGBO(255, 255, 255, 0.2),
//                                 radius: 20,
//                                 child: Icon(
//                                   Icons.more_vert_rounded,
//                                   size: 20,
//                                   color: AppColors.whiteColor,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 25, vertical: 12),
//                                 decoration: decorationbox2(
//                                     radius: 40.0,
//                                     color: Color.fromRGBO(235, 87, 87, 1)),
//                                 child: Text(
//                                   'End',
//                                   style: BaseStyles.whitemedium14,
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       controller.join.value
//                           ? LinearProgressIndicator(
//                               color: AppColors.primaryColor,
//                               minHeight: 5,
//                               backgroundColor: Color.fromRGBO(23, 23, 23, 1),
//                             )
//                           : Container(),

//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               heightSpace10,
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 30, right: 30),
//                                 child: Container(
//                                     width: Get.width,
//                                     height: Get.height * 0.50,
//                                     child: Stack(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                           child: Image.asset(
//                                             'assets/image/p.webp',
//                                             width: Get.width,
//                                             height: Get.height * 0.50,
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                         Container(
//                                           width: Get.width,
//                                           height: Get.height * 0.50,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             color: Color(0xff202020),
//                                             gradient: controller
//                                                     .videopause.value
//                                                 ? null
//                                                 : LinearGradient(
//                                                     begin: Alignment.topCenter,
//                                                     end: Alignment.bottomCenter,
//                                                     stops: [
//                                                         0.0,
//                                                         1.0,
//                                                       ],
//                                                     colors: [
//                                                         Colors.transparent,
//                                                         Color.fromRGBO(
//                                                             0, 0, 0, 1),
//                                                       ]),
//                                           ),
//                                           child: controller.videopause.value
//                                               ? Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     CircleAvatar(
//                                                       radius: 40,
//                                                       backgroundImage:
//                                                           AssetImage(
//                                                         'assets/image/p.webp',
//                                                       ),
//                                                       // child: Image.asset(
//                                                       //   'assets/image/pic.png',
//                                                       //   fit: BoxFit.fill,
//                                                       // ),
//                                                     ),
//                                                     heightSpace5,
//                                                     Text(
//                                                       'Rajat Kumar',
//                                                       style: BaseStyles
//                                                           .whitelarge16,
//                                                     )
//                                                   ],
//                                                 )
//                                               : Container(),
//                                         ),
//                                         Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Positioned(
//                                                 bottom: 15,
//                                                 child: Row(
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () {
//                                                         controller.videopause
//                                                                 .value =
//                                                             !controller
//                                                                 .videopause
//                                                                 .value;
//                                                       },
//                                                       child: CircleAvatar(
//                                                         backgroundColor:
//                                                             controller
//                                                                     .videopause
//                                                                     .value
//                                                                 ? AppColors
//                                                                     .whiteColor
//                                                                 : Color
//                                                                     .fromRGBO(
//                                                                         255,
//                                                                         255,
//                                                                         255,
//                                                                         0.2),
//                                                         radius: 20,
//                                                         child: Icon(
//                                                           controller.videopause
//                                                                   .value
//                                                               ? Icons
//                                                                   .videocam_off_outlined
//                                                               : Icons
//                                                                   .videocam_outlined,
//                                                           size: 20,
//                                                           color: controller
//                                                                   .videopause
//                                                                   .value
//                                                               ? AppColors
//                                                                   .greycolor3
//                                                               : AppColors
//                                                                   .whiteColor,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     widthSpace20,
//                                                     CircleAvatar(
//                                                       backgroundColor:
//                                                           Color.fromRGBO(255,
//                                                               255, 255, 0.2),
//                                                       radius: 20,
//                                                       child: ImageIcon(
//                                                         AssetImage(
//                                                             'assets/image/addperson.png'),
//                                                         size: 20,
//                                                         color: AppColors
//                                                             .whiteColor,
//                                                       ),
//                                                     ),
//                                                     widthSpace20,
//                                                     Obx(
//                                                       () => GestureDetector(
//                                                         onTap: () {
//                                                           controller.micmute
//                                                                   .value =
//                                                               !controller
//                                                                   .micmute
//                                                                   .value;
//                                                         },
//                                                         child: CircleAvatar(
//                                                           backgroundColor:
//                                                               controller.micmute
//                                                                       .value
//                                                                   ? AppColors
//                                                                       .whiteColor
//                                                                   : Color
//                                                                       .fromRGBO(
//                                                                           255,
//                                                                           255,
//                                                                           255,
//                                                                           0.2),
//                                                           radius: 20,
//                                                           child: Icon(
//                                                             controller.micmute
//                                                                     .value
//                                                                 ? Icons.mic_off
//                                                                 : Icons.mic,
//                                                             size: 20,
//                                                             color: controller
//                                                                     .micmute
//                                                                     .value
//                                                                 ? AppColors
//                                                                     .greycolor3
//                                                                 : AppColors
//                                                                     .whiteColor,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   ],
//                                                 )),
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                               heightSpace10,
//                               Divider(
//                                 // height: 0.0,
//                                 color: Color(0xffF2F2F2),
//                               ),
//                               heightSpace20,
//                               controller.join.value
//                                   ? Align(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'Joining',
//                                             style: BaseStyles.whiteMedium16,
//                                           ),
//                                           heightSpace5,
//                                           Text(
//                                             'You will join the meeting when someone lets you in',
//                                             style: BaseStyles.grey4normal14,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   : Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Interview Information',
//                                           style: BaseStyles.whiteMedium16,
//                                         ),
//                                         heightSpace5,
//                                         Text(
//                                           'Time : 10:00 AM, 25th July 2022',
//                                           style: BaseStyles.grey4normal14,
//                                         ),
//                                         heightSpace5,
//                                         Text(
//                                           'Candidate : Rajesh Kumar',
//                                           style: BaseStyles.grey4normal14,
//                                         ),
//                                         heightSpace5,
//                                         Text(
//                                           'Job : UI/UX Design',
//                                           style: BaseStyles.grey4normal14,
//                                         ),
//                                       ],
//                                     ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       heightSpace30,
//                       mybuttons(
//                           style: controller.join.value
//                               ? BaseStyles.orangeMedium16
//                               : null,
//                           action: () {
//                             controller.join.value = !controller.join.value;
//                             controller.start.value = 5;
//                             // controller.isLoading.value = true;
//                             controller.startTimer();
//                           },
//                           height: 45.0,
//                           name: controller.join.value ? 'Cancel' : 'Join',
//                           color: controller.join.value
//                               ? AppColors.whiteColor
//                               : AppColors.secondarydarkColor,
//                           radius: 30.0),
//                       // Expanded(child: Container()),
//                       Align(
//                         child: Text(
//                           'Joining as',
//                           style: BaseStyles.grey4normal12,
//                         ),
//                       ),
//                       heightSpace3,
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 8,
//                             child: Image.asset('assets/image/pic.png'),
//                           ),
//                           widthSpace5,
//                           Text(
//                             'Rajat Kumar',
//                             style: BaseStyles.whitemedium14,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//           ),
//         ));
//   }
// }
