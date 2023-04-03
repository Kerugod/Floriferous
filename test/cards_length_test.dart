import 'dart:math';
import 'package:test/expect.dart';
import 'package:test/test.dart';

const largeCard = 32;
const stringTest = "Lily|White|Ladybug@";
//const stringTest = "Carta volteada";

void main() {
  group("El método de normalización de Strings no funciona", () {
    test('No crea Strings de tamaño 32', () {
      expect(normaliceLength(stringTest).length, 32);
    });
    test('La diferencia de las cadenas es incorrecto', () {
      expect(correctDiference(stringTest), 13);
    });

    test('Irónicamente no son iguales', () {
      expect(stringTest.compareTo("Lily|White|Ladybug@"), 0);
    });

    test('Saber cuál condición se está cumpliendo', () {
      expect(condition(stringTest), false);
    });
  });
}

int correctDiference(String value) {
  return largeCard - value.length;
}

bool condition(String value) {
  var diference;
  if (value.length < largeCard) {
    diference = largeCard - value.length;
  }

  return diference % 2 == 0;
}

String normaliceLength(String value) {
  // Este método pertenece a la clase main_console.dart
  if (value.length < largeCard) {
    var diference = largeCard - value.length;
    if (diference % 2 == 0) {
      var back = "";
      var mid = diference ~/= 2;
      for (int i = 0; i < mid; i++) {
        back += " ";
        value += " ";
      }
      value = back + value;
    } else {
      var back = "";
      var mid = diference ~/= 2;
      for (int i = 0; i < mid; i++) {
        back += " ";
        value += " ";
      }
      value = " $back$value";
    }
  }

  return value;
}
