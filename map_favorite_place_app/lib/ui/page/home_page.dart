import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: FlutterMap(
              mapController: MapController(),
              options: MapOptions(),
              children: [],
            );
          ),
      ),
    );
  }
}