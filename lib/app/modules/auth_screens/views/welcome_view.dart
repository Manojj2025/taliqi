import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:taliqi/app/modules/auth_screens/controllers/welcome_controller.dart';

import '../../../constants/values.dart';
import '../../../widgets/buttons.dart';
import 'login_view.dart';

class WelcomeView extends GetView<WelcomeController> {
  final introKey = GlobalKey<IntroductionScreenState>();

  WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WelcomeController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            key: introKey,
            dotsFlex: 2,
            globalFooter: Column(
              children: [
                mybuttons(
                    action: () {
                      Get.to(LoginView());
                    },
                    name: 'Get Started',
                    radius: 8.0,
                    color: AppColors.orangecolor,
                    height: 45.0),
                heightSpace50,
                heightSpace20,
                heightSpace50,
                // heightSpace50,
                Text(
                  'Apple uses the information we gather to troubleshoot and support your device and give the best support possible.',
                  style: BaseStyles.grey3Normal12,
                  textAlign: TextAlign.center,
                ),
                heightSpace10,
                Text(
                  'See our Privacy Policy',
                  style: BaseStyles.blueNormal12,
                )
              ],
            ),
            pages: [
              pageModel(
                  body:
                      'Automate your talent intelligence with a holistic & seamless solution',
                  title: 'Welcome to Taliq-I',
                  image: MyImages.intro),
              pageModel(
                  body:
                      'Automate your talent intelligence with a holistic & seamless solution',
                  title: 'Welcome to Taliq-I',
                  image: MyImages.intro),
              pageModel(
                  title: 'Welcome to Taliq-I',
                  body:
                      'Automate your talent intelligence with a holistic & seamless solution',
                  image: MyImages.intro),
            ],
            //  [

            onDone: () => _onIntroEnd(context),
            onSkip: () =>
                _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: false,
            nextFlex: 0,
            //rtl: true, // Display as right-to-left
            skip: const Text(''),
            next: const Text(''),
            done: const Text(
              '',
            ),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: kIsWeb
                ? const EdgeInsets.all(12.0)
                : const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
            dotsDecorator: DotsDecorator(
              spacing: const EdgeInsets.symmetric(horizontal: 3),
              size: const Size(10.0, 10.0),
              color: AppColors.greyprimarycolor.shade200,
              activeColor: AppColors.primaryColor,
              activeSize: const Size(10.0, 10.0),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            )),
      ),
    );
  }

  PageViewModel pageModel({
    required body,
    required title,
    required image,
  }) {
    return PageViewModel(
        bodyWidget: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heightSpace30,
                    Image.asset(
                      image,
                      height: 150,
                      width: Get.width,
                    ),
                    heightSpace30,
                    Text(
                      title,
                      style: BaseStyles.blackMedium24,
                    ),
                    heightSpace10,
                    Text(
                      body,
                      style: BaseStyles.grey3Normal16,
                      textAlign: TextAlign.center,
                    ),
                    heightSpace50
                  ],
                ),
              ),
            ],
          ),
        ),
        titleWidget: Container(),
        decoration: const PageDecoration(
            bodyAlignment: Alignment.center, titlePadding: EdgeInsets.all(10)));
  }

  void _onIntroEnd(context) {
    // Get.offAll(() => WelcomeView());
    WelcomeController().dispose();
  }
}
