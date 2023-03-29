import 'dart:html';
import 'dart:math';
import 'cards/FlowerCards.dart';
import 'cards/GardenCards.dart';
import 'cards/ScultureCards.dart';
import 'package:flutter/material.dart';

import 'cards/Vase.dart';

class Garden extends Scaffold {
  Column cards = new Column();
  List<GardenCards> firstRow = List.empty();
  List<GardenCards> secondRow = List.empty();
  List<GardenCards> desireRow = List.empty();

//color,

  List<List<List<GardenCards>>> flowers = List.empty();

  void _randomCards() {
    for (int i = 0; i < 5; i++) {
      switch (Random().nextInt(3)) {
        case 0:
          firstRow.add(_obtainNewFlowerCard());
          break;
        case 1:
          firstRow.add(new ScultureCards());
          break;
        case 2:
          firstRow.add(new Vase());
          break;
      }
    }
  }

  FLowerCards _obtainNewFlowerCard() {
    FLowerCards fc = new FLowerCards();

    if (flowers.length < fc.color!) {}
    int found = flowers[fc.color!][fc.typeFlower!].indexOf(fc);

    if (found == -1) {
      flowers[fc.color!][fc.typeFlower!].add(fc);
    } else {
      _obtainNewFlowerCard();
    }

    return fc;
  }
}
