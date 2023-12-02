import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Options'),
      ),
      body: Center(
        child: Text(
          'This is the filter page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
