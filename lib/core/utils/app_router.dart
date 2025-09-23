import 'package:al_rafiq/feature/home/presentation/views/Sections/views/azkar_view.dart';
import 'package:al_rafiq/feature/home/presentation/views/home_view.dart';
import 'package:al_rafiq/feature/splash/presentation/views/widgets/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeview';
static const String kAzkarView='/azkarview';
  String get initialRoute;
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(path: kAzkarView,
       builder: (context, GoRouterState state){
        return const AzkarView();
      }),

    ],
  );
}
