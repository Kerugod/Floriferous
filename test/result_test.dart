import 'dart:math';
import 'package:floriferous_console/Player.dart';
import 'package:floriferous_console/cards/desire_cards/MultiConDesireCards.dart';
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

  group("El método de cálculo de resultados no funciona", () {
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

      test('No calculó bien los datos', () {
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

    group("No calcula bien las cartas multicondicionales", () {
      group("No funciona la parte de \"=\"", () {
        test("La parte de \"=\" de \"Color\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 1, 1, 2, 3], "Color", "="));
          player.calculateResult();
          expect(player.points, 28);
        });

        test("La parte de \"TypeFlower\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 1, 1, 2, 3], "TypeFlower", "="));
          player.calculateResult();
          expect(player.points, 29);
        });

        test("La parte de \"Bug\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 3, 1, 2, 3], "Bug", "="));
          player.calculateResult();
          expect(player.points, 32);
        });
      });

      group("No funciona la parte de \"/=\"", () {
        test("La parte de \"/=\" de \"Color\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 1, 1, 2, 3], "Color", "/="));
          player.calculateResult();
          //expect(player.prueba[0].differentTyperFlower, "Red");
          //expect(player.prueba[1].differentTyperFlower, "Purple");
          expect(player.points, 34);
        });
        test("La parte de \"/=\" de \"TypeFlower\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 1, 1, 2, 3], "TypeFlower", "/="));
          player.calculateResult();
          expect(player.points, 37);
        });

        test("La parte de \"/=\" de \"Bug\", no funciona", () {
          player.points = 0;
          player.multiConDesireWon
              .add(MultiConDesireCards([0, 1, 1, 2, 3], "Bug", "/="));
          player.calculateResult();
          expect(player.points, 38);
        });
      });
    });
  });
}
