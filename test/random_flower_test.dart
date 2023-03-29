import 'package:a/Cards/FlowerCards.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('randoFlowerResult', () {
    FLowerCards fc = new FLowerCards();
    expect(fc.color, "Red");
    expect(fc.color, "Purple");
    expect(fc.color, "White");
    expect(fc.color, "Yellow");
    expect(fc.color, "Violet");
  });
}
