import 'dart:html';
import 'dart:math';
import 'cards/FlowerCards.dart';
import 'cards/GardenCards.dart';
import 'cards/ScultureCards.dart';
import 'package:flutter/material.dart';

import 'cards/Vase.dart';
import 'decks/gardenDeck.dart';

class Garden extends Scaffold {
  Column cards = new Column();
  List<GardenCards> firstRow = List.empty();
  List<GardenCards> secondRow = List.empty();
  List<GardenCards> desireRow = List.empty();

//color,

  List<List<List<GardenCards>>> flowers = List.empty();

  void _randomGardenCards() {
    var deck = Deck();
    deck.reloadCards();
    for (int i = 0; i < 5; i++) {
      firstRow.add(deck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      secondRow.add(deck.obtainCard());
    }
  }
}
