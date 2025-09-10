
import 'package:al_rafiq/core/utils/app_router.dart';
import 'package:al_rafiq/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlRafiq());
}

class AlRafiq extends StatelessWidget {
  const AlRafiq({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
     // darkTheme: AppThemes.darkTheme,
    //  themeMode: ThemeMode.system, // يغير بين Light/Dark حسب إعدادات الجهاز
    );
  }
}
