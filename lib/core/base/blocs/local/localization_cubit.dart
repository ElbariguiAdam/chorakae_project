import 'package:chorakae_project/core/base/blocs/local/localization_manager.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  final SharedPreferences _sharedPreferences;
  LocaleCubit(this._sharedPreferences)
      : super(ChangeLocaleState(locale: const Locale('fr')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper(sharedPreferences: _sharedPreferences)
            .getCachedLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper(sharedPreferences: _sharedPreferences)
        .cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
