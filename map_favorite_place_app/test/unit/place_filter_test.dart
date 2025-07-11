import 'package:flutter_test/flutter_test.dart';
import 'package:map_favorite_place/backend/model/place.dart';
import 'package:map_favorite_place/backend/utils/place_utils.dart';

void main() {
  group('filterPlacesByCategory', () {
    final places = [
      Place(
          name: 'Tour Eiffel',
          category:'Culturel',
          lat: 48.8584,
          lng: 2.2945,
          description: 'Célèbre tour en fer de Gustave Eiffel (1889), terrasses panoramiques accessibles par escaliers et ascenseurs.',
          urlImage: 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npY3tIRyfRIanafyTSKJkNduNqLHINm7YN6LiXEMk9_6HYaIATnkGougRwLMWKGiiOzxocWuUUJYVOWPtbOstBgKrXxjdYT-cnXZdE2Eg9CQeetpg2uhhC9ULUYEotDyZNGAWEDjzC1Vxs=w408-h544-k-no'
      ),
      Place(
          name: 'Louvre',
          category: 'Culturel',
          lat: .8606,
          lng: .3376,
          description: 'le louvre',
          urlImage: 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nocJcQhbhNKvSj3CYgZklVERiPXNdsWyBB_FD40utSBSeB3AxEkCCIhMvTwMFI99SmwkPSQaqeCozH7-MXNNpUFCKZgyOXBbweO4iqf2xlDDn4jsBFNa1THYlSwE5O_rBmTCCl9=w408-h306-k-no',
      ),
      Place(
          name: 'Burger Place',
          category: 'Restauration',
          lat: .853,
          lng: .35,
          description: 'burger place',
          urlImage: 'https://luma-delikatessen.ch/cdn-cgi/image/w=3420,f=webp,q=80/https://storage.googleapis.com/luma-du-shop-production/original_images/LUMA-rezept-wagyu-burger-001.jpg'
      ),
    ];

    test('retourne tous les lieux si "Tous" est sélectionné', () {
      final result = filterPlacesByCategory(places, 'Tous');
      expect(result.length, 3);
    });

    test('filtre correctement les lieux par catégorie (Culturel)', () {
      final result = filterPlacesByCategory(places, 'Culturel');
      expect(result.length, 2);
      expect(result.every((p) => p.category == 'Culturel'), true);
    });

    test('retourne une liste vide si aucune correspondance', () {
      final result = filterPlacesByCategory(places, 'Shopping');
      expect(result.isEmpty, true);
    });
  });
}
