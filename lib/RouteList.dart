import 'package:flutter/material.dart';

class RouteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route List'),
      ),
      body: Center(
        child: Text(
          'List of Routes',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
