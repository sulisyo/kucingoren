import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

import '../feature_a/di/injection.dart';

abstract class Paths {
  Paths._();

  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String SIMPLE_HOME = '/simple_home';
  static const String RICK_CHARACTERS = '/rick_characters';
  static const String INPUT_FORM = '/input_form';
  static const String WELCOME = '/welcome';
  static const String COMBO_HOME = '/combo_home';
  static const String ALOHA_ENTRY = '/aloha';
}

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = Paths.HOME;
  static const String initialRouteAloha = Paths.ALOHA_ENTRY;

  static var routes = [
    GetPage(
        name: Paths.HOME, page: () => HomePage(), binding: HomePageBinding()),
    GetPage(
        name: Paths.SPLASH,
        page: () => SplashPage(),
        binding: SplashPageBinding()),
    GetPage(name: Paths.SIMPLE_HOME, page: () => SimpleHomePage()),
    GetPage(name: Paths.RICK_CHARACTERS, page: () => RickCharactersPage()),
    GetPage(name: Paths.INPUT_FORM, page: () => InputFormPage()),
    GetPage(name: Paths.WELCOME, page: () => WelcomeScreen()),
    GetPage(name: Paths.COMBO_HOME, page: () => SampleEmptyHome()),
    GetPage(name: Paths.ALOHA_ENTRY, page: () => getAlohaApp()),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          _pageBuilder(context, settings),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 100),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      settings: settings,
    );
  }

  static Widget _pageBuilder(BuildContext context, RouteSettings settings) {
    for( final getPage in routes) {
     if(getPage.name == settings.name){
       return getPage.page();
     }
    }
    return HomePage();
  }

  static Widget getAlohaApp() {

    return AlohaApp(
      theme: AlohaThemeData.purpleThemeLight(),
      darkTheme: AlohaThemeData.gopayThemeDark(),
      themeMode: AlohaThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      isHapticFeedbackTurnedOn: false,
    );
  }

  static Route getRoute(BuildContext context, String path){
    for( final getPage in routes) {
      if(getPage.name == path){
        return MaterialPageRoute(builder: (context) => getPage.page());
      }
    }
    return  MaterialPageRoute(builder: (context) => HomePage());
  }
}
