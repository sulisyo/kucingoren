

import 'package:dio/dio.dart';
import 'package:oren/app/feature_a/data/repository/rick_and_morty_respository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:oren/app/feature_a/data/repository/token_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/app_localizations.dart';
import '../../../l10n/app_localizations_id.dart';
import '../../utils/themes/theme_controller.dart';
import '../bloc/count_bloc.dart';
import '../bloc/rick_characters_bloc.dart';
import '../data/api/api_one.dart';
import '../data/api/rick_and_morty_service.dart';


@module
abstract class RegisterModule {

  @preResolve
  Future<ThemeController> get themeController async => ThemeController();

  @Singleton()
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Singleton()
  Dio get dio => Dio();

  @Singleton()
  Future<TokenRepository> get tokenRepository async => TokenRepository(sharedPreferences: await prefs);

  @Singleton()
  RestClient get restClient => RestClient(dio);

  @singleton
  CountBloc get countBloc => CountBloc();

  @singleton
  RickAndMortyService get service => RickAndMortyService(dio);

  @singleton
  RickAndMortyRepository get postRepository => RickAndMortyRepository(service);

  @singleton
  RickCharactersBloc get rickCharactersCubit => RickCharactersBloc(postRepository);

  @lazySingleton
  BuildContext get buildContext => GetIt.I<BuildContext>();

  @lazySingleton
  AppLocalizations localizations() => AppLocalizationsId();

}