import 'dart:convert';
import 'dart:io';

import 'package:floriferous_console/cards/Cards.dart';
import 'package:floriferous_console/cards/decks/CrowDeck.dart';
import 'package:floriferous_console/cards/desire_cards/DesireCards.dart';
import 'package:floriferous_console/cards/desire_cards/MultiConDesireCards.dart';
import 'package:floriferous_console/cards/desire_cards/SimpleDesireCard.dart';
import 'package:floriferous_console/cards/garden_cards/FlowerCards.dart';
import 'package:floriferous_console/cards/garden_cards/GardenCards.dart';
import 'package:floriferous_console/cards/garden_cards/Vase.dart';

import 'Garden.dart';
import 'Player.dart';

var player = Player();
var garden = Garden();
var crowStones = 0;
var crowDeck = CrowDeck();

var firstRow = garden.getFirstRow();
var secondRow = garden.getSecondRow();
var desireRow = garden.getDesireRow();
var bountyRow = garden.getBountyRow();

const int largeCard = 37;

void main() {
  print("Bienvenido A floriferous!!!!!");
  print("¿Quieres jugar? Y/N");
  var play;
  do {
    play = stdin.readLineSync(encoding: utf8);
    switch (play) {
      case "Y":
        player.newGame();
        print("El cuervo tiene $crowStones piedras.");
        printGarden();
        print("¿Cuál carta escoges? (Filas: 1-3)");
        do {
          playerMove();
        } while (player.getRounds() < 3); //Numero de rondas
        break;
      case "N":
        print("Vuelva pronto :D");
        break;
      default:
        print("Introduzca una de las opciones: \"Y/N\"");
        break;
    }
  } while (play != "Y" && play != "N");
}

void getCards() {
  firstRow = garden.getFirstRow();
  secondRow = garden.getSecondRow();
  desireRow = garden.getDesireRow();
  bountyRow = garden.getBountyRow();
}

void printGarden() {
  // (32 carta mas grande)*5 = 160 + limite que son 12 (Si fueran 5 de ellas) = 172 por linea

  var spaceBounty = "                                       ";

  var printBounty =
      "  ||${normaliceLength(" (${bountyRow[0].conditions[0]}|${bountyRow[0].conditions[1]}|${bountyRow[0].conditions[2]})*5|3|2 ")}||${normaliceLength(" (${bountyRow[1].conditions[0]}|${bountyRow[1].conditions[1]}|${bountyRow[1].conditions[2]})*5|3|2 ")}||${normaliceLength(" (${bountyRow[2].conditions[0]}|${bountyRow[2].conditions[1]}|${bountyRow[2].conditions[2]})*5|3|2 ")}||";
  var line = "  ${_lineEquals(printBounty)}";
  print(spaceBounty + line);
  print(spaceBounty + printBounty);
  print(spaceBounty + line);

  var printFirst =
      "  ||${normaliceLength(_addAndTwistFCard(firstRow[0]))}||${normaliceLength(_addAndTwistFCard(firstRow[1]))}||${normaliceLength(_addAndTwistFCard(firstRow[2]))}||${normaliceLength(_addAndTwistFCard(firstRow[3]))}||${normaliceLength(_addAndTwistFCard(firstRow[4]))}||";
  line = "  ${_lineEquals(printFirst)}";
  print(line);
  print(printFirst);
  print(line);
  var printSecond =
      "  ||${normaliceLength(_addAndTwistFCard(secondRow[0]))}||${normaliceLength(_addAndTwistFCard(secondRow[1]))}||${normaliceLength(_addAndTwistFCard(secondRow[2]))}||${normaliceLength(_addAndTwistFCard(secondRow[3]))}||${normaliceLength(_addAndTwistFCard(secondRow[4]))}||";

  print(line);
  print(printSecond);
  print(line);

  var printDesire =
      "  ||${normaliceLength(_addAndTwistDCard(desireRow[0]))}||${normaliceLength(_addAndTwistDCard(desireRow[1]))}||${normaliceLength(_addAndTwistDCard(desireRow[2]))}||${normaliceLength(_addAndTwistDCard(desireRow[3]))}||${normaliceLength(_addAndTwistDCard(desireRow[4]))}||";

  print(line);
  print(printDesire);
  print(line);

  if (player.getRounds() != 1 &&
      player.getPlayerPosition().columnPosition == -1) {
    print("█");
  } else if (player.getRounds() == 1 &&
      player.getPlayerPosition().columnPosition == 5) {
    print("${line.replaceAll("=", " ")}   █");
  }

  print(line.replaceAll("=", "_"));

  print(line.replaceAll("=", "_"));

  printMyDeck(line);
}

