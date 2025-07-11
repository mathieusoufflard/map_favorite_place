import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_favorite_place/ui/widgets/custom_image_network.dart';
import 'package:map_favorite_place/ui/widgets/custom_text.dart';

import '../../backend/data/place_data.dart';
import '../../backend/model/place.dart';

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
                        showPlaceInformationBottomSheet(context, place);
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

  void showPlaceInformationBottomSheet(BuildContext context, Place place) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageNetwork(
                  place.urlImage,
                ),
                SizedBox(height: 20),
                CustomText.customText(
                  text: place.name,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                CustomText.customText(
                  text: place.category,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                  fontSize: 15,
                ),
                CustomText.customText(
                  text: place.description,
                  color: Colors.black,
                  fontSize: 17,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}