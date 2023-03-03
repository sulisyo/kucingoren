import 'package:asphalt_aloha/asphalt_aloha.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AppState extends ChangeNotifier {

  static AppState of(BuildContext context) {
    return GetIt.I<AppState>();
  }

  final AlohaThemeData _themeData = AlohaThemeData.purpleThemeLight();

  AlohaThemeData get themeData => _themeData;

}
