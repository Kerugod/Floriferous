import 'dart:math';

import '../BountyCards.dart';

class BountyDeck {
  var deckDesire = <BountyCards>[];

  BountyCards obtainCard() {
    var cardSelected;
    if (deckDesire.length != null) {
      cardSelected = Random().nextInt(deckDesire.length);
    }

    var dataCard = deckDesire[cardSelected];
    deckDesire.removeWhere((element) => element == dataCard);

    return dataCard;
  }

  void reloadCards() {
    deckDesire = [
      BountyCards(["Daisy", "Mum", "Bee"]),
      BountyCards(["Poppy", "Mum", "Butterfly"]),
      BountyCards(["Lily", "Lily", "Ladybug"]),
      BountyCards(["Lily", "Poppy", "Moth"]),
      BountyCards(["Lilly", "Mum", "Tulip"]),
      BountyCards(["Poppy", "Daisy", "Bettle"]),
      BountyCards(["Tulip", "Ladybug", "Butterfly"]),
      BountyCards(["Tulip", "Tulip", "Daisy"]),
      BountyCards(["Bettle", "Ladybug", "Bee"])
    ];
  }
}
