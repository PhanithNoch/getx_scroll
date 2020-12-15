import 'package:get/get.dart';
import 'package:getmoneyxapp/views/home_screen.dart';
import 'package:getmoneyxapp/views/prompt_pay_screen.dart';
import 'package:getmoneyxapp/views/report_screen.dart';
import 'package:getmoneyxapp/views/search_page.dart';
import 'package:getmoneyxapp/views/splash_screen.dart';

class AppPage {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: 'home', page: () => HomeScreen()),
    GetPage(name: 'home_prompt_pay_page', page: () => PromptPayScreen()),
    GetPage(name: 'report', page: () => ReportScreen()),
    GetPage(name: 'search', page: () => SearchPage()),

  ];
}
