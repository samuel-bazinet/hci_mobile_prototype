import 'package:flutter/material.dart';
import 'RouteList.dart';

class PlanRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Route'),
      ),
      body: Center(
        child: Text(
          'Plan your route here',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      // Using an ElevatedButton for navigation
      bottomNavigationBar: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align the button at the center
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteList()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
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
