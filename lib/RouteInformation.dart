import 'package:flutter/material.dart';
import 'Settings.dart';

class RouteInformation extends StatelessWidget {
  final String title;
  final String pointInfo;
  final String totalTime;
  final String startTime;
  final String arrivalTime;
  final String transfers;
  final String delayRisk;
  final String peopleAmount;

  RouteInformation({
    required this.title,
    required this.pointInfo,
    required this.totalTime,
    required this.startTime,
    required this.arrivalTime,
    required this.transfers,
    required this.delayRisk,
    required this.peopleAmount,
  });

  // Function to get image based on title
  Widget getImage(String title) {
    switch (title) {
      case 'Option 1':
        return Image.asset('assets/Route1.png'); // Replace with your image path
      case 'Option 2':
        return Image.asset('assets/Route2.png'); // Replace with your image path
      case 'Option 3':
        return Image.asset('assets/Route3.png'); // Replace with your image path
      default:
        return SizedBox(); // Return an empty container for titles without specific images
    }
  }

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
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '$pointInfo | $totalTime',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text('Start: $startTime'),
                  Text('Arrival: $arrivalTime'),
                  Text('Transfers: $transfers'),
                  SizedBox(height: 8.0),
                  Text(
                    'Delay Risk: $delayRisk',
                    style: TextStyle(
                      color: _getDelayRiskColor(delayRisk),
                    ),
                  ),
                  Text(
                    'Amount of people: $peopleAmount',
                    style: TextStyle(
                      color: _getPeopleAmountColor(peopleAmount),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Display image based on title
          getImage(title),
        ],
      ),
    );

  }
}

Color _getDelayRiskColor(String delayRisk) {
  // Assign colors based on delay risk level
  switch (delayRisk) {
    case 'HIGH':
      return Colors.red;
    case 'MEDIUM':
      return Colors.orange;
    case 'LOW':
      return Colors.green;
    default:
      return Colors.black;
  }
}

Color _getPeopleAmountColor(String peopleAmount) {
  // Assign colors based on people amount level
  switch (peopleAmount) {
    case 'high':
      return Colors.red;
    case 'medium':
      return Colors.orange;
    case 'low':
      return Colors.green;
    default:
      return Colors.black;
  }
}
