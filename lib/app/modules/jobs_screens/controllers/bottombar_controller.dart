import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../views/home_view.dart';
import '../../interview_screens/views/interviews_view.dart';
import '../views/jobs_view.dart';
import '../../profile_screens/views/more_view.dart';

class BottombarController extends GetxController {
  //TODO: Implement BottombarController
  // final bottomNavIndex = 0.obs;
  late PageController pageController;
  final pageIndex = 0.obs;
  late BuildContext context;
  // List<Widget> _screens;
  late TutorialCoachMark tutorialCoachMark;

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  List children = [
    const HomeView(),
    const JobsView(),
    const InterviewsView(),
    const MoreView(),
  ];
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();
  GlobalKey keyButton4 = GlobalKey();
  GlobalKey keyButton5 = GlobalKey();

  GlobalKey keyBottomNavigation1 = GlobalKey();
  GlobalKey keyBottomNavigation2 = GlobalKey();
  GlobalKey keyBottomNavigation3 = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    createTutorial();
    pageController = PageController(initialPage: 0);
    // pageController.addListener(() {});
    Future.delayed(const Duration(seconds: 1), () {});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPage(int pageindex) {
    pageController.jumpToPage(pageindex);
    pageIndex.value = pageindex;
  }

  void showTutorial(context) {
    tutorialCoachMark.show(context: context);
  }

  createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: createTargets(),
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    );
  }

  List<TargetFocus> createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        targetPosition: TargetPosition(
            Size(100, 199),
            Offset(
              8,
              6,
            )),
        enableOverlayTab: true,
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    return targets;
  }
}
