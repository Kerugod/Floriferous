import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Esta mal el rango', () {
    bool salio = false;
    for (int i = 0; i < 100; i++) {
      if (Random().nextBool() == false) {
        salio = true;
      }
    }
    expect(salio, true);
  });
}
