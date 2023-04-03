class BountyCards {
  var conditions = ["", "", ""];
  var completeRound = -1;
  var completeCondition = [false, false, false];
  BountyCards(this.conditions);
  void completeBounty(int round) {
    if (completeRound == -1) {
      completeRound = round;
    }
  }
}
