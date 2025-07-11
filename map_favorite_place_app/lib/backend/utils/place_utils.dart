import '../model/place.dart';

List<Place> filterPlacesByCategory(List<Place> places, String selectedCategory) {
  if (selectedCategory.toLowerCase() == 'tous') return places;
  return places.where((place) => place.category.toLowerCase() == selectedCategory.toLowerCase()).toList();
}