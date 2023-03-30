import 'dart:html';
import 'dart:math';
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
  List<GardenCards> firstRow = List.empty();
  List<GardenCards> secondRow = List.empty();
  List<DesireCards> desireRow = List.empty();

//color,

  List<List<List<GardenCards>>> flowers = List.empty();

  void _randomGardenCards() {
    var gardenDeck = GardenDeck();
    var desireDeck = DesireDeck();
    gardenDeck.reloadCards();
    desireDeck.reloadCards();
    for (int i = 0; i < 5; i++) {
      firstRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      secondRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      desireRow.add(desireDeck.obtainCard());
    }
  }
}
