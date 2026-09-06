// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:untitled/main.dart';

void main() {
  testWidgets('Home screen button updates message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to the Home Screen!'), findsOneWidget);
    expect(find.text('Button clicked! Screen changed.'), findsNothing);

    await tester.tap(find.text('Click Me'));
    await tester.pump();

    expect(find.text('Welcome to the Home Screen!'), findsNothing);
    expect(find.text('Button clicked! Screen changed.'), findsOneWidget);
  });
}
