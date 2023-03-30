import 'package:a/desire_cards/MultiConDesireCards.dart';
import 'package:a/desire_cards/SimpleDesireCard.dart';
import 'package:a/garden_cards/FlowerCards.dart';
import 'package:a/garden_cards/GardenCards.dart';
import 'package:a/garden_cards/Vase.dart';
import 'package:flutter/material.dart';

import 'Garden.dart';
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
  Column data(List<GardenCards> row, int position, int numRow) {
    var column;
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

  @override
  Widget build(BuildContext context) {
    var garden = Garden();
    var firstRow = garden.getFirstRow();
    var secondRow = garden.getSecondRow();
    var desireRow = garden.getDesireRow();
    var bountyRow = garden.getBountyRow();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            //Peon y garden
            child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: 150,
                height: 100,
              ),
              Card(
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
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(firstRow, 0, 1))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(firstRow, 1, 1))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(firstRow, 2, 1))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(firstRow, 3, 1))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(firstRow, 4, 1))),
                    ],
                  ),
                  Row(
                    children: [
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(secondRow, 0, 2))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(secondRow, 1, 2))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(secondRow, 2, 2))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(secondRow, 3, 2))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 200,
                              child: data(secondRow, 4, 2))),
                    ],
                  ),
                  Row(
                    children: [
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 70,
                              child: dataDesire(desireRow, 0))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 70,
                              child: dataDesire(desireRow, 1))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 70,
                              child: dataDesire(desireRow, 2))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 70,
                              child: dataDesire(desireRow, 3))),
                      Card(
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: 100,
                              height: 70,
                              child: dataDesire(desireRow, 4))),
                    ],
                  )
                ],
              ))
            ],
          )
        ])));
  }
}
