import 'dart:math';
import 'package:a/Garden.dart';
import 'package:a/decks/GardenDeck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /*
  var garden = Garden();
  var firstRow = garden.getFirstRow();
  var secondRow = garden.getSecondRow();
  var desireRow = garden.getDesireRow();*/
  group(
      'Si en alguno de estos text sale distinto de -1 es porque el algoritmo repite cartas',
      () {
    test('Si sale true cuando no lo tengo sentenciado es porque está mal', () {
      var gardenDeck = GardenDeck();
      gardenDeck.reloadCards();
      var card = gardenDeck.obtainCard();
      var list = gardenDeck.obtainGardenList();
      expect(list.indexWhere((element) => element == card), -1);
    });
  });
}
