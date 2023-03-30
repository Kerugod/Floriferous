/*import 'dart:developer';

import 'package:floriferous_console/desire_cards/MultiConDesireCards.dart';
import 'package:floriferous_console/desire_cards/SimpleDesireCard.dart';
import 'package:floriferous_console/garden_cards/FlowerCards.dart';
import 'package:floriferous_console/garden_cards/GardenCards.dart';
import 'package:floriferous_console/garden_cards/Vase.dart';

import 'Garden.dart';
import 'Player.dart';
import 'desire_cards/DesireCards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(title: 'Floriferous'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var player = Player();
  var garden = Garden();
  static var scaffold;
  _MyHomePageState() {
    player.newGame();
  }

  Column data(List<GardenCards> row, int position, int numRow) {
    var column;
    if (!(player.getPlayerPosition().columnPosition == position &&
        player.getPlayerPosition().rowPosition == numRow)) {
      if (row[position].typeCard == "Flower") {
        var rowFlower = (row[position] as FLowerCards);
        if (rowFlower.twist) {
          column = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center);
        } else if (rowFlower.stones != 0) {
          var stone = "";
          for (var i = 0; i < rowFlower.stones; i++) {
            stone += "*";
          }
          column = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text("█"),
              Text(stone),
              Text(rowFlower.typeFlower),
              Text(rowFlower.color),
              Text(rowFlower.bug)
            ],
          );
        } else {
          column = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rowFlower.typeFlower),
              Text(rowFlower.color),
              Text(rowFlower.bug)
            ],
          );
        }
      } else {
        var rowVase = (row[position] as Vase);
        if (rowVase.twist) {
          column = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center);
        } else if (rowVase.stones != 0) {
          var stone = "";
          for (var i = 0; i < rowVase.stones; i++) {
            stone += "*";
          }
          column = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(stone),
              Text(rowVase.conditions[0] +
                  "|" +
                  rowVase.conditions[1] +
                  "|" +
                  rowVase.conditions[2]),
              Text("1|3|5"),
            ],
          );
        } else {
          column = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rowVase.conditions[0] +
                  "|" +
                  rowVase.conditions[1] +
                  "|" +
                  rowVase.conditions[2]),
              Text("1|3|5"),
            ],
          );
        }
      }
    } else {
      column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("█")],
      );
    }

    return column;
  }

  Column dataDesire(List<DesireCards> row, int position) {
    var column;
    if (row[position].typeDesireCard == "Simple") {
      var rowSimpleDesire = (row[position] as SimpleDesireCards);
      column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rowSimpleDesire.points.toString() + "+"),
          Text(rowSimpleDesire.flowerProperty),
          Text(rowSimpleDesire.condition)
        ],
      );
    } else {
      var rowMultiDesire = (row[position] as MultiConDesireCards);
      column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rowMultiDesire.points[0].toString() +
              "|" +
              rowMultiDesire.points[1].toString() +
              "|" +
              rowMultiDesire.points[2].toString() +
              "|" +
              rowMultiDesire.points[3].toString() +
              "|" +
              rowMultiDesire.points[4].toString()),
          Text(rowMultiDesire.flowerProperty +
              rowMultiDesire.comparision +
              rowMultiDesire.flowerProperty),
        ],
      );
    }
    return column;
  }

  Scaffold refreshScaffold() {
    var firstRow = garden.getFirstRow();
    var secondRow = garden.getSecondRow();
    var desireRow = garden.getDesireRow();
    var bountyRow = garden.getBountyRow();

    var newScaffold = Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            //Peon y garden
            child: Column(children: [
          Row(
            children: [
              SizedBox(
                //Espacio vacio para las bounty cards
                width: 150,
                height: 100,
              ),
              Card(
                  //Bounty cards
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(bountyRow[0].conditions[0] +
                            "-" +
                            bountyRow[0].conditions[1] +
                            "-" +
                            bountyRow[0].conditions[2]),
                        Text("5|3|2")
                      ],
                    ),
                  )),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(bountyRow[1].conditions[0] +
                            "-" +
                            bountyRow[1].conditions[1] +
                            "-" +
                            bountyRow[1].conditions[2]),
                        Text("5|3|2")
                      ],
                    ),
                  )),
              Card(
                margin: EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(bountyRow[2].conditions[0] +
                            "-" +
                            bountyRow[2].conditions[1] +
                            "-" +
                            bountyRow[2].conditions[2]),
                        Text("5|3|2")
                      ],
                    )),
              )
            ],
          ),
          Row(
            //Peon y cartas de deseo y jardin
            children: [
              SizedBox(
                width: 100,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("█")],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(firstRow, 0, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                -1) {
                              player.setChoosedCard(0, 0);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(0, 0);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(firstRow, 1, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                -1) {
                              player.setChoosedCard(1, 0);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(1, 0);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(firstRow, 2, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(2, 0);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(2, 0);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(firstRow, 3, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                2) {
                              player.setChoosedCard(3, 0);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                4) {
                              player.setChoosedCard(3, 0);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(firstRow, 4, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(4, 0);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                5) {
                              player.setChoosedCard(4, 0);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(secondRow, 0, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                -1) {
                              player.setChoosedCard(0, 1);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(0, 1);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(secondRow, 1, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                0) {
                              player.setChoosedCard(1, 1);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                2) {
                              player.setChoosedCard(1, 1);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(secondRow, 2, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(2, 1);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(2, 1);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(secondRow, 3, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                2) {
                              player.setChoosedCard(3, 1);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                4) {
                              player.setChoosedCard(3, 1);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: data(secondRow, 4, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(4, 1);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                5) {
                              player.setChoosedCard(4, 1);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: dataDesire(desireRow, 0))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                -1) {
                              player.setChoosedCard(0, 2);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(0, 2);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: dataDesire(desireRow, 1))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                0) {
                              player.setChoosedCard(1, 2);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                2) {
                              player.setChoosedCard(1, 2);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: dataDesire(desireRow, 2))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                1) {
                              player.setChoosedCard(2, 2);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(2, 2);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: dataDesire(desireRow, 3))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                2) {
                              player.setChoosedCard(3, 2);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                4) {
                              player.setChoosedCard(3, 2);
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                            margin: EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 100,
                                height: 200,
                                child: dataDesire(desireRow, 4))),
                        onTap: () {
                          if (player.getRounds() == 0 ||
                              player.getRounds() == 2) {
                            if (player.getPlayerPosition().columnPosition ==
                                3) {
                              player.setChoosedCard(4, 2);
                            }
                          } else {
                            if (player.getPlayerPosition().columnPosition ==
                                5) {
                              player.setChoosedCard(4, 2);
                            }
                          }
                        },
                      ),
                    ],
                  )
                ],
              ))
            ],
          )
        ])));
    return newScaffold;
  }

  @override
  Widget build(BuildContext context) {
    //scaffold = refreshScaffold();

    log("Papure");

    return Scaffold();
  }
}
*/