void printMyDeck(String backLine) {
  var printRow = "";
  print("  Mis piedras: ${player.stones}");
  print("  Mis cartas de jardín:");
  var flowerWon = player.getFlowerWon();
  var vaseWon = player.getVaseWon();
  printRow = "";

  for (var i = 0; i < flowerWon.length; i++) {
    printRow += "|| " + _visibilityDeckCard(flowerWon[i]) + " ||";
  }

  var line = "  ${_lineEquals("$printRow||")}";

  if (flowerWon.isNotEmpty) {
    print(line);
    print("  $printRow");
    print(line);
  }

  printRow = "";

  for (var i = 0; i < vaseWon.length; i++) {
    printRow += "|| " + _visibilityDeckCard(vaseWon[i]) + " ||";
  }

  line = "  ${_lineEquals("$printRow||")}";

  if (vaseWon.isNotEmpty) {
    print(line);
    print("  $printRow");
    print(line);
  }

  print("  Mis cartas de deseo:");

  var simpleWon = player.getSimpleWon();
  var multiWon = player.getMultiWon();

  printRow = "";

  for (var i = 0; i < simpleWon.length; i++) {
    printRow += "|| " + _visibilityDeckCard(simpleWon[i]) + " ||";
  }

  line = "  ${_lineEquals("$printRow||")}";

  if (simpleWon.isNotEmpty) {
    print(line);
    print("  $printRow");
    print(line);
  }

  printRow = "";

  for (var i = 0; i < multiWon.length; i++) {
    printRow += "|| " + _visibilityDeckCard(multiWon[i]) + " ||";
  }

  line = "  ${_lineEquals("$printRow||")}";
  if (multiWon.isNotEmpty) {
    print(line);
    print("  $printRow");
    print(line);
  }
  print(backLine.replaceAll("=", "*"));
}

//Metodos de soporte

String normaliceLength(String value) {
  // Este método pertenece a la clase main_console.dart
  if (value.length < largeCard) {
    var diference = largeCard - value.length;
    if (diference % 2 == 0) {
      var back = "";
      var mid = diference ~/= 2;
      for (int i = 0; i < mid; i++) {
        back += " ";
        value += " ";
      }
      value = back + value;
    } else {
      var back = "";
      var mid = diference ~/= 2;
      for (int i = 0; i < mid; i++) {
        back += " ";
        value += " ";
      }
      value = " $back$value";
    }
  }

  return value;
}

String _lineEquals(String value) {
  var line = "";
  for (var i = 0; i < value.length - 2; i++) {
    line += "=";
  }
  return line;
}

String _addAndTwistFCard(GardenCards gardenCard) {
  var card = "";
  if (gardenCard.playerHere) {
    card = "█";
  } else if (!gardenCard.empty) {
    card = gardenCard.twist ? "Carta volteada" : _obtainFlowerData(gardenCard);
    for (var i = 0; i < gardenCard.stones; i++) {
      card += "@";
    }
  } else {
    card = "         ";
    for (var i = 0; i < gardenCard.stones; i++) {
      card += "@";
    }
  }
  return card;
}

String _addAndTwistDCard(DesireCards desireCard) {
  var card = "";
  if (desireCard.playerHere) {
    card = "█";
  } else if (!desireCard.empty) {
    card = desireCard.twist ? "Carta volteada" : _obtainDesireData(desireCard);
    for (var i = 0; i < desireCard.stones; i++) {
      card += "@";
    }
  } else {
    card = "         ";
    for (var i = 0; i < desireCard.stones; i++) {
      card += "@";
    }
  }
  return card;
}

String _visibilityDeckCard(Cards desireCard) {
  var card = "";
  if (desireCard.typeCard.compareTo("Garden") == 0) {
    desireCard = desireCard as GardenCards;
    card = _obtainFlowerData(desireCard);
  } else {
    desireCard = desireCard as DesireCards;
    card = _obtainDesireData(desireCard);
  }
  return card;
}

