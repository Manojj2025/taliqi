import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:presentation_displays/displays_manager.dart';

import '../../../../constants/values.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/decoration.dart';

class MyVideoCall extends StatefulWidget {
  const MyVideoCall({super.key});

  @override
  State<MyVideoCall> createState() => _MyVideoCallState();
}

class _MyVideoCallState extends State<MyVideoCall> {
  // bool micmute = true;
  bool join = false;
  DisplayManager displayManager = DisplayManager();

  late Timer timer;
  int start = 5;
  bool nextscreen = false;
  bool showdialog = false;
  // bool videopause = false;
  bool isFrontCameraSelected = true;
  bool accept = false;
  // socket instance
  // final socket = SignallingService.instance.socket;

  bool isAudioOn = true, isVideoOn = true;
  // videoRenderer for localPeer
  final _localRTCVideoRenderer = RTCVideoRenderer();

  // videoRenderer for remotePeer
  final _remoteRTCVideoRenderer = RTCVideoRenderer();

  // mediaStream for localPeer
  MediaStream? _localStream;
  // MediaStream? _localStream2;
  // RTC peer connection
  RTCPeerConnection? _rtcPeerConnection;

  // list of rtcCandidates to be sent over signalling
  List<RTCIceCandidate> rtcIceCadidates = [];
  List list = [
    {'title': 'Share Screen', 'img': Icons.file_upload_outlined},
    {'title': 'Chat', 'img': Icons.chat},
    {'title': 'People', 'img': Icons.people_outline},
    {'title': 'Views', 'img': Icons.view_comfy_outlined},
    {'title': 'Change Background', 'img': Icons.app_registration_sharp},
    {'title': 'Report Problem', 'img': Icons.report_gmailerrorred_outlined},
  ];
  @override
  void initState() {
    // initializing renderers
    _localRTCVideoRenderer.initialize();
    _remoteRTCVideoRenderer.initialize();

    // setup Peer Connection
    _setupPeerConnection();
    super.initState();
  }

// media status
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _setupPeerConnection() async {
    // create peer connection
    _rtcPeerConnection = await createPeerConnection({
      'iceServers': [
        {
          'urls': [
            'stun:stun1.l.google.com:19302',
            'stun:stun2.l.google.com:19302'
          ]
        }
      ]
    });

    // listen for remotePeer mediaTrack event
    _rtcPeerConnection!.onTrack = (event) {
      _remoteRTCVideoRenderer.srcObject = event.streams[0];
      setState(() {});
    };

    // get localStream
    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': isAudioOn,
      'video': isVideoOn
          ? {'facingMode': isFrontCameraSelected ? 'user' : 'environment'}
          : false,
    });
    // _localStream2 = await navigator.mediaDevices.getUserMedia({
    //   'audio': isAudioOn,
    //   'video': isVideoOn
    //       ? {'facingMode': isFrontCameraSelected ? 'user' : 'environment'}
    //       : false,
    // });
    // add mediaTrack to peerConnection
    _localStream!.getTracks().forEach((track) {
      _rtcPeerConnection!.addTrack(track, _localStream!);
    });
    // _localStream2!.getTracks().forEach((track) {
    //   _rtcPeerConnection!.addTrack(track, _localStream!);
    // });
    // _localStream2?.getVideoTracks().forEach((track) {
    //   // ignore: deprecated_member_use
    //   track.switchCamera();
    // });
    setState(() {});
    // set source for local video renderer
    _localRTCVideoRenderer.srcObject = _localStream;
    _remoteRTCVideoRenderer.srcObject = _localStream;
    setState(() {});

    // // for Incoming call
    // if (widget.offer != null) {
    //   // listen for Remote IceCandidate
    //   socket!.on("IceCandidate", (data) {
    //     String candidate = data["iceCandidate"]["candidate"];
    //     String sdpMid = data["iceCandidate"]["id"];
    //     int sdpMLineIndex = data["iceCandidate"]["label"];

    //     // add iceCandidate
    //     _rtcPeerConnection!.addCandidate(RTCIceCandidate(
    //       candidate,
    //       sdpMid,
    //       sdpMLineIndex,
    //     ));
    //   });

    //   // set SDP offer as remoteDescription for peerConnection
    //   await _rtcPeerConnection!.setRemoteDescription(
    //     RTCSessionDescription(widget.offer["sdp"], widget.offer["type"]),
    //   );

    //   // create SDP answer
    //   RTCSessionDescription answer = await _rtcPeerConnection!.createAnswer();

    //   // set SDP answer as localDescription for peerConnection
    //   _rtcPeerConnection!.setLocalDescription(answer);

    //   // send SDP answer to remote peer over signalling
    //   socket!.emit("answerCall", {
    //     "callerId": widget.callerId,
    //     "sdpAnswer": answer.toMap(),
    //   });
    // }
    // // for Outgoing Call
    // else {
    //   // listen for local iceCandidate and add it to the list of IceCandidate
    //   _rtcPeerConnection!.onIceCandidate =
    //       (RTCIceCandidate candidate) => rtcIceCadidates.add(candidate);

    //   // when call is accepted by remote peer
    //   socket!.on("callAnswered", (data) async {
    //     // set SDP answer as remoteDescription for peerConnection
    //     await _rtcPeerConnection!.setRemoteDescription(
    //       RTCSessionDescription(
    //         data["sdpAnswer"]["sdp"],
    //         data["sdpAnswer"]["type"],
    //       ),
    //     );

    //     // send iceCandidate generated to remote peer over signalling
    //     for (RTCIceCandidate candidate in rtcIceCadidates) {
    //       socket!.emit("IceCandidate", {
    //         "calleeId": widget.calleeId,
    //         "iceCandidate": {
    //           "id": candidate.sdpMid,
    //           "label": candidate.sdpMLineIndex,
    //           "candidate": candidate.candidate
    //         }
    //       });
    //     }
    //   });

    //   // create SDP Offer
    //   RTCSessionDescription offer = await _rtcPeerConnection!.createOffer();

    //   // set SDP offer as localDescription for peerConnection
    //   await _rtcPeerConnection!.setLocalDescription(offer);

    //   // make a call to remote peer over signalling
    //   socket!.emit('makeCall', {
    //     "calleeId": widget.calleeId,
    //     "sdpOffer": offer.toMap(),
    //   });
    // }
  }

  Future<void> makeScreenSharing() async {
    final mediaConstraints = <String, dynamic>{'audio': true, 'video': true};

    try {
      var stream =
          await navigator.mediaDevices.getDisplayMedia(mediaConstraints);

      _localStream = stream;
      _localRTCVideoRenderer.srcObject = _localStream;
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  _leaveCall() {
    Navigator.pop(context);
  }

  _toggleMic() {
    // change status
    isAudioOn = !isAudioOn;
    // enable or disable audio track
    _localStream?.getAudioTracks().forEach((track) {
      track.enabled = isAudioOn;
    });
    setState(() {});
  }

  _toggleCamera() {
    // change status
    isVideoOn = !isVideoOn;

    // enable or disable video track
    _localStream?.getVideoTracks().forEach((track) {
      track.enabled = isVideoOn;
    });
    setState(() {});
  }

  _switchCamera() {
    // change status
    isFrontCameraSelected = !isFrontCameraSelected;

    // switch camera
    _localStream?.getVideoTracks().forEach((track) {
      // ignore: deprecated_member_use
      track.switchCamera();
    });
    setState(() {});
  }

  @override
  void dispose() {
    _localRTCVideoRenderer.dispose();
    _remoteRTCVideoRenderer.dispose();
    _localStream?.dispose();
    _rtcPeerConnection?.dispose();
    super.dispose();
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
          nextscreen = true;
          join = false;
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        appBar: AppBar(
          // systemOverlayStyle: .changestatusbarcolor(),
          centerTitle: true,
          backgroundColor: Color(0xff202020),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: 10,
                child: Image.asset(
                  'assets/image/infinity.png',
                  height: 12,
                ),
              ),
              widthSpace5,
              Text(
                'Oodles Tech...',
                style: BaseStyles.whitebold14,
              ),
              widthSpace5,
              Icon(Icons.arrow_drop_down, size: 20, color: AppColors.whiteColor)
            ],
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
                widthSpace10,
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
                widthSpace20
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: nextscreen
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    accept
                        ? Positioned(
                            bottom: 110,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              height: MediaQuery.of(context).size.height * 0.65,
                              decoration: decorationbox2(
                                  radius: 8.0,
                                  color: Color.fromRGBO(32, 32, 32, 1)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Anurag Kuradia',
                                              style: BaseStyles.whitebold14,
                                            ),
                                            widthSpace10,
                                            GestureDetector(
                                              onTap: _toggleMic,
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.black,
                                                child: Icon(
                                                  isAudioOn
                                                      ? Icons.mic_rounded
                                                      : Icons.mic_off,
                                                  size: 18,
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.more_vert_outlined,
                                          size: 18,
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  heightSpace10,
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.50,
                                    child: !isVideoOn
                                        ? !isVideoOn
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 60,
                                                    backgroundImage: AssetImage(
                                                      'assets/image/p.webp',
                                                    ),
                                                    // child: Image.asset(
                                                    //   'assets/image/pic.png',
                                                    //   fit: BoxFit.fill,
                                                    // ),
                                                  ),
                                                  heightSpace10,
                                                  Text(
                                                    'Rajat Kumar',
                                                    style:
                                                        BaseStyles.whitelarge16,
                                                  )
                                                ],
                                              )
                                            : Container()
                                        : RTCVideoView(
                                            _remoteRTCVideoRenderer,
                                            mirror: true,
                                            objectFit: RTCVideoViewObjectFit
                                                .RTCVideoViewObjectFitCover,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/image/f.png'),
                              size: 18,
                              color: AppColors.whiteColor,
                            ),
                            widthSpace10,
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: AppColors.redcolor,
                                  size: 20,
                                ),
                                widthSpace3,
                                Text(
                                  'Rec',
                                  style: BaseStyles.grey4normal14,
                                )
                              ],
                            )
                          ],
                        ),
                        Expanded(
                          child: !showdialog
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    heightSpace50,
                                    heightSpace50,
                                    heightSpace20,
                                    heightSpace5,
                                    Text(
                                      'You’re the only one in the interview',
                                      style: BaseStyles.whiteMedium16,
                                    ),
                                    heightSpace5,
                                    Text(
                                      'Please wait for others to join',
                                      style: BaseStyles.grey4normal14,
                                    ),
                                    heightSpace10,
                                    heightSpace5,
                                    Text(
                                      'Share this link with others',
                                      style: BaseStyles.whitemedium14,
                                    ),
                                    heightSpace5,
                                    InkWell(
                                      onTap: () {
                                        setState(() {});
                                        showdialog = true;
                                        showDialog(
                                            // useSafeArea: true,
                                            // barrierColor: Colors.black,
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context) => WillPopScope(
                                                  onWillPop: () async => false,
                                                  child: AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    actionsAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    // buttonPadding: EdgeInsets.zero,
                                                    elevation: 10,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 0.2),
                                                    // backgroundColor: Color.fromRGBO(
                                                    //     255, 255, 255, 0.2),
                                                    insetPadding:
                                                        EdgeInsets.all(10),
                                                    titlePadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            right: 15,
                                                            top: 10),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    // <-- SEE HERE
                                                    title: Text(
                                                      'Anurag wants to join this interview',
                                                      style: BaseStyles
                                                          .whitelarge16,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        height: 50,
                                                        decoration:
                                                            new BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                          // color: Color.fromRGBO(
                                                          //     255, 255, 255, 0.2),
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .all(new Radius
                                                                      .circular(
                                                                  32.0)),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 12,
                                                              child: Image.asset(
                                                                  'assets/image/pic.png'),
                                                            ),
                                                            heightSpace5,
                                                            Text(
                                                              'Rajat Kumar',
                                                              style: BaseStyles
                                                                  .whitemedium14,
                                                            )
                                                          ],
                                                        )),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        50,
                                                                    vertical:
                                                                        8),
                                                            decoration: decorationbox(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .greyprimarycolor
                                                                        .shade200),
                                                                radius: 50.0),
                                                            child: Text(
                                                              'Deny',
                                                              style: BaseStyles
                                                                  .redMedium16,
                                                            )),
                                                        onPressed: () {
                                                          setState(() {});
                                                          showdialog = false;
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        50,
                                                                    vertical:
                                                                        8),
                                                            decoration: decorationbox(
                                                                color: AppColors
                                                                    .secondarydarkColor,
                                                                radius: 50.0),
                                                            child: Text(
                                                              'Accept',
                                                              style: BaseStyles
                                                                  .whitelarge16,
                                                            )),
                                                        onPressed: () {
                                                          setState(() {
                                                            showdialog = true;
                                                            accept = true;
                                                          });

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                      },
                                      child: Container(
                                        decoration: decorationbox2(
                                            radius: 8.0,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'https://interview.taliqone.com/52368',
                                                style: BaseStyles.whitemedium14,
                                              ),
                                              widthSpace5,
                                              Icon(
                                                Icons.copy,
                                                size: 20,
                                                color: AppColors.whiteColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: !isVideoOn
                                ? Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff202020),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        isAudioOn
                                            ? Container()
                                            : Positioned(
                                                right: 5,
                                                top: 5,
                                                child: GestureDetector(
                                                  onTap: _toggleMic,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        Colors.black,
                                                    child: Icon(
                                                      isAudioOn
                                                          ? Icons.mic_rounded
                                                          : Icons.mic_off,
                                                      size: 18,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        !isVideoOn
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                      'assets/image/p.webp',
                                                    ),
                                                    // child: Image.asset(
                                                    //   'assets/image/pic.png',
                                                    //   fit: BoxFit.fill,
                                                    // ),
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Rajat Kumar',
                                                    style:
                                                        BaseStyles.whitebold12,
                                                  )
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Color(0xff202020),
                                      height: 150,
                                      width: 120,
                                      child: RTCVideoView(
                                        _localRTCVideoRenderer,
                                        mirror: isFrontCameraSelected,
                                        objectFit: RTCVideoViewObjectFit
                                            .RTCVideoViewObjectFitCover,
                                      ),
                                    ),
                                    // Image.asset(
                                    //   'assets/image/pic.png',
                                    //   height: 150,
                                    //   width: 120,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                          ),
                        ),
                        heightSpace20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: _toggleCamera,
                              child: CircleAvatar(
                                backgroundColor: !isVideoOn
                                    ? AppColors.whiteColor
                                    : Color.fromRGBO(255, 255, 255, 0.2),
                                radius: 20,
                                child: Icon(
                                  isVideoOn
                                      ? Icons.videocam
                                      : Icons.videocam_off,
                                  size: 20,
                                  color: isVideoOn
                                      ? AppColors.whiteColor
                                      : AppColors.greycolor3,
                                ),
                              ),
                            ),
                            // widthSpace20,
                            GestureDetector(
                              onTap: _toggleMic,
                              child: CircleAvatar(
                                backgroundColor: !isAudioOn
                                    ? AppColors.whiteColor
                                    : Color.fromRGBO(255, 255, 255, 0.2),
                                radius: 20,
                                child: Icon(
                                  !isAudioOn ? Icons.mic_off : Icons.mic,
                                  size: 20,
                                  color: !isAudioOn
                                      ? AppColors.greycolor3
                                      : AppColors.whiteColor,
                                ),
                              ),
                            ),

                            // widthSpace20,
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(255, 255, 255, 0.2),
                              radius: 20,
                              child: Icon(
                                Icons.group_outlined,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            // widthSpace20,
                            GestureDetector(
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
                                        heightFactor: 0.42,
                                        child: Container(
                                          // height: 300,
                                          decoration:
                                              MyDecoration.radiusonlydecoration(
                                                  color: Color(0xff282828),
                                                  tlradius: 25.0,
                                                  trradius: 25.0),
                                          child: Column(
                                            children: [
                                              heightSpace20,
                                              Container(
                                                height: 4,
                                                width: 80,
                                                decoration: MyDecoration
                                                    .simpledecoration(
                                                        color: AppColors
                                                            .greyprimarycolor),
                                              ),
                                              heightSpace20,
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 8),
                                                  child: GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                                              maxCrossAxisExtent:
                                                                  180,
                                                              childAspectRatio:
                                                                  3 / 1.5,
                                                              crossAxisSpacing:
                                                                  0,
                                                              mainAxisSpacing:
                                                                  0),
                                                      itemCount: list.length,
                                                      itemBuilder:
                                                          (BuildContext ctx,
                                                              index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            switch (index) {
                                                              case 0:
                                                                Navigator.pop(
                                                                    context);
                                                                makeScreenSharing();

                                                                break;
                                                              default:
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Container(
                                                              decoration: decorationbox(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          252,
                                                                          252,
                                                                          252,
                                                                          0.05),
                                                                  radius: 4.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    // Image.asset(
                                                                    //   list[index][
                                                                    //           'img']
                                                                    //       .toString(),
                                                                    //   height: 30,
                                                                    //   width: 30,
                                                                    // ),
                                                                    // heightSpace3,
                                                                    // // ImageIcon(
                                                                    // //     AssetImage(
                                                                    // //   list[index][
                                                                    // //           'img']
                                                                    // //       .toString(),
                                                                    // // ))
                                                                    Icon(
                                                                      list[index]
                                                                          [
                                                                          'img'],
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                    ),
                                                                    heightSpace5,
                                                                    Text(
                                                                      list[index]
                                                                              [
                                                                              'title']
                                                                          .toString(),
                                                                      style: BaseStyles
                                                                          .whitenormal14,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ),
                                              heightSpace10
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                // makeScreenSharing();
                                // // // int? displayId =
                                // // //     int.tryParse(_indexToShareController.text);
                                // // // if (displayId != null) {
                                // // //   for (final display in displays) {
                                // // //     if (display?.displayId == displayId) {
                                // // displayManager.showSecondaryDisplay(
                                // //     displayId: 123456,
                                // //     routerName: "presentation");
                                // // //   }
                                // // // }
                                // // // }
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 0.2),
                                radius: 20,
                                child: Icon(
                                  Icons.more_vert_rounded,
                                  size: 20,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _leaveCall,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                                decoration: decorationbox2(
                                    radius: 40.0,
                                    color: Color.fromRGBO(235, 87, 87, 1)),
                                child: Text(
                                  'End',
                                  style: BaseStyles.whitemedium14,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    join
                        ? LinearProgressIndicator(
                            color: AppColors.primaryColor,
                            minHeight: 5,
                            backgroundColor: Color.fromRGBO(23, 23, 23, 1),
                          )
                        : Container(),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace10,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.50,
                                          child: RTCVideoView(
                                            _localRTCVideoRenderer,
                                            mirror: true,
                                            objectFit: RTCVideoViewObjectFit
                                                .RTCVideoViewObjectFitCover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff202020),
                                          gradient: !isVideoOn
                                              ? null
                                              : LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [
                                                      0.0,
                                                      1.0,
                                                    ],
                                                  colors: [
                                                      Colors.transparent,
                                                      Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ]),
                                        ),
                                        child: !isVideoOn
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundImage: AssetImage(
                                                      'assets/image/p.webp',
                                                    ),
                                                    // child: Image.asset(
                                                    //   'assets/image/pic.png',
                                                    //   fit: BoxFit.fill,
                                                    // ),
                                                  ),
                                                  heightSpace5,
                                                  Text(
                                                    'Rajat Kumar',
                                                    style:
                                                        BaseStyles.whitelarge16,
                                                  )
                                                ],
                                              )
                                            : Container(),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                              bottom: 15,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: _toggleCamera,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          !isVideoOn
                                                              ? AppColors
                                                                  .whiteColor
                                                              : Color.fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  0.2),
                                                      radius: 20,
                                                      child: Icon(
                                                        !isVideoOn
                                                            ? Icons
                                                                .videocam_off_outlined
                                                            : Icons
                                                                .videocam_outlined,
                                                        size: 20,
                                                        color: !isVideoOn
                                                            ? AppColors
                                                                .greycolor3
                                                            : AppColors
                                                                .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  widthSpace20,
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 0.2),
                                                    radius: 20,
                                                    child: ImageIcon(
                                                      AssetImage(
                                                          'assets/image/addperson.png'),
                                                      size: 20,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                  widthSpace20,
                                                  GestureDetector(
                                                    onTap: _toggleMic,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          !isAudioOn
                                                              ? AppColors
                                                                  .whiteColor
                                                              : Color.fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  0.2),
                                                      radius: 20,
                                                      child: Icon(
                                                        !isAudioOn
                                                            ? Icons.mic_off
                                                            : Icons.mic,
                                                        size: 20,
                                                        color: !isAudioOn
                                                            ? AppColors
                                                                .greycolor3
                                                            : AppColors
                                                                .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            heightSpace10,
                            Divider(
                              // height: 0.0,
                              color: Color(0xffF2F2F2),
                            ),
                            heightSpace20,
                            join
                                ? Align(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Joining',
                                          style: BaseStyles.whiteMedium16,
                                        ),
                                        heightSpace5,
                                        Text(
                                          'You will join the meeting when someone lets you in',
                                          style: BaseStyles.grey4normal14,
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Interview Information',
                                        style: BaseStyles.whiteMedium16,
                                      ),
                                      heightSpace5,
                                      Text(
                                        'Time : 10:00 AM, 25th July 2022',
                                        style: BaseStyles.grey4normal14,
                                      ),
                                      heightSpace5,
                                      Text(
                                        'Candidate : Rajesh Kumar',
                                        style: BaseStyles.grey4normal14,
                                      ),
                                      heightSpace5,
                                      Text(
                                        'Job : UI/UX Design',
                                        style: BaseStyles.grey4normal14,
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    heightSpace30,
                    mybuttons(
                        style: join ? BaseStyles.orangeMedium16 : null,
                        action: () {
                          setState(() {
                            join = !join;
                            start = 5;
                          });
                          // .isLoading.value = true;
                          startTimer();
                        },
                        height: 45.0,
                        name: join ? 'Cancel' : 'Join',
                        color: join
                            ? AppColors.whiteColor
                            : AppColors.secondarydarkColor,
                        radius: 30.0),
                    // Expanded(child: Container()),
                    Align(
                      child: Text(
                        'Joining as',
                        style: BaseStyles.grey4normal12,
                      ),
                    ),
                    heightSpace3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          child: Image.asset('assets/image/pic.png'),
                        ),
                        widthSpace5,
                        Text(
                          'Rajat Kumar',
                          style: BaseStyles.whitemedium14,
                        )
                      ],
                    )
                  ],
                ),
        ));
  }
}
