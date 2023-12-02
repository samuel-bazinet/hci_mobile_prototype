import 'package:flutter/material.dart';
import 'PlanRoute.dart';
import 'Settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      // Using ElevatedButton for navigation
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to increase button size
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlanRoutePage()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Plan Route',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}

