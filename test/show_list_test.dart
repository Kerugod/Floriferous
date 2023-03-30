import 'dart:math';
import 'package:a/Garden.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var garden = Garden();
  var firstRow = garden.getFirstRow();
  var secondRow = garden.getSecondRow();
  var desireRow = garden.getDesireRow();

  group('Viendo si hay valores true', () {
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(firstRow[0].twist, false);
    });
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(firstRow[1].twist, true);
    });
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(firstRow[2].twist, false);
    });
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(firstRow[3].twist, true);
    });
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(firstRow[4].twist, false);
    });
  });
}
