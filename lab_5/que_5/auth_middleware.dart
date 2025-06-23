import 'package:get/get.dart';
import '../../lab_2/card_view/import_export.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool loggedIn = false; // you would check real auth here
    if (!loggedIn && route == '/dashboard') {
      return RouteSettings(name: '/login');
    }
    return null;
  }
}
