// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:evius_life_site/main.dart';

void main() {
  testWidgets('Landing page renders hero content', (tester) async {
    await tester.pumpWidget(const EviusLifeApp());

    expect(find.textContaining('Reimagining everyday tools'), findsOneWidget);
    expect(find.text('Join early list'), findsOneWidget);
  });
}
