import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dice/main.dart';

void main() {
  testWidgets('two dice are rendered and tapping one keeps the app stable',
      (WidgetTester tester) async {
    await tester.pumpWidget(const DiceApp());

    // The dice page renders two dice images and the app bar title.
    expect(find.text('Dice'), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));

    // Tapping the left dice re-rolls it without breaking the layout.
    await tester.tap(find.byType(TextButton).first);
    await tester.pump();

    expect(find.byType(Image), findsNWidgets(2));
  });
}
