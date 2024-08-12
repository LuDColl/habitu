import 'package:flutter_test/flutter_test.dart';
import 'package:habitu/app.dart';

void main() {
  test('Criar o App', () {
    const app = App();
    final element = app.createElement();
    expect(element.mounted, true);
  });
}
