import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../backend/data/place_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(48.8566, 2.3522),
              initialZoom: 5.0,
              maxZoom: 18,
              minZoom: 4,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.mapfavoriteplace.map_favorite_place',
              ),
              MarkerLayer(
                markers: places.map((place) {
                  return Marker(
                    width: 40,
                    height: 40,
                    point: LatLng(place.lat, place.lng),
                    child: GestureDetector(
                      onTap: () {
                        // Tu peux afficher un bottom sheet, un dialog, etc.
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(place.name),
                            content: Text('Catégorie : ${place.category}'),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),

            ],
          ),
      ),
    );
  }
}