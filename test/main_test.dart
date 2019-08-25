import 'package:flutter_test/flutter_test.dart';
import 'package:nuntius/main.dart';
import 'package:nuntius/pages/RegisterPage.dart';

void main() {
  testWidgets('Main UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byType(RegisterPage), findsOneWidget);
  });
}
