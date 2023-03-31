import 'dart:convert';
import 'dart:io';

import 'package:floriferous_console/desire_cards/DesireCards.dart';
import 'package:floriferous_console/desire_cards/MultiConDesireCards.dart';
import 'package:floriferous_console/desire_cards/SimpleDesireCard.dart';
import 'package:floriferous_console/garden_cards/FlowerCards.dart';
import 'package:floriferous_console/garden_cards/GardenCards.dart';
import 'package:floriferous_console/garden_cards/Vase.dart';

import 'Garden.dart';
import 'Player.dart';

var player = Player();
var garden = Garden();

var firstRow = garden.getFirstRow();
var secondRow = garden.getSecondRow();
var desireRow = garden.getDesireRow();
var bountyRow = garden.getBountyRow();

void main() {
  print("Bienvenido A floriferous!!!!!");
  print("¿Quieres jugar? Y/N");
  var line = stdin.readLineSync(encoding: utf8);
  switch (line) {
    case "Y":
      printGarden();
      break;
    case "N":
      print("Vuelva pronto :D");
      break;
  }
}

void printGarden() {
  var printRow = "|| (" +
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

  var line = lineEquals(printRow);

  print("Bounty cards:");
  print(line);
  print(printRow);
  print(line);

  printRow = "|| " +
      _obtainFlowerCards(firstRow[0]) +
      " || " +
      _obtainFlowerCards(firstRow[1]) +
      " || " +
      _obtainFlowerCards(firstRow[2]) +
      " || " +
      _obtainFlowerCards(firstRow[3]) +
      " || " +
      _obtainFlowerCards(firstRow[4]) +
      "||";
  line = lineEquals(printRow);
  print("Garden cards:");
  print(line);
  print(printRow);
  print(line);

  printRow = "|| " +
      _obtainFlowerCards(secondRow[0]) +
      " || " +
      _obtainFlowerCards(secondRow[1]) +
      " || " +
      _obtainFlowerCards(secondRow[2]) +
      " || " +
      _obtainFlowerCards(secondRow[3]) +
      " || " +
      _obtainFlowerCards(secondRow[4]) +
      "||";
  line = lineEquals(printRow);
  print(line);
  print(printRow);
  print(line);

  print("Desire cards:");
  printRow = "|| " +
      _obtainDesireData(desireRow[0]) +
      " ||" +
      _obtainDesireData(desireRow[1]) +
      " ||" +
      _obtainDesireData(desireRow[2]) +
      " ||" +
      _obtainDesireData(desireRow[3]) +
      " ||" +
      _obtainDesireData(desireRow[4]) +
      " ||";
  print(line);
  print(printRow);
  print(line);
}

String lineEquals(String value) {
  var line = "";
  for (var i = 0; i < value.length; i++) {
    line += "=";
  }
  return line;
}

String _obtainFlowerCards(GardenCards gardenCard) {
  var data = "";
  if (gardenCard.typeCard == "Flower") {
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
    data = dataDesire.flowerProperty + "*" + dataDesire.condition;
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

String _espacios(String value) {
  var espacios = "";
  for (var i = 0; i < (value.length / 2) - 2.7; i++) {
    espacios += " ";
  }
  return espacios;
}

String _espaciosAtras(String value) {
  var espacios = "";
  for (var i = 0; i < (value.length / 2) - 1.5; i++) {
    espacios += " ";
  }
  return espacios;
}
