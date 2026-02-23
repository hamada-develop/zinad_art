import 'package:flutter_test/flutter_test.dart';
import 'package:zinad_art/app.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const ZinadArtApp());
    // Verify splash screen is shown
    expect(find.text('ZINAD ART'), findsOneWidget);
  });
}
