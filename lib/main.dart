import 'package:a/garden_cards/FlowerCards.dart';
import 'package:a/garden_cards/GardenCards.dart';
import 'package:a/garden_cards/Vase.dart';
import 'package:flutter/material.dart';

import 'Garden.dart';

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
  Column data(List<GardenCards> row, int position) {
    var column;
    if (row[position].typeCard == "Flower") {
      var rowFlower = (row[position] as FLowerCards);
      column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rowFlower.typeFlower),
          Text(rowFlower.color),
          Text(rowFlower.bug)
        ],
      );
    } else {
      var rowVase = (row[position] as Vase);
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

    return column;
  }

  @override
  Widget build(BuildContext context) {
    var garden = Garden();
    var firstRow = garden.getFirstRow();
    var secondRow = garden.getSecondRow();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(firstRow, 0))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(firstRow, 1))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(firstRow, 2))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(firstRow, 3))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(firstRow, 4))),
            ],
          ),
          Row(
            children: [
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(secondRow, 0))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(secondRow, 1))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(secondRow, 2))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(secondRow, 3))),
              Card(
                  margin: EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100, height: 200, child: data(secondRow, 4))),
            ],
          ),
          Row(
            children: [
              Text("hola mundo"),
              Text("hola mundo"),
              Text("hola mundo"),
              Text("hola mundo"),
              Text("hola mundo")
            ],
          )
        ],
      )),
    );
  }
}
