import 'dart:convert';
import 'dart:io';

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

var firstRow = garden.getFirstRow();
var secondRow = garden.getSecondRow();
var desireRow = garden.getDesireRow();
var bountyRow = garden.getBountyRow();

void main() {
  firstRow[1].twist = true;
  firstRow[3].twist = true;

  secondRow[0].stones = 1;
  secondRow[2].stones = 1;
  secondRow[4].stones = 1;

  print("Bienvenido A floriferous!!!!!");
  print("¿Quieres jugar? Y/N");
  var line;
  do {
    var line = stdin.readLineSync(encoding: utf8);
    switch (line) {
      case "Y":
        printGarden();
        player.newGame();
        print("¿Cual carta escojes? (Filas: 1-3)");
        line = stdin.readLineSync(encoding: utf8);
        switch (line) {
          case "1":
            player.setChoosedCard(player.getPlayerPosition().columnPosition + 1,
                0, firstRow[player.getPlayerPosition().columnPosition + 1]);
            break;
          case "2":
            player.setChoosedCard(player.getPlayerPosition().columnPosition + 1,
                1, secondRow[player.getPlayerPosition().columnPosition + 1]);
            break;
          case "3":
            player.setChoosedCard(player.getPlayerPosition().columnPosition + 1,
                2, desireRow[player.getPlayerPosition().columnPosition + 1]);
            break;
        }
        break;
      case "N":
        print("Vuelva pronto :D");
        break;
      default:
        print("Introduzca una de las opciones: \"Y/N\"");
        break;
    }
  } while (line != "Y" && line != "N");
}

void printGarden() {
  var printRow = "  || (" + //Cartas de recompensa
      bountyRow[0].conditions[0] +
      "|" +
      bountyRow[0].conditions[1] +
      "|" +
      bountyRow[0].conditions[2] +
      ")*5|3|2 || (" +
      bountyRow[1].conditions[0] +
      "|" +
      bountyRow[1].conditions[1] +
      "|" +
      bountyRow[1].conditions[2] +
      ")*5|3|2 || (" +
      bountyRow[2].conditions[0] +
      "|" +
      bountyRow[2].conditions[1] +
      "|" +
      bountyRow[2].conditions[2] +
      ")*5|3|2 ||";

  var line = "  " + _lineEquals(printRow);

  print("  Cartas de recompensa:");
  print(line);
  print(printRow);
  print(line);

  printRow = "  || " + //Cartas de flor, primera fila
      _addAndTwistFCard(firstRow[0]) +
      " || " +
      _addAndTwistFCard(firstRow[1]) +
      " || " +
      _addAndTwistFCard(firstRow[2]) +
      " || " +
      _addAndTwistFCard(firstRow[3]) +
      " || " +
      _addAndTwistFCard(firstRow[4]) +
      " ||";

  line = "  " + _lineEquals(printRow);
  print("  Cartas de jardin:");
  print(line);
  print(printRow);
  print(line);

  printRow = "  || " + // Cartas de flor, segunda linea
      _addAndTwistFCard(secondRow[0]) +
      " || " +
      _addAndTwistFCard(secondRow[1]) +
      " || " +
      _addAndTwistFCard(secondRow[2]) +
      " || " +
      _addAndTwistFCard(secondRow[3]) +
      " || " +
      _addAndTwistFCard(secondRow[4]) +
      " ||";
  line = "  " + _lineEquals(printRow);
  if (player.getRounds() == null) {
    print("█");
  }
  print(line);
  print(printRow);
  print(line);

  print("  Cartas de deseo:");
  printRow = "  || " + // Cartas de deseo
      _addAndTwistDCard(desireRow[0]) +
      " ||" +
      _addAndTwistDCard(desireRow[1]) +
      " ||" +
      _addAndTwistDCard(desireRow[2]) +
      " ||" +
      _addAndTwistDCard(desireRow[3]) +
      " ||" +
      _addAndTwistDCard(desireRow[4]) +
      " ||";
  line = "  " + _lineEquals(printRow);
  print(line);
  print(printRow);
  print(line);
}

//Metodos de soporte

String _lineEquals(String value) {
  var line = "";
  for (var i = 0; i < value.length - 2; i++) {
    line += "=";
  }
  return line;
}

String _addAndTwistFCard(GardenCards gardenCard) {
  var card =
      gardenCard.twist ? "Carta volteada" : _obtainFlowerData(gardenCard);
  for (var i = 0; i < gardenCard.stones; i++) {
    card += "@";
  }
  return card;
}

String _addAndTwistDCard(DesireCards desireCard) {
  var card =
      desireCard.twist ? "Carta volteada" : _obtainDesireData(desireCard);
  for (var i = 0; i < desireCard.stones; i++) {
    card += "@";
  }
  return card;
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
