import 'package:get/get.dart';
import 'package:punjabsuper/screen/login/login.dart';
import 'package:punjabsuper/screen/lucky_patta/licky_patta.dart';
import 'package:punjabsuper/screen/menu/menu.dart';

class AppRoutes {
  static const String login = '/login';
  static const String menu = '/menu';
  static const String luckyPatta = '/luckyPatta';

  static List<GetPage> pages = [
    GetPage(name: login, page: () => Login()),
    GetPage(name: menu, page: () => const Menu()),
    GetPage(name: luckyPatta, page: () => const LuckyPatt()),
  ];
}
