//import 'dart:math';

import 'GardenCards.dart';

class FLowerCards extends GardenCards {
  String color;
  String typeFlower;
  String bug;
  FLowerCards(this.color, this.typeFlower, this.bug) {
    super.typeGardenCard = "Flower";
    super.typeCard = "Garden";
  }
}
