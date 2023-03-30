import 'dart:math';

import 'package:a/desire_cards/MultiConDesireCards.dart';
import 'package:a/desire_cards/SimpleDesireCard.dart';

import '../desire_cards/DesireCards.dart';

class DesireDeck {
  static var deck;

  DesireCards obtainCard() {
    var cardSelected;
    if (deck?.length != null) {
      cardSelected = Random().nextInt(deck!.length);
    }
    return deck[cardSelected];
  }

  List<DesireCards> reloadCards() {
    List<DesireCards> deckReloaded = [
      //Cartas con condiciones simples
      SimpleDesireCards(3, "Bug", "Bee"),
      SimpleDesireCards(3, "Bug", "Butterfly"),
      SimpleDesireCards(3, "Bug", "Ladybug"),
      SimpleDesireCards(3, "Bug", "Moth"),
      SimpleDesireCards(3, "Bug", "Bettle"),
      SimpleDesireCards(2, "TypeFlower", "Daisy"),
      SimpleDesireCards(2, "TypeFlower", "Lily"),
      SimpleDesireCards(2, "TypeFlower", "Mum"),
      SimpleDesireCards(2, "TypeFlower", "Poppy"),
      SimpleDesireCards(2, "TypeFlower", "Tulip"),
      SimpleDesireCards(2, "Color", "Red"),
      SimpleDesireCards(2, "Color", "Violet"),
      SimpleDesireCards(2, "Color", "Purple"),
      SimpleDesireCards(2, "Color", "White"),
      SimpleDesireCards(2, "Color", "Yellow"),
      //Cartas con condiciones complejas
      MultiConDesireCards([0, 1, 2, 4, 7], "Bug", "="),
      MultiConDesireCards([0, 1, 2, 4, 7], "Bug", "/="),
      MultiConDesireCards([0, 0, 1, 3, 5], "Color", "="),
      MultiConDesireCards([0, 0, 1, 3, 5], "Color", "/="),
      MultiConDesireCards([0, 0, 1, 3, 5], "TypeFlower", "="),
      MultiConDesireCards([0, 0, 1, 3, 5], "TypeFlower", "/=")
    ];

    return deckReloaded;
  }
}
