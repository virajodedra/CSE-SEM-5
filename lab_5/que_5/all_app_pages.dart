import 'package:advance_flutter/lab_5/que_5/simple_dashboard_for_demo_purpose.dart';
import 'package:advance_flutter/lab_5/que_5/simple_login_screen.dart';
import 'package:get/get.dart';

import 'auth_middleware.dart';
import 'main_simple_screen.dart';


class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => MainSimpleScreen()),
    GetPage(name: '/login', page: () => SimpleLoginScreen()),
    GetPage(
      name: '/dashboard',
      page: () => SimpleDashboardForDemoPurpose(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
