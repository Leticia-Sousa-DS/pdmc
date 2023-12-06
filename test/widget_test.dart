import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nossa_lista_de_desenhos/main.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  testWidgets('Basic app test', (WidgetTester tester) async {
    // Mock databases
    Database cartoonDatabase = await openDatabase(inMemoryDatabasePath);
    Database userDatabase = await openDatabase(inMemoryDatabasePath);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
