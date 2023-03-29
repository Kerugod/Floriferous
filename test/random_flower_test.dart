import 'package:a/Cards/FlowerCards.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('La generacion de cartas de flor funciona correctamente', () {
    test('Ver si la asignacion del color esta funcionando', () {
      bool red = false,
          violet = false,
          purple = false,
          white = false,
          yellow = false;
      for (int i = 0; i < 1000; i++) {
        FLowerCards fc = new FLowerCards();
        switch (fc.color) {
          case "Red":
            red = true;
            break;

          case "Violet":
            violet = true;
            break;

          case "Purple":
            purple = true;
            break;

          case "White":
            white = true;
            break;

          case "Yellow":
            yellow = true;
            break;
        }
      }

      expect(red && violet && purple && white && yellow, true);
    });

    test('Saber si el tipo de flor se está realizando correctamente', () {
      bool daisy = false,
          lily = false,
          mum = false,
          poppy = false,
          tulip = false;
      for (int i = 0; i < 1000; i++) {
        FLowerCards fc = new FLowerCards();
        switch (fc.typeFlower) {
          case "Daisy":
            daisy = true;
            break;

          case "Lily":
            lily = true;
            break;

          case "Mum":
            mum = true;
            break;

          case "Poppy":
            poppy = true;
            break;

          case "Tulip":
            tulip = true;
            break;
        }
      }

      expect(daisy && lily && mum && poppy && tulip, true);
    });

    test('Saber si salen cartas sin bugs', () {
      bool salio = false;
      for (int i = 0; i < 1000; i++) {
        FLowerCards fc = new FLowerCards();
        if (fc.bug == null) {
          salio = true;
        }
      }

      expect(salio, true);
    });
  });
}
