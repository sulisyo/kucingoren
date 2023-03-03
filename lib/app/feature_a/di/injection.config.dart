// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter/material.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../../l10n/app_localizations.dart' as _i3;
import '../../core/AppState.dart' as _i4;
import '../../core/utils/themes/theme_controller.dart' as _i14;
import '../../pages/home/controller/home_page_controller.dart' as _i8;
import '../bloc/count_bloc.dart' as _i6;
import '../bloc/rick_characters_bloc.dart' as _i12;
import '../data/api/api_one.dart' as _i9;
import '../data/api/rick_and_morty_service.dart' as _i11;
import '../data/interceptor/api_interceptor.dart' as _i16;
import '../data/repository/rick_and_morty_respository.dart' as _i10;
import '../data/repository/token_repository.dart' as _i15;
import 'module_injector.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppLocalizations>(() => registerModule.localizations());
  gh.lazySingleton<_i4.AppState>(() => registerModule.appState);
  gh.lazySingleton<_i5.BuildContext>(() => registerModule.buildContext);
  gh.singleton<_i6.CountBloc>(registerModule.countBloc);
  gh.singleton<_i7.Dio>(registerModule.dio);
  gh.lazySingleton<_i8.HomePageController>(
      () => registerModule.homepageController);
  gh.singleton<_i9.RestClient>(registerModule.restClient);
  gh.singleton<_i10.RickAndMortyRepository>(registerModule.postRepository);
  gh.singleton<_i11.RickAndMortyService>(registerModule.service);
  gh.singleton<_i12.RickCharactersBloc>(registerModule.rickCharactersCubit);
  await gh.singletonAsync<_i13.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  await gh.factoryAsync<_i14.ThemeController>(
    () => registerModule.themeController,
    preResolve: true,
  );
  gh.singletonAsync<_i15.TokenRepository>(() => registerModule.tokenRepository);
  gh.factoryAsync<_i16.ApiInterceptor>(() async =>
      _i16.ApiInterceptor(await get.getAsync<_i15.TokenRepository>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
