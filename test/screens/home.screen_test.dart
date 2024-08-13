import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habitu/screens/home.screen.dart';

void main() {
  testWidgets('Iniciar e Parar Cronômetro', (tester) async {
    const home = HomeScreen();
    const app = MaterialApp(home: home);
    await tester.pumpWidget(app);

    final button = find.byType(ElevatedButton);
    await tester.tap(button);
    await tester.pumpAndSettle();
    final parar = find.text('Parar');
    expect(parar, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    final iniciar = find.text('Iniciar');
    expect(iniciar, findsOneWidget);
  });
}
