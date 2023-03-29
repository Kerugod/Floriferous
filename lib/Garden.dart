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

  void _randomCards() {
    for (int i = 0; i < 5; i++) {
      switch (Random().nextInt(2)) {
        case 0:
          firstRow.add(new FLowerCards());
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
}
