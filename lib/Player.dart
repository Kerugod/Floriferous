import 'package:floriferous_console/cards/BountyCards.dart';
import 'package:floriferous_console/main_console.dart';

import 'cards/Cards.dart';
import 'cards/desire_cards/DesireCards.dart';
import 'cards/desire_cards/MultiConDesireCards.dart';
import 'cards/desire_cards/SimpleDesireCard.dart';
import 'cards/garden_cards/FlowerCards.dart';
import 'cards/garden_cards/GardenCards.dart';
import 'cards/garden_cards/Vase.dart';
import 'package:collection/collection.dart';

class Player {
  PlayerPosition? playerPosition;
  var rounds;

  var vaseWon = List.empty(growable: true);
  var simpleDesireWon = List.empty(growable: true);
  var multiConDesireWon = List.empty(growable: true);
  var flowerWon = List.empty(growable: true);
  var points = 0;

  var stones = 0;

  List<dynamic> getVaseWon() {
    return vaseWon;
  }

  List<dynamic> getSimpleWon() {
    return simpleDesireWon;
  }

  List<dynamic> getMultiWon() {
    return multiConDesireWon;
  }

  List<dynamic> getFlowerWon() {
    return flowerWon;
  }

  void newRound() {
    rounds++;
  }

  void lastMove() {
    if (rounds == 1) {
      playerPosition!.columnPosition--;
    } else {
      playerPosition!.columnPosition++;
    }
  }

  void newGame() {
    playerPosition = PlayerPosition();
    rounds = 0;
  }

  int getRounds() {
    return rounds;
  }

  void setChoosedCard(var column, var row, Cards card) {
    playerPosition!.columnPosition = column;
    playerPosition!.rowPosition = row;
    if (!card.noVisualEmpty) {
      if (card.stones > 0) {
        stones += card.stones;
      }
      if (card.typeCard == "Garden") {
        //Saber que tipo de carta es
        var gardenCard = card as GardenCards;
        if (gardenCard.typeGardenCard.compareTo("Flower") == 0) {
          //Definir que tipo de carta de jardin es
          var newGardenCard = gardenCard as FLowerCards;
          flowerWon.add(newGardenCard);
        } else {
          var newGardenCard = gardenCard as Vase;
          vaseWon.add(newGardenCard);
        }
      } else {
        var desireCard = card as DesireCards;
        if (desireCard.typeDesireCard.compareTo("Simple") == 0) {
          //Definir que tipo de carta de deseo es
          var newDesireCard = desireCard as SimpleDesireCards;
          newDesireCard.empty = false;
          simpleDesireWon.add(newDesireCard);
        } else {
          var newDesireCard = desireCard as MultiConDesireCards;
          newDesireCard.empty = false;
          multiConDesireWon.add(newDesireCard);
        }
      }
    }
  }

