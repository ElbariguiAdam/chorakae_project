import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_cubit.dart';
import 'package:chorakae_project/core/base/blocs/local/localization_state.dart';
import 'package:chorakae_project/core/responsive_helpers/size_provider.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/core/theme/app_theme.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/category_blocs/show_more_cubit.dart';
import 'package:chorakae_project/feutures/annonce/presentation/blocs/main_wrapper_bloc/main_wrapper_bloc.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chorakae_project/injection_container.dart' as dr;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dr.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowMoreCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => dr.sl<LocaleCubit>()..getSavedLanguage(),
        ),
      ],
      child: SizeProvider(
        baseSize: const Size(360, 690),
        height: context.screenHeight,
        width: context.screenWidth,
        child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Chorakae',
              locale: state.locale,
              supportedLocales: const [
                Locale('en'),
                Locale('fr'),
                Locale('ar')
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              home: const MainWrapper(),
            );
          },
        ),
      ),
    );
  }
}
