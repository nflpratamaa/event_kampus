import 'package:get/get.dart';
import '../modules/home/home_page.dart';
import '../modules/detail/detail_page.dart';
import '../modules/agenda/agenda_page.dart';
import '../modules/contact/contact_page.dart';
import '../modules/about/about_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.DETAIL, page: () => DetailPage()),
    GetPage(name: Routes.AGENDA, page: () => AgendaPage()),
    GetPage(name: Routes.CONTACT, page: () => ContactPage()),
    GetPage(name: Routes.ABOUT, page: () => AboutPage()),
  ];
}