void deletePastCard() {
  var past = player.getPlayerPosition().columnPosition;
  if (past != 5 && past != -1) {
    switch (player.getPlayerPosition().rowPosition) {
      case 0:
        firstRow[past].playerHere = false;
        firstRow[past].stones = 0;
        firstRow[past].empty = true;
        break;
      case 1:
        secondRow[past].playerHere = false;
        secondRow[past].stones = 0;
        secondRow[past].empty = true;
        break;
      case 2:
        desireRow[past].playerHere = false;
        desireRow[past].stones = 0;
        desireRow[past].empty = true;
        break;
    }
  }
}

String _obtainFlowerData(GardenCards gardenCard) {
  var data = "";
  if (gardenCard.typeGardenCard == "Flower") {
    var flowerCard = gardenCard as FLowerCards;
    data = flowerCard.typeFlower + "|" + flowerCard.color;
    if (flowerCard.bug != "") {
      data += "|" + flowerCard.bug;
    }
  } else {
    var vaseCard = gardenCard as Vase;
    data = "(" +
        vaseCard.conditions[0] +
        "|" +
        vaseCard.conditions[1] +
        "|" +
        vaseCard.conditions[2] +
        ")*1|3|5";
  }
  return data;
}

String _obtainDesireData(DesireCards desireCard) {
  var data = "";
  if (desireCard.typeDesireCard == "Simple") {
    var dataDesire = desireCard as SimpleDesireCards;
    data = dataDesire.condition + "*" + dataDesire.points.toString();
  } else {
    var dataDesire = desireCard as MultiConDesireCards;
    data = "(" +
        dataDesire.points[0].toString() +
        "|" +
        dataDesire.points[1].toString() +
        "|" +
        dataDesire.points[2].toString() +
        "|" +
        dataDesire.points[3].toString() +
        "|" +
        dataDesire.points[4].toString() +
        ") if " +
        dataDesire.flowerProperty +
        dataDesire.comparision +
        dataDesire.flowerProperty;
  }
  return data;
}

void crowMove() {
  var crowCard = crowDeck.obtainCard();
  var cardChange;
  if (player.getRounds() != 1) {
    cardChange = player.getPlayerPosition().columnPosition + 1;
  } else {
    cardChange = player.getPlayerPosition().columnPosition - 1;
  }
  if (cardChange != 5 && cardChange != -1) {
    if (crowCard.action.compareTo("Twist") == 0) {
      switch (crowCard.rowCard) {
        case 0:
          firstRow[cardChange].twist = true;
          break;
        case 1:
          secondRow[cardChange].twist = true;
          secondRow[cardChange].stones = 0;
          break;
        case 2:
          desireRow[cardChange].twist = true;
          break;
      }
    } else if (crowCard.action.compareTo("OneStone") == 0) {
      switch (crowCard.rowCard) {
        case 0:
          firstRow[cardChange].empty = true;
          firstRow[cardChange].noVisualEmpty = true;
          firstRow[cardChange].stones = 1;
          break;
        case 1:
          secondRow[cardChange].empty = true;
          secondRow[cardChange].noVisualEmpty = true;
          secondRow[cardChange].stones = 1;
          break;
        case 2:
          desireRow[cardChange].empty = true;
          desireRow[cardChange].noVisualEmpty = true;
          desireRow[cardChange].stones = 1;
          break;
      }
    } else {
      switch (crowCard.rowCard) {
        case 0:
          firstRow[cardChange].empty = true;
          firstRow[cardChange].noVisualEmpty = true;
          firstRow[cardChange].stones = 2;
          break;
        case 1:
          secondRow[cardChange].empty = true;
          secondRow[cardChange].noVisualEmpty = true;
          secondRow[cardChange].stones = 2;
          break;
        case 2:
          desireRow[cardChange].empty = true;
          desireRow[cardChange].noVisualEmpty = true;
          desireRow[cardChange].stones = 2;
          break;
      }
    }
    var row = "";
    var action = "";
    switch (crowCard.rowCard) {
      case 0:
        row = "primera";
        break;
      case 1:
        row = "segunda";
        break;
      case 2:
        row = "tercera";
        break;
    }
    switch (crowCard.action) {
      case "Twist":
        action = "voltear la";
        break;
      case "OneStone":
        action = "colocar una piedra en la";
        break;
      case "TwoStone":
        action = "colocar dos piedras en la";
        break;
    }
    print("El cuervo dice \"" + action + " " + row + " carta\"");
  }
}

