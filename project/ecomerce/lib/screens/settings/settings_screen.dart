import 'package:ecomerce/controllers/app_theme_controller.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ValueListenableBuilder<ThemeMode>(
        valueListenable: AppThemeController.themeMode,
        builder: (context, themeMode, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Theme mode section
              Text(
                'Theme Mode',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.25),
                  ),
                ),
                child: Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: themeMode,
                      onChanged: _changeTheme,
                      title: const Text('Light'),
                      secondary: const Icon(Icons.light_mode_outlined),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: themeMode,
                      onChanged: _changeTheme,
                      title: const Text('Dark'),
                      secondary: const Icon(Icons.dark_mode_outlined),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue: themeMode,
                      onChanged: _changeTheme,
                      title: const Text('System default'),
                      secondary: const Icon(Icons.phone_android_outlined),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _changeTheme(ThemeMode? mode) {
    if (mode == null) return;
    AppThemeController.changeTheme(mode);
  }
}
