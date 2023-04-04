import 'GardenCards.dart';

class Vase extends GardenCards {
  var points = [1, 3, 5];
  var conditionsComplete = [false, false, false];
  var conditions;
  Vase(this.conditions) {
    typeGardenCard = "Vase";
    super.typeCard = "Garden";
  }
}
