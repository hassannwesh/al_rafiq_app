import 'package:al_rafiq/core/manager/theme_cubit/theme_cubit.dart';
import 'package:al_rafiq/core/manager/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  final List<Color> colors = const [
    Color(0xFF145A32), // Green (Default)
    Color(0xFF1F618D), // Blue
    Color(0xFFB03A2E), // Red
    Color(0xFFD35400), // Orange
    Color(0xFF7D3C98), // Purple
    Color(0xFF2E4053), // Dark Blue/Grey
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionTitle(context, 'المظهر'),
            SwitchListTile(
              title: const Text('الوضع الليلي'),
              value: state.themeMode == ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeCubit>().changeThemeMode(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
            const Divider(),
            _buildSectionTitle(context, 'لون التطبيق'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    context.read<ThemeCubit>().changePrimaryColor(color);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: state.primaryColor.value == color.value
                          ? Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 3,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: state.primaryColor.value == color.value
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }
}
