import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/app.dart';
import 'package:rg_soccer_app/src/splash/splash.dart';

void main() {
  testWidgets('App test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(App());
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}
