import 'package:flutter/material.dart';
import 'RouteList.dart';
import 'Settings.dart';
import 'Filter.dart';

class PlanRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Route'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Filter()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Plan your route here',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      // Using an ElevatedButton for navigation
      bottomNavigationBar: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteList()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  'Search',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
