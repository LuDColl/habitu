import 'package:flutter_test/flutter_test.dart';
import 'package:habitu/screens/home.screen.dart';

void main() {
  test('Criar a Home', () {
    const home = HomeScreen();
    final element = home.createElement();
    expect(element.mounted, true);
  });
}
