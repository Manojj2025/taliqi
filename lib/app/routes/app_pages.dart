import 'package:get/get.dart';
import 'package:taliqi/app/modules/auth_screens/views/welcome_view.dart';

import '../modules/jobs_screens/bindings/home_binding.dart';
import '../modules/jobs_screens/views/bottombar_view.dart';
import '../modules/jobs_screens/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.welcome;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.welcome,
      page: () => WelcomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.bottombar,
      page: () => const BottombarView(),
      binding: HomeBinding(),
    ),
  ];
}
