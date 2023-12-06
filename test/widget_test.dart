import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nossa_lista_de_desenhos/data/cartoon_dao.dart';
import 'package:nossa_lista_de_desenhos/data/user_dao.dart';
import 'package:nossa_lista_de_desenhos/main.dart';

void main() {
  testWidgets('Basic app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(cartoonDatabase: CartoonDao.tableSql, userDatabase: UserDao.tableSql,));

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
