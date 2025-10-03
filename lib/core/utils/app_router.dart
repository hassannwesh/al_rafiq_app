import 'package:al_rafiq/feature/home/presentation/views/Sections/views/azkar_view.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/evening_azkar_view.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/azkar_details_view.dart';
import 'package:al_rafiq/feature/home/presentation/views/home_view.dart';
import 'package:al_rafiq/feature/splash/presentation/views/widgets/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeview';
  static const String kAzkarView = '/azkarview';
  static const String kAzkarDetails = '/azkardetails';
  static const String kEveningAzkar = '/eveningAzkar';
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
      GoRoute(
        path: kAzkarView,
        builder: (context, GoRouterState state) {
          return const AzkarView();
        },
      ),
      GoRoute(
        path: kAzkarDetails,
        builder: (context, GoRouterState state) {
          return const AzkarDetailsView();
        },
      ),
      GoRoute(
        path: kEveningAzkar,
        builder: (context, GoRouterState state) {
          return const EveningAzkarView();
        },
      ),
    ],
  );
}
