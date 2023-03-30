import 'package:floriferous_console/Garden.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

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
