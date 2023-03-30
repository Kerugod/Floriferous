import 'package:floriferous_console/desire_cards/DesireCards.dart';

class MultiConDesireCards extends DesireCards {
  var comparision;
  MultiConDesireCards(points, flowerProperty, this.comparision) {
    super.points = points;
    super.flowerProperty = flowerProperty;
    typeDesireCard = "Multi";
  }
}
