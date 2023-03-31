import 'package:floriferous_console/main_console.dart';

import 'cards/Cards.dart';
import 'cards/desire_cards/DesireCards.dart';
import 'cards/desire_cards/MultiConDesireCards.dart';
import 'cards/desire_cards/SimpleDesireCard.dart';
import 'cards/garden_cards/FlowerCards.dart';
import 'cards/garden_cards/GardenCards.dart';
import 'cards/garden_cards/Vase.dart';

class Player {
  static PlayerPosition? playerPosition;
  static var rounds;

  static var vaseWon = List.empty(growable: true);
  static var simpleDesireWon = List.empty(growable: true);
  static var multiConDesireWon = List.empty(growable: true);
  static var flowerWon = List.empty(growable: true);

  List<dynamic> getVaseWon() {
    return vaseWon;
  }

  List<dynamic> getSimpleWon() {
    return simpleDesireWon;
  }

  List<dynamic> getMultiWon() {
    return multiConDesireWon;
  }

  List<dynamic> getFlowerWon() {
    return flowerWon;
  }

  void newRound() {
    rounds++;
  }

  void lastMove() {
    if (rounds == 1) {
      playerPosition!.columnPosition--;
    } else {
      playerPosition!.columnPosition++;
    }
  }

  void newGame() {
    playerPosition = PlayerPosition();
    rounds = 0;
  }

  int getRounds() {
    return rounds;
  }

  void setChoosedCard(var column, var row, Cards card) {
    playerPosition!.columnPosition = column;
    playerPosition!.rowPosition = row;
    if (card.typeCard == "Garden") {
      //Saber que tipo de carta es
      var gardenCard = card as GardenCards;
      if (gardenCard.typeGardenCard.compareTo("Flower") == 0) {
        //Definir que tipo de carta de jardin es
        gardenCard = gardenCard as FLowerCards;
        gardenCard.empty = false;
        gardenCard.playerHere = false;
        flowerWon.add(gardenCard);
      } else {
        gardenCard = gardenCard as Vase;
        gardenCard.empty = false;
        gardenCard.playerHere = false;
        vaseWon.add(gardenCard);
      }
    } else {
      var desireCard = card as DesireCards;
      if (desireCard.typeDesireCard.compareTo("Simple") == 0) {
        //Definir que tipo de carta de deseo es
        desireCard = desireCard as SimpleDesireCards;
        desireCard.empty = false;
        desireCard.playerHere = false;
        simpleDesireWon.add(desireCard);
      } else {
        desireCard = desireCard as MultiConDesireCards;
        desireCard.empty = false;
        desireCard.playerHere = false;
        multiConDesireWon.add(desireCard);
      }
    }
  }

  PlayerPosition getPlayerPosition() {
    return playerPosition!;
  }
}

class PlayerPosition {
  var columnPosition = -1;
  var rowPosition = -1;
}
