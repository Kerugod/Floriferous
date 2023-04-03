import 'cards/BountyCards.dart';
import 'cards/decks/BountyDeck.dart';
import 'cards/decks/DesireDeck.dart';
import 'cards/desire_cards/DesireCards.dart';
import 'cards/garden_cards/FlowerCards.dart';
import 'cards/garden_cards/GardenCards.dart';
import 'cards/garden_cards/ScultureCards.dart';
import 'cards/garden_cards/Vase.dart';
import 'cards/decks/GardenDeck.dart';

class Garden {
  List<GardenCards> _firstRow = List.empty(growable: true);
  List<GardenCards> _secondRow = List.empty(growable: true);
  List<DesireCards> _desireRow = List.empty(growable: true);
  List<BountyCards> _bountyRow = List.empty(growable: true);

  var gardenDeck = GardenDeck();
  var desireDeck = DesireDeck();
  var bountyDeck = BountyDeck();

  Garden() {
    _randomGardenCards();
    _firstRow[1].twist = true;
    _firstRow[3].twist = true;

    _secondRow[0].stones = 1;
    _secondRow[2].stones = 1;
    _secondRow[4].stones = 1;
  }

  List<GardenCards> getFirstRow() {
    return _firstRow;
  }

  List<GardenCards> getSecondRow() {
    return _secondRow;
  }

  List<DesireCards> getDesireRow() {
    return _desireRow;
  }

  List<BountyCards> getBountyRow() {
    return _bountyRow;
  }

  void newGarden() {
    _firstRow = List.empty(growable: true);
    _secondRow = List.empty(growable: true);
    _desireRow = List.empty(growable: true);
    for (int i = 0; i < 5; i++) {
      _firstRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _secondRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _desireRow.add(desireDeck.obtainCard());
    }

    _firstRow[1].twist = true;
    _firstRow[3].twist = true;

    _secondRow[0].stones = 1;
    _secondRow[2].stones = 1;
    _secondRow[4].stones = 1;
  }

  void _randomGardenCards() {
    gardenDeck.reloadCards();
    desireDeck.reloadCards();
    bountyDeck.reloadCards();
    for (int i = 0; i < 5; i++) {
      _firstRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _secondRow.add(gardenDeck.obtainCard());
    }
    for (int i = 0; i < 5; i++) {
      _desireRow.add(desireDeck.obtainCard());
    }
    for (int i = 0; i < 3; i++) {
      _bountyRow.add(bountyDeck.obtainCard());
    }
  }
}
