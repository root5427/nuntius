import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuntius/pages/ChatPage.dart';
import 'package:nuntius/pages/ChatPageList.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(
      body: const ChatPageList(),
    ),
  );
  testWidgets('ChatPageList UI Test', (WidgetTester teser) async {
    await teser.pumpWidget(app);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(ChatPage), findsOneWidget);
  });
}
