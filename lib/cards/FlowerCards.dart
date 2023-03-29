import 'dart:math';

import 'GardenCards.dart';

class FLowerCards extends GardenCards {
  String color = "";
  String typeFlower = "";
  String? bug;
  /*
   
  */

  FLowerCards() {
    typeCard = "flower";

    defineTypeColor();
    defineColor();
    defineBug();
  }
  void defineTypeColor() {
    switch (Random().nextInt(5)) {
      case 0:
        typeFlower = "Daisy";
        break;
      case 1:
        typeFlower = "Lily";
        break;
      case 2:
        typeFlower = "Mum";
        break;
      case 3:
        typeFlower = "Poppy";
        break;
      case 4:
        typeFlower = "Tulip";
        break;
    }
  }

  void defineColor() {
    switch (Random().nextInt(5)) {
      case 0:
        color = "Red";
        break;
      case 1:
        color = "Violet";
        break;
      case 2:
        color = "Purple";
        break;
      case 3:
        color = "White";
        break;
      case 4:
        color = "Yellow";
        break;
    }
  }

  void defineBug() {
    //Definir si la carta tendrá un bug o no...
    if (Random().nextBool() == false) {
      //Dependiendo del tipo de flor el orden de los bugs es distinto...
      switch (typeFlower) {
        case "Daisy":
          //Dependiendo del color tiene asignado un bug...
          switch (color) {
            case "Red":
              bug = "Bee";
              break;
            case "Violet":
              bug = "Ladybug";
              break;
            case "Purple":
              bug = "Moth";
              break;
            case "White":
              bug = "Butterfly";
              break;
            case "Yellow":
              bug = "Bettle";
              break;
          }
          break;
        case "Lily":
          switch (color) {
            case "Red":
              bug = "Butterfly";
              break;
            case "Violet":
              bug = "Moth";
              break;
            case "Purple":
              bug = "Bee";
              break;
            case "White":
              bug = "Bettle";
              break;
            case "Yellow":
              bug = "Ladybug";
              break;
          }
          break;
        case "Mum":
          switch (color) {
            case "Red":
              bug = "Bettle";
              break;
            case "Violet":
              bug = "Bee";
              break;
            case "Purple":
              bug = "Butterfly";
              break;
            case "White":
              bug = "Ladybug";
              break;
            case "Yellow":
              bug = "Moth";
              break;
          }
          break;
        case "Poppy":
          switch (color) {
            case "Red":
              bug = "Ladybug";
              break;
            case "Violet":
              bug = "Butterfly";
              break;
            case "Purple":
              bug = "Bettle";
              break;
            case "White":
              bug = "Moth";
              break;
            case "Yellow":
              bug = "Bee";
              break;
          }
          break;
        case "Tulip":
          switch (color) {
            case "Red":
              bug = "Moth";
              break;
            case "Violet":
              bug = "Bettle";
              break;
            case "Purple":
              bug = "Ladybug";
              break;
            case "White":
              bug = "Bee";
              break;
            case "Yellow":
              bug = "Butterfly";
              break;
          }
          break;
      }
    }
  }
}
