import 'dart:math';

import '../garden_cards/FlowerCards.dart';
import '../garden_cards/Vase.dart';
import '../garden_cards/GardenCards.dart';

class GardenDeck {
  //Mi mazo con cartas de tipo jardin...
  var deckGarden = List.empty(growable: true);

  List obtainGardenList() {
    return deckGarden;
  }

  GardenCards obtainCard() {
    var cardSelected;
    if (deckGarden.length != null) {
      cardSelected = Random().nextInt(deckGarden.length);
    }

    var dataCard = deckGarden[cardSelected];
    deckGarden.removeWhere((element) => element == dataCard);

    return dataCard;
  }

  void reloadCards() {
    deckGarden = [
      //Agregar cartas rojas...
      FLowerCards("Red", "Daisy", ""),
      FLowerCards("Red", "Daisy", "Bee"),
      FLowerCards("Red", "Lily", ""),
      FLowerCards("Red", "Lily", "Butterfly"),
      FLowerCards("Red", "Mum", ""),
      FLowerCards("Red", "Mum", "Bettle"),
      FLowerCards("Red", "Poppy", ""),
      FLowerCards("Red", "Poppy", "Ladybug"),
      FLowerCards("Red", "Tulip", "Moth"),
      //Agregar cartas violetas...
      FLowerCards("Violet", "Daisy", ""),
      FLowerCards("Violet", "Daisy", "Ladybug"),
      FLowerCards("Violet", "Lily", ""),
      FLowerCards("Violet", "Lily", "Moth"),
      FLowerCards("Violet", "Mum", ""),
      FLowerCards("Violet", "Mum", "Bee"),
      FLowerCards("Violet", "Poppy", ""),
      FLowerCards("Violet", "Poppy", "Butterfly"),
      FLowerCards("Violet", "Tulip", ""),
      FLowerCards("Violet", "Tulip", "Bettle"),
      //Agregar cartas purpuras...
      FLowerCards("Purple", "Daisy", ""),
      FLowerCards("Purple", "Daisy", "Moth"),
      FLowerCards("Purple", "Lily", ""),
      FLowerCards("Purple", "Lily", "Bee"),
      FLowerCards("Purple", "Mum", ""),
      FLowerCards("Purple", "Mum", "Butterfly"),
      FLowerCards("Purple", "Poppy", ""),
      FLowerCards("Purple", "Poppy", "Bettle"),
      FLowerCards("Purple", "Tulip", ""),
      FLowerCards("Purple", "Tulip", "Ladybug"),
      //Agregar cartas blancas...
      FLowerCards("White", "Daisy", ""),
      FLowerCards("White", "Daisy", "Butterfly"),
      FLowerCards("White", "Lily", ""),
      FLowerCards("White", "Lily", "Bettle"),
      FLowerCards("White", "Mum", ""),
      FLowerCards("White", "Mum", "Ladybug"),
      FLowerCards("White", "Poppy", ""),
      FLowerCards("White", "Poppy", "Moth"),
      FLowerCards("White", "Tulip", ""),
      FLowerCards("White", "Tulip", "Bee"),
      //Agregar cartas amarillas...
      FLowerCards("White", "Daisy", ""),
      FLowerCards("White", "Daisy", "Bettle"),
      FLowerCards("White", "Lily", ""),
      FLowerCards("White", "Lily", "Ladybug"),
      FLowerCards("White", "Mum", ""),
      FLowerCards("White", "Mum", "Moth"),
      FLowerCards("White", "Poppy", ""),
      FLowerCards("White", "Poppy", "Bee"),
      FLowerCards("White", "Tulip", ""),
      FLowerCards("White", "Tulip", "Butterfly"),
      //Agregar cartas de florero...
      Vase(["Daisy", "White", "Bee"]),
      Vase(["Lily", "Purple", "Butterfly"]),
      Vase(["Mum", "Violet", "Bettle"]),
      Vase(["Poppy", "Red", "Moth"]),
      Vase(["Tulip", "Yellow", "Ladybug"]),
    ];
  }
}
