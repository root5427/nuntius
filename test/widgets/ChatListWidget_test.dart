import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuntius/main.dart';

void main() {
  testWidgets('ChatListWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(ListView), findsOneWidget);
  });
}
