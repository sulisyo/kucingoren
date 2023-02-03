// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../../l10n/app_localizations.dart' as _i3;
import '../../utils/themes/theme_controller.dart' as _i12;
import '../bloc/count_bloc.dart' as _i5;
import '../bloc/rick_characters_bloc.dart' as _i10;
import '../data/api/api_interceptor.dart' as _i14;
import '../data/api/api_one.dart' as _i7;
import '../data/api/rick_and_morty_service.dart' as _i9;
import '../data/repository/rick_and_morty_respository.dart' as _i8;
import '../data/repository/token_repository.dart' as _i13;
import 'module_injector.dart' as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.BuildContext>(() => registerModule.buildContext);
  gh.singleton<_i5.CountBloc>(registerModule.countBloc);
  gh.singleton<_i6.Dio>(registerModule.dio);
  gh.singleton<_i7.RestClient>(registerModule.restClient);
  gh.singleton<_i8.RickAndMortyRepository>(registerModule.postRepository);
  gh.singleton<_i9.RickAndMortyService>(registerModule.service);
  gh.singleton<_i10.RickCharactersBloc>(registerModule.rickCharactersCubit);
  await gh.singletonAsync<_i11.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  await gh.factoryAsync<_i12.ThemeController>(
    () => registerModule.themeController,
    preResolve: true,
  );
  gh.singletonAsync<_i13.TokenRepository>(() => registerModule.tokenRepository);
  gh.factoryAsync<_i14.ApiInterceptor>(() async =>
      _i14.ApiInterceptor(await get.getAsync<_i13.TokenRepository>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