void roundFinish() {
  for (var i = 0; i < 5; i++) {
    if (firstRow[i].stones > 0 && firstRow[i].noVisualEmpty == true) {
      crowStones += firstRow[i].stones;
    }
    if (secondRow[i].stones > 0 && secondRow[i].noVisualEmpty == true) {
      crowStones += secondRow[i].stones;
    }
    if (desireRow[i].stones > 0 && desireRow[i].noVisualEmpty == true) {
      crowStones += desireRow[i].stones;
    }
  }

  print("El cuervo tiene $crowStones piedras.");

  if (crowStones >= 4) {
    print("El cuervo tiene cuatro o más piedras.");

    if ((crowStones - player.stones) < 4) {
      var play;
      do {
        print(
            "Tienes las suficientes piedras para que el cuervo no te quite una carta (Recuerda que esta acción eliminará la totalidad de tus piedras. A menos de que tengas más que el cuervo). ¿Deseas usarlas? (Y/N)");
        play = stdin.readLineSync(encoding: utf8);
        switch (play) {
          case "Y":
            if (crowStones <= player.stones) {
              player.stones -= crowStones;
              crowStones = 0;
            } else {
              crowStones -= player.stones;
              player.stones = 0;
            }
            print("**** NUEVA RONDA ****");
            print("El cuervo tiene $crowStones piedras.");
            break;
          case "N":
            stealCard();
            break;
          default:
            print("Introduzca una de las opciones: \"Y/N\"");
            break;
        }
      } while (play != "Y" && play != "N");
    } else {
      stealCard();
    }
  } else if (player.stones > 0) {
    print(
        "¿Deseas quitarle piedras al cuervo? (Esta acción eliminará la totalidad de tus piedras. A menos de que tengas más que el cuervo) (Y/N)");
    var play;

    do {
      play = stdin.readLineSync(encoding: utf8);
      switch (play) {
        case "Y":
          if (crowStones <= player.stones) {
            player.stones -= crowStones;
            crowStones = 0;
          } else {
            crowStones -= player.stones;
            player.stones = 0;
          }
          print("**** NUEVA RONDA ****");
          print("El cuervo tiene $crowStones piedras.");
          break;
        case "N":
          break;
        default:
          print("Introduzca una de las opciones: \"Y/N\"");
          break;
      }
    } while (play != "Y" && play != "N");
  }
}

void stealCard() {
  printMyDeck("");
  var tipoCarta;
  var regresar;
  do {
    print(
        "Elige cual tipo de carta eliminarás. (Flor = F / Florero = Fl / Deseo simple = DS / Deseo Multicondicional = DM)");
    do {
      tipoCarta = stdin.readLineSync(encoding: utf8);
      switch (tipoCarta) {
        case "F":
          if (player.flowerWon.isEmpty) {
            print("No tienes cartas de flor");
            regresar = "R";
          } else {
            print("¿Cuál carta eliminará?");
            try {
              var eliminar = int.parse(stdin.readLineSync() as String);
              if (eliminar > 0 && eliminar <= player.flowerWon.length) {
                player.flowerWon.removeWhere(
                    (element) => element == player.flowerWon[eliminar - 1]);
                crowStones = 0;
              } else {
                print("Introduzca un número del 1 en adelante.");
                tipoCarta = "E";
              }
            } on Exception catch (_, e) {
              print(e);
              print("Introduzca un número del 1 en adelante.");
              tipoCarta = "E";
            }
          }
          break;
        case "Fl":
          if (player.vaseWon.isEmpty) {
            print("No tienes cartas de florero");
            regresar = "R";
          } else {
            print("¿Cuál carta eliminará?");
            try {
              var eliminar = stdin.readByteSync();
              if (eliminar > 0 && eliminar <= player.vaseWon.length) {
                player.vaseWon.removeWhere(
                    (element) => element == player.vaseWon[eliminar - 1]);
                crowStones = 0;
              } else {
                print("Introduzca un número del 1 en adelante.");
                tipoCarta = "E";
              }
            } on Exception catch (_, e) {
              print("Introduzca un número del 1 en adelante.");
              tipoCarta = "E";
            }
          }
          break;
        case "DS":
          if (player.simpleDesireWon.isEmpty) {
            print("No tienes cartas de deseo simple.");
            regresar = "R";
          } else {
            print("¿Cuál carta eliminará?");
            try {
              var eliminar = stdin.readByteSync();
              if (eliminar > 0 && eliminar <= player.simpleDesireWon.length) {
                player.simpleDesireWon.removeWhere((element) =>
                    element == player.simpleDesireWon[eliminar - 1]);
                crowStones = 0;
              } else {
                print("Introduzca un número del 1 en adelante.");
                tipoCarta = "E";
              }
            } on Exception catch (_, e) {
              print("Introduzca un número del 1 en adelante.");
              tipoCarta = "E";
            }
          }
          break;
        case "DM":
          if (player.multiConDesireWon.isEmpty) {
            print("No tienes cartas de deseo multicondicional.");
            regresar = "R";
          } else {
            print("¿Cuál carta eliminará?");
            try {
              var eliminar = stdin.readByteSync();
              if (eliminar > 0 && eliminar <= player.multiConDesireWon.length) {
                player.multiConDesireWon.removeWhere((element) =>
                    element == player.multiConDesireWon[eliminar - 1]);
                crowStones = 0;
              } else {
                print("Introduzca un número del 1 en adelante.");
                tipoCarta = "E";
              }
            } on Exception catch (_, e) {
              print("Introduzca un número del 1 en adelante.");
              tipoCarta = "E";
            }
          }
          break;
        default:
          print("Introduzca una de las opciones: \"F/Fl/DS/DM\"");
          break;
      }
    } while (tipoCarta != "F" &&
        tipoCarta != "Fl" &&
        tipoCarta != "DS" &&
        tipoCarta != "DM");
  } while (regresar == "R");
}

