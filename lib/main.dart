import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:al_rafiq/core/manager/theme_cubit/theme_cubit.dart';
import 'package:al_rafiq/core/manager/theme_cubit/theme_state.dart';
import 'package:al_rafiq/core/utils/app_router.dart';
import 'package:al_rafiq/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const AlRafiq());
}

class AlRafiq extends StatelessWidget {
  const AlRafiq({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => PrayerTimeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.getTheme(
              brightness: Brightness.light,
              primaryColor: state.primaryColor,
            ),
            darkTheme: AppThemes.getTheme(
              brightness: Brightness.dark,
              primaryColor: state.primaryColor,
            ),
            themeMode: state.themeMode,
            locale: const Locale('ar'),
            supportedLocales: const [Locale('ar'), Locale('en')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
