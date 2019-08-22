import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuntius/widgets/ChatAppBar.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(
      body: const ChatAppBar(),
    ),
  );

  testWidgets('ChatAppBar UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.text('Devix Rootix'), findsOneWidget);
    expect(find.text('@devixrootix'), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
