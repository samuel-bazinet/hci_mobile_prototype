import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map/flutter_map.dart';
import 'RouteList.dart';
import 'Settings.dart';
import 'Filter.dart';

class PlanRoutePage extends StatelessWidget {
  final startingPointController = TextEditingController();
  final destinationController = TextEditingController();

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
                  MaterialPageRoute(builder: (context) => const Filter()),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const Flexible(
                    flex: 0,
                    child:
                        Padding(padding: EdgeInsets.all(5), child: Text('A:')),
                  ),
                  Flexible(
                    flex: 8,
                    child: TextField(
                      controller: startingPointController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const Flexible(
                    flex: 0,
                    child:
                        Padding(padding: EdgeInsets.all(5), child: Text('B:')),
                  ),
                  Flexible(
                    flex: 8,
                    child: TextField(
                      controller: destinationController,
                    ),
                  ),
                ],
              ),
            ),
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
            Expanded(
                child: FlutterMap(
                  mapController: MapController(),
                  options: const MapOptions(keepAlive: true, initialZoom: 15, initialCenter:  latLng.LatLng(
                      43.94645712813915, -78.89748808892554)),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                  ],
                )),
          ],
        ));
  }
}
