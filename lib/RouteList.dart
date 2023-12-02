import 'package:flutter/material.dart';
import 'RouteInformation.dart' as MyRoute;
import 'Settings.dart';

class RouteList extends StatelessWidget {
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
      body: ListView(
        children: [
          buildTile(context, 'Tile 1'),
          buildTile(context, 'Tile 2'),
          buildTile(context, 'Tile 3'),
        ],
      ),
    );
  }

  Widget buildTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyRoute.RouteInformation(title)),
        );

      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
