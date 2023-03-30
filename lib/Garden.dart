import 'decks/DesireDeck.dart';
import 'desire_cards/DesireCards.dart';
import 'garden_cards/FlowerCards.dart';
import 'garden_cards/GardenCards.dart';
import 'garden_cards/ScultureCards.dart';
import 'package:flutter/material.dart';

import 'garden_cards/Vase.dart';
import 'decks/GardenDeck.dart';

class Garden extends Scaffold {
  Column cards = new Column();
  List<GardenCards> _firstRow = List.empty(growable: true);
  List<GardenCards> _secondRow = List.empty(growable: true);
  List<DesireCards> _desireRow = List.empty(growable: true);

  Garden() {
    _randomGardenCards();
  }

  List<GardenCards> getFirstRow() {
    return _firstRow;
  }

  List<GardenCards> getSecondRow() {
    return _secondRow;
  }

  void _randomGardenCards() {
    var gardenDeck = GardenDeck();
    var desireDeck = DesireDeck();
    gardenDeck.reloadCards();
    desireDeck.reloadCards();
    for (int i = 0; i < 5; i++) {
      _firstRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _secondRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _desireRow.add(desireDeck.obtainCard());
    }
  }
}
