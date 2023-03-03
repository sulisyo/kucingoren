import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../l10n/app_localizations.dart';
import 'core/app_constants.dart';
import 'core/app_routes.dart';
import 'core/utils/themes/theme_controller.dart';
import 'core/utils/themes/themes.dart';
import 'core/utils/translations/messages.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return getAlohaMaterialApp();
  }

  Widget getMaterialApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.applicationTitle,
      translations: Messages(),
      locale: const Locale('id', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      themeMode: themeController.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('id'), // indonesia
      ],
    );
  }

  Widget getAlohaApp() {
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

  Widget getAlohaMaterialApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.applicationTitle,
      translations: Messages(),
      locale: const Locale('id', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      themeMode: themeController.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialRoute: AppRoutes.initialRouteAloha,
      getPages: AppRoutes.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('id'), // indonesia
      ],
    );
  }
}
