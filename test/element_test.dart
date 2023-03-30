import 'dart:math';
import 'package:floriferous_console/Garden.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  var garden = Garden();
  var firstRow = garden.getFirstRow();
  var secondRow = garden.getSecondRow();
  var desireRow = garden.getDesireRow();
  group(
      'Si en alguno de estos text sale distinto de -1 es porque el algoritmo repite cartas',
      () {
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(secondRow.indexWhere((element) => element == firstRow[0]), -1);
    });

    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(secondRow.indexWhere((element) => element == firstRow[1]), -1);
    });

    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(secondRow.indexWhere((element) => element == firstRow[2]), -1);
    });

    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(secondRow.indexWhere((element) => element == firstRow[3]), -1);
    });
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      expect(secondRow.indexWhere((element) => element == firstRow[4]), -1);
    });
  });
}
