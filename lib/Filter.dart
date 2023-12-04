// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

enum TransportMode { train, bus, subway }

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  TransportMode _mode = TransportMode.train;
  bool _bestRoute = false;
  bool _lessWalking = false;
  bool _lowerCost = false;
  int _transfers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Options'),
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(title: Text('Preferred Mode of Transport')),
          RadioListTile<TransportMode>(
            title: const Text('Train'),
            value: TransportMode.train,
            groupValue: _mode,
            onChanged: (TransportMode? value) {
              setState(() {
                _mode = value!;
              });
            },
          ),
          RadioListTile<TransportMode>(
            title: const Text('Bus'),
            value: TransportMode.bus,
            groupValue: _mode,
            onChanged: (TransportMode? value) {
              setState(() {
                _mode = value!;
              });
            },
          ),
          RadioListTile<TransportMode>(
            title: const Text('Subway'),
            value: TransportMode.subway,
            groupValue: _mode,
            onChanged: (TransportMode? value) {
              setState(() {
                _mode = value!;
              });
            },
          ),
          const ListTile(title: Text('Route Preferences')),
          CheckboxListTile(
            title: const Text('Best Route'),
            value: _bestRoute,
            onChanged: (bool? value) {
              setState(() {
                _bestRoute = value!;
              });
            },
          ),
          ListTile(
            title: const Text('Maximum Transfers'),
            trailing: DropdownButton<int>(
              value: _transfers,
              items:
                  <int>[0, 1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _transfers = newValue!;
                });
              },
            ),
          ),
          CheckboxListTile(
            title: const Text('Less Walking'),
            value: _lessWalking,
            onChanged: (bool? value) {
              setState(() {
                _lessWalking = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Lower Cost'),
            value: _lowerCost,
            onChanged: (bool? value) {
              setState(() {
                _lowerCost = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