  void calculateResult() {
    //Calcular los puntos de recompensa
    for (BountyCards bountyCard in bountyRow) {
      switch (bountyCard.completeRound) {
        case 0:
          points += 5;
          break;
        case 1:
          points += 3;
          break;
        case 2:
          points += 2;
          break;
      }
    }
    //Calcular puntos floreros
    Function eq = const ListEquality().equals;
    for (Vase vase in vaseWon) {
      for (FLowerCards fLowerCard in flowerWon) {
        if (!eq(vase.conditionsComplete, [true, true, true])) {
          if (vase.conditions[0].compareTo(fLowerCard.typeFlower) == 0) {
            vase.conditionsComplete[0] = true;
          }
          if (vase.conditions[1].compareTo(fLowerCard.color) == 0) {
            vase.conditionsComplete[1] = true;
          }
          if (vase.conditions[2].compareTo(fLowerCard.bug) == 0) {
            vase.conditionsComplete[2] = true;
          }
        }
      }
      var count = -1;
      for (bool getPoints in vase.conditionsComplete) {
        if (getPoints) {
          count++;
        }
      }
      if (count > -1) {
        points += vase.points[count];
      }
    }
    //Calcular puntos piedras
    points += stones ~/ 2;
    //Calcular cartas de deseo
    // Simples
    for (SimpleDesireCards simpleDesireCard in simpleDesireWon) {
      //Seleccionar carta de flor del jugador
      for (FLowerCards fLowerCard in flowerWon) {
        //Saber que propiedad se esta comparando
        if (simpleDesireCard.flowerProperty.compareTo("Bug") == 0) {
          //Saber si se cumple con la condicion
          if (fLowerCard.bug.compareTo(simpleDesireCard.condition) == 0) {
            points += simpleDesireCard.points as int;
          }
        } else if (simpleDesireCard.flowerProperty.compareTo("TypeFlower") ==
            0) {
          if (fLowerCard.typeFlower.compareTo(simpleDesireCard.condition) ==
              0) {
            points += simpleDesireCard.points as int;
          }
        } else {
          if (fLowerCard.color.compareTo(simpleDesireCard.condition) == 0) {
            points += simpleDesireCard.points as int;
          }
        }
      }
    }
    //Multicondicionales
    for (MultiConDesireCards multiConDesireCard in multiConDesireWon) {
      //Saber como se van a comparar las cartas del jugador
      if (multiConDesireCard.comparision.compareTo("=") == 0) {
        //Esto acumulara las cartas distintas del jugador, para despues contarlas
        List<Ocurrency> ocurrency = List.empty(growable: true);
        int mayorOcurrency = 0;
        //Seleccinoar cartas del jugador
        for (FLowerCards fLowerCard in flowerWon) {
          //Saber que propiedad se comparara
          if (multiConDesireCard.flowerProperty.compareTo("Bug") == 0) {
            //Mientras que la propiedad no este vacia
            if (!fLowerCard.bug.isEmpty) {
              //Hacer un recorrido de las cartas distintas ya encontradas
              int index = 0;
              var fake = List<Ocurrency>.from(ocurrency);
              for (Ocurrency diferentFlowers in fake) {
                //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
                if (fLowerCard.bug
                            .compareTo(diferentFlowers.differentTyperFlower) !=
                        0 &&
                    index == ocurrency.length - 1) {
                  ocurrency.add(Ocurrency(1, fLowerCard.bug));
                } else if (fLowerCard.bug
                        .compareTo(diferentFlowers.differentTyperFlower) ==
                    0) {
                  ocurrency[index].ocurrency++;
                  if (mayorOcurrency < ocurrency[index].ocurrency) {
                    mayorOcurrency = ocurrency[index].ocurrency;
                  }
                }
                index++;
              }
              if (ocurrency.isEmpty) {
                ocurrency.add(Ocurrency(1, fLowerCard.bug));
              }
            }
          } else if (multiConDesireCard.flowerProperty
                  .compareTo("TypeFlower") ==
              0) {
            //Hacer un recorrido de las cartas distintas ya encontradas
            int index = 0;
            var fake = List<Ocurrency>.from(ocurrency);
            for (Ocurrency diferentFlowers in fake) {
              //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
              if (fLowerCard.typeFlower
                          .compareTo(diferentFlowers.differentTyperFlower) !=
                      0 &&
                  index == ocurrency.length - 1) {
                ocurrency.add(Ocurrency(1, fLowerCard.typeFlower));
              } else if (fLowerCard.typeFlower
                      .compareTo(diferentFlowers.differentTyperFlower) ==
                  0) {
                ocurrency[index].ocurrency++;
                if (mayorOcurrency < ocurrency[index].ocurrency) {
                  mayorOcurrency = ocurrency[index].ocurrency;
                }
              }
              index++;
            }
            if (ocurrency.isEmpty) {
              ocurrency.add(Ocurrency(1, fLowerCard.typeFlower));
            }
          } else {
            //Hacer un recorrido de las cartas distintas ya encontradas
            int index = 0;
            var fake = List<Ocurrency>.from(ocurrency);
            for (Ocurrency diferentFlowers in fake) {
              //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
              if (fLowerCard.color
                          .compareTo(diferentFlowers.differentTyperFlower) !=
                      0 &&
                  index == ocurrency.length - 1) {
                ocurrency.add(Ocurrency(1, fLowerCard.color));
              } else if (fLowerCard.color
                      .compareTo(diferentFlowers.differentTyperFlower) ==
                  0) {
                ocurrency[index].ocurrency++;
                if (mayorOcurrency < ocurrency[index].ocurrency) {
                  mayorOcurrency = ocurrency[index].ocurrency;
                }
              }
              index++;
            }
            if (ocurrency.isEmpty) {
              ocurrency.add(Ocurrency(1, fLowerCard.color));
            }
          }
        }
        if (mayorOcurrency > 0) {
          points += multiConDesireCard.points[mayorOcurrency - 1] as int;
        }
      } else {
        List<Ocurrency> ocurrency = List.empty(growable: true);
        //Seleccinoar cartas del jugador
        for (FLowerCards fLowerCard in flowerWon) {
          //Saber que propiedad se comparara
          if (multiConDesireCard.flowerProperty.compareTo("Bug") == 0) {
            //Mientras que la propiedad no este vacia
            if (!fLowerCard.bug.isEmpty) {
              //Hacer un recorrido de las cartas distintas ya encontradas
              int index = 0;
              var fake = List<Ocurrency>.from(ocurrency);
              for (Ocurrency diferentFlowers in fake) {
                //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
                if (fLowerCard.bug
                        .compareTo(diferentFlowers.differentTyperFlower) ==
                    0) {
                  break;
                } else if (index == ocurrency.length - 1) {
                  ocurrency.add(Ocurrency(1, fLowerCard.bug));
                }
                index++;
              }
              if (ocurrency.isEmpty) {
                ocurrency.add(Ocurrency(1, fLowerCard.bug));
              }
            }
          } else if (multiConDesireCard.flowerProperty
                  .compareTo("TypeFlower") ==
              0) {
            //Hacer un recorrido de las cartas distintas ya encontradas
            int index = 0;
            var fake = List<Ocurrency>.from(ocurrency);
            for (Ocurrency diferentFlowers in fake) {
              //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
              if (fLowerCard.typeFlower
                      .compareTo(diferentFlowers.differentTyperFlower) ==
                  0) {
                break;
              } else if (index == ocurrency.length - 1) {
                ocurrency.add(Ocurrency(1, fLowerCard.typeFlower));
              }
              index++;
            }
            if (ocurrency.isEmpty) {
              ocurrency.add(Ocurrency(1, fLowerCard.typeFlower));
            }
          } else {
            //Hacer un recorrido de las cartas distintas ya encontradas
            int index = 0;
            var fake = List<Ocurrency>.from(ocurrency);
            for (Ocurrency diferentFlowers in fake) {
              //En caso de que la carta seleccionada tenga un bicho distinto agregarlo o si ya existe contralo. Y determinar el m
              if (fLowerCard.color
                      .compareTo(diferentFlowers.differentTyperFlower) ==
                  0) {
                break;
              } else if (index == ocurrency.length - 1) {
                ocurrency.add(Ocurrency(1, fLowerCard.color));
              }
              index++;
            }
            if (ocurrency.isEmpty) {
              ocurrency.add(Ocurrency(1, fLowerCard.color));
            }
          }
        }

        if (ocurrency.isNotEmpty) {
          points += multiConDesireCard.points[ocurrency.length - 1] as int;
        }
      }
    }
    print(
        "LOS PUNTOS QUE CONSEGUISTE SON: $points AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
  }

  PlayerPosition getPlayerPosition() {
    return playerPosition!;
  }
}

class PlayerPosition {
  var columnPosition = -1;
  var rowPosition = -1;
}

class Ocurrency {
  int ocurrency = 0;
  String differentTyperFlower = "";
  Ocurrency(this.ocurrency, this.differentTyperFlower);
}
