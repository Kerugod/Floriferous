import 'dart:math';
import 'package:floriferous_console/Player.dart';
import 'package:floriferous_console/cards/desire_cards/SimpleDesireCard.dart';
import 'package:floriferous_console/cards/garden_cards/FlowerCards.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

var player = Player();

void main() {
  player.flowerWon = [
    FLowerCards("Red", "Lily", "Butterfly"),
    FLowerCards("Purple", "Lily", "Bee"),
    FLowerCards("Purple", "Poppy", "Bettle"),
    FLowerCards("White", "Lily", ""),
    FLowerCards("White", "Daisy", "Butterfly"),
    FLowerCards("Red", "Mum", ""),
    FLowerCards("Violet", "Tulip", "Bettle"),
  ];
  player.simpleDesireWon = List.empty(growable: true);
  group("Las cartas simples no funcionan", () {
    test('Los colores no se calculan correctamente', () {
      player.calculateResult();
      expect(player.points, 0);
    });

    test('Los tipos de flores no se calculan correctamente', () {
      player.points = 0;
      player.simpleDesireWon.add(SimpleDesireCards(2, "TypeFlower", "Lily"));
      player.calculateResult();
      expect(player.points, 6);
    });

    test('Los bichos no se calculan correctamente', () {
      player.points = 0;
      player.simpleDesireWon.add(SimpleDesireCards(3, "Bug", "Butterfly"));
      player.calculateResult();
      expect(player.points, 12);
    });

    test('Cuando hay más de un tipo de flor, no funciona', () {
      player.points = 0;
      player.simpleDesireWon.add(SimpleDesireCards(2, "TypeFlower", "Tulip"));
      player.calculateResult();
      expect(player.points, 14);
    });

    test('No calculó bine los datos', () {
      player.points = 0;
      player.simpleDesireWon.add(SimpleDesireCards(3, "Bug", "Bee"));
      player.calculateResult();
      expect(player.points, 17);
    });
  });
  test("No calcula bien las piedras", () {
    player.points = 0;
    player.stones = 20;
    player.calculateResult();
    expect(player.points, 27);
  });
}
