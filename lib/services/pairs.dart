import 'dart:math';

class Pairs {
  List<String> generatedPairs = [];
  List<String> writtenPairs = [];

  List<String> generatePairs(
    int count,
    List<String> omitted,
    List<String> omittedPair,
    
  ) {
    const baseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //se convierte en mayusculas para asegurarse
    final omittedUpper = omitted.map((s) => s.toUpperCase()).toList();
    final omittedPairUpper = omittedPair.map((s) => s.toUpperCase()).toList();

    final allowed =
        baseLetters.split('').where((l) => !omittedUpper.contains(l)).toList();

    final pairs = <String>{}; //es como el set de js
    final invertedPairs =
        omittedPairUpper.map((p) => p.split('').reversed.join()).toList();

    List<String> ultimoPar = [];
    final random = Random();

    while (pairs.length < count) {
      final a = allowed[random.nextInt(allowed.length)];
      final b = allowed[random.nextInt(allowed.length)];

      final ab = a + b;
      final ba = b + a;

      if (a != b &&
          !pairs.contains(ba) &&
          !omittedPairUpper.contains(ab) &&
          !omittedPairUpper.contains(ba) &&
          !ultimoPar.contains(a) &&
          !ultimoPar.contains(b) &&
          !invertedPairs.contains(ab) &&
          !invertedPairs.contains(ba)) {
        ultimoPar = [a, b];
        pairs.add(ab);
      }
    }
    return pairs.toList();
  }

  int verifyPoints() {
    int sussess = 0;
    int error = 0;
    for (int i = 0; i < writtenPairs.length; i++) {
      if (generatedPairs[i] == writtenPairs[i]) {
        sussess++;
      }
    }
    error = writtenPairs.length - sussess;

    return sussess - error;
  }
}
