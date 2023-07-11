import 'package:get/get.dart';
import 'package:punjabsuper/screen/common/login/login.dart';
import 'package:punjabsuper/screen/common/lucky100PS/lucy_100_PS.dart';
import 'package:punjabsuper/screen/common/lucky_patta/lucky_patta.dart';
import 'package:punjabsuper/screen/common/menu/menu.dart';

// Mobile Routes

// import 'package:punjabsuper/screen/mobile/login/login.dart' as mlogin;
// import 'package:punjabsuper/screen/mobile/lucky100PS/lucy_100_PS.dart'
//     as mLucky100PS;
// import 'package:punjabsuper/screen/mobile/lucky_patta/licky_patta.dart'
//     as mLuckyPatta;
// import 'package:punjabsuper/screen/mobile/menu/menu.dart' as mMenu;

class AppRoutes {
  static const String login = '/login';
  static const String mobileLogin = '/mobile-login';
  static const String menu = '/menu';
  static const String mobileMenu = '/mobile-menu';
  static const String luckyPatta = '/luckyPatta';
  static const String mobileLuckyPatta = '/mobile-luckyPatta';
  static const String lucky100PS = '/lucky100PS';
  static const String mobileLucky100PS = '/mobile-lucky100PS';

  static List<GetPage> pages = [
    GetPage(name: login, page: () => Login()),
    // GetPage(name: mobileLogin, page: () => mlogin.Login()),
    GetPage(name: menu, page: () => const Menu()),
    // GetPage(name: mobileMenu, page: () => mMenu.Menu()),
    GetPage(name: luckyPatta, page: () => LuckyPatty()),
    // GetPage(name: mobileLuckyPatta, page: () => mLuckyPatta.LuckyPatt()),
    GetPage(name: lucky100PS, page: () => Lucky100PS()),
    // GetPage(name: mobileLucky100PS, page: () => mLucky100PS.Lucky100PS()),
  ];
}
