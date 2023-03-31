import 'dart:math';
import 'package:floriferous_console/Player.dart';
import 'package:floriferous_console/cards/garden_cards/FlowerCards.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

var player = Player();

void main() {
  player.newGame();

  group('El método está mal', () {
    test('Comparando con los equals y con el compareTo', () {
      player.setChoosedCard(0, 0, FLowerCards("Red", "Lily", "Bettle"));
    });

    test('Quiere decir que el método está mal', () {
      expect(FLowerCards("Red", "Lily", "Bettle").typeGardenCard, "Flower");
    });
  });
}
