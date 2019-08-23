import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuntius/pages/ChatPage.dart';
import 'package:nuntius/widgets/ChatAppBar.dart';
import 'package:nuntius/widgets/ChatListWidget.dart';
import 'package:nuntius/widgets/InputWidget.dart';

void main() {
  const MaterialApp app = MaterialApp(
      home: Scaffold(
    body: const ChatPage(),
  ));

  testWidgets('ChatPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(ChatAppBar), findsOneWidget);
    expect(find.byType(ChatListWidget), findsOneWidget);
  });
}
