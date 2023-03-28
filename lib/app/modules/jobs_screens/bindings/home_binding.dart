import 'package:get/get.dart';

import '../controllers/bottombar_controller.dart';
import '../controllers/home_controller.dart';
import '../../interview_screens/controllers/interviews_controller.dart';
import '../controllers/jobdetail_controller.dart';
import '../controllers/jobs_controller.dart';
import '../../profile_screens/controllers/more_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobdetailController>(
      () => JobdetailController(),
    );
    Get.lazyPut<MoreController>(
      () => MoreController(),
    );
    Get.lazyPut<InterviewsController>(
      () => InterviewsController(),
    );
    Get.lazyPut<JobsController>(
      () => JobsController(),
    );
    Get.lazyPut<BottombarController>(
      () => BottombarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
