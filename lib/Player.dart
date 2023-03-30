class Player {
  static var playerPosition;
  static var rounds;

  void newRound() {
    rounds++;
  }

  void newGame() {
    playerPosition = PlayerPosition();
    rounds = 0;
  }

  int getRounds() {
    return rounds;
  }

  void setChoosedCard(var column, var row) {
    playerPosition.columnPosition = column;
    playerPosition.columnPosition = row;
  }

  PlayerPosition getPlayerPosition() {
    return playerPosition;
  }
}

class PlayerPosition {
  var columnPosition = -1;
  var rowPosition = -1;
}
