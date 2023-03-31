import 'package:floriferous_console/Player.dart';
import 'package:floriferous_console/cards/desire_cards/SimpleDesireCard.dart';
import 'package:test/test.dart';

void main() {
  test('Esta mal el rango', () {
    var player = Player();
    player.newGame();
    player.setChoosedCard(0, 0, SimpleDesireCards(3, "bug", "Bettle"));
    expect(player.simpleDesireWon[0].empty, false);
  });
}
