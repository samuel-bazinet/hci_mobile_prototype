import 'package:flutter/material.dart';
import 'Settings.dart';

class RouteInformation extends StatelessWidget {
  final String title;
  final Key? key;

  RouteInformation(this.title, {this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Information'),
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
          'Information about $title',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
