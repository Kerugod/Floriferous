import '../desire_cards/DesireCards.dart';

class SimpleDesireCards extends DesireCards {
  var condition;
  SimpleDesireCards(points, flowerProperty, this.condition) {
    super.points = points;
    super.flowerProperty = flowerProperty;
    typeDesireCard = "Simple";
  }
}