void playerMove() {
  String? move = "";
  if (player.getRounds() == 0 || player.getRounds() == 2) {
    do {
      move = stdin.readLineSync(encoding: utf8);
      switch (move) {
        case "1":
          var playerMove = player.getPlayerPosition().columnPosition + 1;
          firstRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 0, firstRow[playerMove]);
          if (firstRow[playerMove].noVisualEmpty) {
            firstRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        case "2":
          var playerMove = player.getPlayerPosition().columnPosition + 1;
          secondRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 1, secondRow[playerMove]);
          if (secondRow[playerMove].noVisualEmpty) {
            secondRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        case "3":
          var playerMove = player.getPlayerPosition().columnPosition + 1;
          desireRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 2, desireRow[playerMove]);
          if (desireRow[playerMove].noVisualEmpty) {
            desireRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        default:
          print("Introduzca una de las opciones: \"1-3\"");
          break;
      }
    } while (player.getPlayerPosition().columnPosition < 4);
    garden.newGarden();
    player.lastMove();
    player.newRound();
    roundFinish(); //Debe de estar arriba de "getCards" porque si no no podra hacer bien la revision de piedras del cuervo
    getCards();
    printGarden();
  } else {
    do {
      move = stdin.readLineSync(encoding: utf8);
      switch (move) {
        case "1":
          var playerMove = player.getPlayerPosition().columnPosition - 1;
          firstRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 0, firstRow[playerMove]);
          if (firstRow[playerMove].noVisualEmpty) {
            firstRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        case "2":
          var playerMove = player.getPlayerPosition().columnPosition - 1;
          secondRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 1, secondRow[playerMove]);
          if (secondRow[playerMove].noVisualEmpty) {
            secondRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        case "3":
          var playerMove = player.getPlayerPosition().columnPosition - 1;
          desireRow[playerMove].playerHere = true;
          deletePastCard();
          player.setChoosedCard(playerMove, 2, desireRow[playerMove]);
          if (desireRow[playerMove].noVisualEmpty) {
            desireRow[playerMove].stones = 0;
          }
          print("El cuervo tiene $crowStones piedras.");
          crowMove();
          printGarden();
          break;
        default:
          print("Introduzca una de las opciones: \"1-3\"");
          break;
      }
    } while (player.getPlayerPosition().columnPosition > 0);
    garden.newGarden();
    player.lastMove();
    player.newRound();
    roundFinish(); //Debe de estar arriba de "getCards" porque si no no podra hacer bien la revision de piedras del cuervo
    getCards();
    printGarden();
  }
}
