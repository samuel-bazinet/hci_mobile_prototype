import 'package:flutter/material.dart';
import 'RouteInformation.dart' as MyRoute;
import 'Settings.dart';
import 'PlanRoute.dart';

class RouteList extends StatelessWidget {
  final List<Map<String, String>> routeInformation = [
    {
      'title': 'Option 1',
      'pointInfo': 'Point A - Point B',
      'totalTime': '2 hours',
      'startTime': '7:00 am',
      'arrivalTime': '8:15 pm',
      'transfers': '1',
      'delayRisk': 'HIGH',
      'peopleAmount': 'low',
    },
    {
      'title': 'Option 2',
      'pointInfo': 'Point X - Point Y',
      'totalTime': '1.5 hours',
      'startTime': '8:30 am',
      'arrivalTime': '10:00 am',
      'transfers': '0',
      'delayRisk': 'LOW',
      'peopleAmount': 'medium',
    },
    {
      'title': 'Option 3',
      'pointInfo': 'Point M - Point N',
      'totalTime': '3 hours',
      'startTime': '10:30 am',
      'arrivalTime': '1:30 pm',
      'transfers': '2',
      'delayRisk': 'MEDIUM',
      'peopleAmount': 'high',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route List'),
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
      body: ListView.builder(
        itemCount: routeInformation.length,
        itemBuilder: (context, index) {
          return buildTile(context, routeInformation[index]);
        },
      ),
      bottomNavigationBar: Padding(
        padding:
        const EdgeInsets.all(16.0), // Add padding to increase button size
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlanRoutePage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              'Plan Another Route',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTile(BuildContext context, Map<String, String> data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyRoute.RouteInformation(
            title: data['title'] ?? '',
            pointInfo: data['pointInfo'] ?? '',
            totalTime: data['totalTime'] ?? '',
            startTime: data['startTime'] ?? '',
            arrivalTime: data['arrivalTime'] ?? '',
            transfers: data['transfers'] ?? '',
            delayRisk: data['delayRisk'] ?? '',
            peopleAmount: data['peopleAmount'] ?? '',
            )
          ),
        );

      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${data['pointInfo'] ?? ''} | ${data['totalTime'] ?? ''}',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start: ${data['startTime'] ?? ''}'),
                  Text('Arrival: ${data['arrivalTime'] ?? ''}'),
                  Text('Transfers: ${data['transfers'] ?? ''}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delay Risk: ${data['delayRisk'] ?? ''}',
                    style: TextStyle(
                      color: _getDelayRiskColor(data['delayRisk']),
                    ),
                  ),
                  Text(
                    'Amount of people: ${data['peopleAmount'] ?? ''}',
                    style: TextStyle(
                      color: _getPeopleAmountColor(data['peopleAmount']),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _getDelayRiskColor(String? delayRisk) {
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

Color _getPeopleAmountColor(String? peopleAmount) {
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
