import 'package:oren/app/feature_a/presentation/empty_home/sample_empty_home.dart';
import 'package:oren/app/feature_a/presentation/input_form_page.dart';
import 'package:oren/app/feature_a/presentation/rick_character_page.dart';
import 'package:oren/app/feature_a/presentation/simple_home_page.dart';
import 'package:oren/app/feature_a/presentation/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:oren/app/pages/home/ui/home_page.dart';
import 'package:oren/app/pages/home/binding/home_page_binding.dart';
import 'package:oren/app/pages/splash/ui/splash_page.dart';
import 'package:oren/app/pages/splash/binding/splash_page_binding.dart';

abstract class _Paths {
  _Paths._();

  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String SIMPLE_HOME = '/simple_home';
  static const String RICK_CHARACTERS = '/rick_characters';
  static const String INPUT_FORM = '/input_form';
  static const String WELCOME = '/welcome';
  static const String COMBO_HOME = '/combo_home';
}

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = _Paths.HOME;

  static var routes = [
    GetPage(
        name: _Paths.HOME, page: () => HomePage(), binding: HomePageBinding()),
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashPage(),
        binding: SplashPageBinding()),
    GetPage(name: _Paths.SIMPLE_HOME, page: () => SimpleHomePage()),
    GetPage(name: _Paths.RICK_CHARACTERS, page: () => RickCharactersPage()),
    GetPage(name: _Paths.INPUT_FORM, page: () => InputFormPage()),
    GetPage(name: _Paths.WELCOME, page: () => WelcomeScreen()),
    GetPage(name: _Paths.COMBO_HOME, page: () => SampleEmptyHome()),
  ];
}
