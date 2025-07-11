import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_favorite_place/ui/page/home_page.dart';


void main() {
  testWidgets('Filtrer les lieux avec SegmentedButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(FlutterMap), findsOneWidget);

    await tester.tap(find.text('Restauration'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.location_on), findsNWidgets(1));
  });
}
