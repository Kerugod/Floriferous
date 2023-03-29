import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Esta mal el rango', () {
    bool salio = false;
    for (int i = 0; i < 100; i++) {
      if (Random().nextInt(3) == 2) {
        salio = true;
      }
    }
    expect(salio, true);
  });
}
