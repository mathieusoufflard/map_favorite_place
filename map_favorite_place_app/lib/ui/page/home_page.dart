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
  String selectedCategory = 'Tous';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              _map(),
              _markerFilter(),
            ],
          )
      ),
    );
  }

  Widget _map() => FlutterMap(
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
        markers: getFilteredMarkers(),
      ),
    ],
  );

  Widget _markerFilter() => Positioned(
    top: 10,
    left: 10,
    right: 10,
    child: Center(
      child: SegmentedButton<String>(
        segments: [
          ButtonSegment(value: 'Tous', label: CustomText.customText(text: 'Tous', color: Colors.black, fontSize: 13)),
          ButtonSegment(value: 'Culturel', label: CustomText.customText(text: 'Culturel', color: Colors.black, fontSize: 13)),
          ButtonSegment(value: 'Restauration', label: CustomText.customText(text: 'Restauration', color: Colors.black, fontSize: 13)),
          ButtonSegment(value: 'shopping', label: CustomText.customText(text: 'shopping', color: Colors.black, fontSize: 13)),
        ],
        selected: {selectedCategory},
        onSelectionChanged: (Set<String> value) {
          setState(() {
            selectedCategory = value.first;
          });
        },
        multiSelectionEnabled: false,
        showSelectedIcon: false,
      ),
    ),
  );

  List<Marker> getFilteredMarkers() {
    final filteredPlaces = selectedCategory == 'Tous'
        ? places
        : places.where((place) => place.category == selectedCategory).toList();

    return filteredPlaces.map((place) {
      return Marker(
        width: 40,
        height: 40,
        point: LatLng(place.lat, place.lng),
        child: GestureDetector(
          onTap: () => showPlaceInformationBottomSheet(context, place),
          child: const Icon(
            Icons.location_on,
            size: 40,
            color: Colors.red,
          ),
        ),
      );
    }).toList();
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