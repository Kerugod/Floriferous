import 'package:a/BountyCards.dart';

import 'decks/BountyDeck.dart';
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
  List<BountyCards> _bountyRow = List.empty(growable: true);

  Garden() {
    _randomGardenCards();
    _firstRow[1].twist = true;
    _firstRow[3].twist = true;

    _secondRow[0].stones = 1;
    _secondRow[2].stones = 1;
    _secondRow[4].stones = 1;
  }

  List<GardenCards> getFirstRow() {
    return _firstRow;
  }

  List<GardenCards> getSecondRow() {
    return _secondRow;
  }

  List<DesireCards> getDesireRow() {
    return _desireRow;
  }

  List<BountyCards> getBountyRow() {
    return _bountyRow;
  }

  void _randomGardenCards() {
    var gardenDeck = GardenDeck();
    var desireDeck = DesireDeck();
    var bountyDeck = BountyDeck();
    gardenDeck.reloadCards();
    desireDeck.reloadCards();
    bountyDeck.reloadCards();
    for (int i = 0; i < 5; i++) {
      _firstRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _secondRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _desireRow.add(desireDeck.obtainCard());
    }
    for (int i = 0; i < 3; i++) {
      _bountyRow.add(bountyDeck.obtainCard());
    }
  }
}
