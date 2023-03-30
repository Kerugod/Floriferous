import 'dart:math';

class BountieCards {
  var conditions = ["", "", ""];
  void generateCardCondition() {
    for (var i = 0; i < conditions.length; i++) {}
    switch (Random().nextInt(2)) {
      //0 = flower, 1 = bug
      case 0:
        switch (Random().nextInt(5)) {
          case 0:
            conditions[0] = "Daisy";
            break;
          case 1:
            conditions[0] = "Lily";
            break;
          case 2:
            conditions[0] = "Mum";
            break;
          case 3:
            conditions[0] = "Poppy";
            break;
          case 4:
            conditions[0] = "Tulip";
            break;
        }
        break;
      case 1:
        break;
    }
  }
}
