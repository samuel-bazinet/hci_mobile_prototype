// ignore_for_file: deprecated_member_use, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:location/location.dart';
import 'PlanRoute.dart';
import 'Settings.dart';

void main() {
  runApp(const MyApp());
}

final themeModeNotifier = ValueNotifier(ThemeMode.system);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeModeNotifier,
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Route Planner',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: value, // Use the current theme mode
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
        ],
      ),
      body: const MapPage(),
      // Using ElevatedButton for navigation
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
              'Plan Route',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}

// Map Page

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location location = Location();
  latLng.LatLng _center = const latLng.LatLng(
      43.94645712813915, -78.89748808892554); // Default location

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    var currentLocation = await location.getLocation();
    setState(() {
      _center =
          latLng.LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          mapController: MapController(),
          options: MapOptions(
            center: _center,
            zoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _center,
                child: const Icon(Icons.location_on),
              ),
            ]),
          ],
        )
      ],
    ));
  }
}
