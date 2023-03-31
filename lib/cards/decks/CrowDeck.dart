import 'dart:math';

import 'package:floriferous_console/cards/CrowCard.dart';
import 'package:floriferous_console/main_console.dart';

class CrowDeck {
  var cards = [
    CrowCard(0, "Twist"),
    CrowCard(1, "Twist"),
    CrowCard(2, "Twist"),
    CrowCard(0, "OneStone"),
    CrowCard(1, "OneStone"),
    CrowCard(2, "OneStone"),
    CrowCard(0, "TwoStone"),
    CrowCard(1, "TwoStone"),
    CrowCard(2, "TwoStone")
  ];

  void reloadCrowDeck() {
    cards = [
      CrowCard(0, "Twist"),
      CrowCard(1, "Twist"),
      CrowCard(2, "Twist"),
      CrowCard(0, "OneStone"),
      CrowCard(1, "OneStone"),
      CrowCard(2, "OneStone"),
      CrowCard(0, "TwoStone"),
      CrowCard(1, "TwoStone"),
      CrowCard(2, "TwoStone")
    ];
  }

  CrowCard obtainCard() {
    if (cards.length != 0) {
      var cardSelected;
      if (cards.length != null) {
        cardSelected = Random().nextInt(cards.length);
      }

      var dataCard = cards[cardSelected];
      cards.removeWhere((element) => element == dataCard);

      return dataCard;
    } else {
      reloadCrowDeck();
      return obtainCard();
    }
  }
}
