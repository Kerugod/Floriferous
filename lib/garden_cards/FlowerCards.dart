//import 'dart:math';

import 'GardenCards.dart';

class FLowerCards extends GardenCards {
  String color;
  String typeFlower;
  String bug;
  FLowerCards(this.color, this.typeFlower, this.bug);

  /*
  void defineTypeColor() {
    typeFlower = Random().nextInt(5);
  }

  void defineColor() {
    color = Random().nextInt(5);
  }

  void defineBug() {
    //Definir si la carta tendrá un bug o no...
    if (Random().nextBool() == false) {
      //Dependiendo del tipo de flor el orden de los bugs es distinto...
      switch (typeFlower) {
        case 0:
          //Dependiendo del color tiene asignado un bug...
          switch (color) {
            case 0:
              bug = "Bee";
              break;
            case 1:
              bug = "Ladybug";
              break;
            case 2:
              bug = "Moth";
              break;
            case 3:
              bug = "Butterfly";
              break;
            case 4:
              bug = "Bettle";
              break;
          }
          break;
        case 1:
          switch (color) {
            case 0:
              bug = "Butterfly";
              break;
            case 1:
              bug = "Moth";
              break;
            case 2:
              bug = "Bee";
              break;
            case 3:
              bug = "Bettle";
              break;
            case 4:
              bug = "Ladybug";
              break;
          }
          break;
        case 2:
          switch (color) {
            case 0:
              bug = "Bettle";
              break;
            case 1:
              bug = "Bee";
              break;
            case 2:
              bug = "Butterfly";
              break;
            case 3:
              bug = "Ladybug";
              break;
            case 4:
              bug = "Moth";
              break;
          }
          break;
        case 3:
          switch (color) {
            case 0:
              bug = "Ladybug";
              break;
            case 1:
              bug = "Butterfly";
              break;
            case 2:
              bug = "Bettle";
              break;
            case 3:
              bug = "Moth";
              break;
            case 4:
              bug = "Bee";
              break;
          }
          break;
        case 4:
          switch (color) {
            case 0:
              bug = "Moth";
              break;
            case 1:
              bug = "Bettle";
              break;
            case 2:
              bug = "Ladybug";
              break;
            case 3:
              bug = "Bee";
              break;
            case 4:
              bug = "Butterfly";
              break;
          }
          break;
      }
    }
  }
  */
}
