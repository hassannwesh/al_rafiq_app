import 'package:al_rafiq/core/utils/app_router.dart';
import 'package:al_rafiq/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo Animation
            Center(
              child: Image.asset(AssetsData.logo, width: 200)
                  .animate()
                  .fade(duration: 800.ms)
                  .scale(
                    delay: 400.ms,
                    duration: 600.ms,
                    curve: Curves.easeOutBack,
                  )
                  .shimmer(
                    delay: 1200.ms,
                    duration: 1000.ms,
                    color: Colors.white38,
                  )
                  .then()
                  .shake(hz: 4, curve: Curves.easeInOut),
            ),
            const SizedBox(height: 20),

            // Text Animation
            Text(
                  'الرفيق',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                )
                .animate()
                .fadeIn(delay: 1000.ms, duration: 600.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),

            const SizedBox(height: 10),

            // Subtitle Animation
            Text(
              'خير صاحب في الطريق',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withOpacity(0.8),
              ),
            ).animate().fadeIn(delay: 1500.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
