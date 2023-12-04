// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                // Navigate to Account settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to Notifications settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode'),
              trailing: ValueListenableBuilder(
                valueListenable: themeModeNotifier,
                builder: (context, value, child) {
                  return Switch(
                    value: value == ThemeMode.dark,
                    onChanged: (value) {
                      themeModeNotifier.value =
                          value ? ThemeMode.dark : ThemeMode.light;
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy & Security'),
              onTap: () {
                // Navigate to Privacy & Security settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                // Navigate to Help & Support page
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
