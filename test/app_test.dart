import 'package:flutter_test/flutter_test.dart';
import 'package:habitu/app.dart';

void main() {
  testWidgets('Criar o App', (tester) async {
    const app = App();
    await tester.pumpWidget(app);

    final findApp = find.byType(App);
    expect(findApp, findsOneWidget);
  });
}
