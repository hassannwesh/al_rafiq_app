import 'package:al_rafiq/core/utils/app_router.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الرفيق', style: TextStyle(fontSize: 28)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Center(
                child: Text(
                  'الرفيق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('الإعدادات'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                GoRouter.of(context).push(AppRouter.kSettingsView);
              },
            ),
          ],
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
