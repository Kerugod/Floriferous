import 'cards/desire_cards/DesireCards.dart';
import 'cards/desire_cards/MultiConDesireCards.dart';
import 'cards/desire_cards/SimpleDesireCard.dart';
import 'cards/garden_cards/FlowerCards.dart';
import 'cards/garden_cards/GardenCards.dart';
import 'cards/garden_cards/Vase.dart';

class Player {
  static var playerPosition;
  static var rounds;

  static var vaseWon = List.empty(growable: true);
  static var simpleDesireWon = List.empty(growable: true);
  static var multiConDesireWon = List.empty(growable: true);
  static var flowerWon = List.empty(growable: true);

  void newRound() {
    rounds++;
  }

  void newGame() {
    playerPosition = PlayerPosition();
    rounds = 0;
  }

  int? getRounds() {
    return rounds;
  }

  void setChoosedCard(var column, var row, Cards card) {
    playerPosition.columnPosition = column;
    playerPosition.columnPosition = row;
    if (card.getTypeCard() == "Garden") {
      //Saber que tipo de carta es
      var gardenCard = card as GardenCards;
      if (gardenCard.typeGardenCard == "FLower") {
        //Definir que tipo de carta de jardin es
        gardenCard = gardenCard as FLowerCards;
        flowerWon.add(gardenCard);
      } else {
        gardenCard = gardenCard as Vase;
        vaseWon.add(gardenCard);
      }
    } else {
      var desireCard = card as DesireCards;
      if (desireCard.typeDesireCard == "Simple") {
        //Definir que tipo de carta de deseo es
        desireCard = desireCard as SimpleDesireCards;
        simpleDesireWon.add(desireCard);
      } else {
        desireCard = desireCard as MultiConDesireCards;
        multiConDesireWon.add(desireCard);
      }
    }
  }

  PlayerPosition getPlayerPosition() {
    return playerPosition;
  }
}

class Card {}

class PlayerPosition {
  var columnPosition = -1;
  var rowPosition = -1;
}
