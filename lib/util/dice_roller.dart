import 'dart:math';

class DiceRoller {
  static final Random _random = Random();

  static int rollDiceFormula(String formula) {
    final cleaned = formula.trim().toLowerCase();
    final parts = cleaned.split('d');
    if (parts.length != 2) return int.tryParse(cleaned) ?? 0;
    final count = int.tryParse(parts[0]) ?? 1;
    final sides = int.tryParse(parts[1]);
    if (sides == null) return 0;
    var total = 0;
    for (var i = 0; i < count; i++) {
      total += _random.nextInt(sides) + 1;
    }
    return total;
  }

  static int rollD20() => _random.nextInt(20) + 1;
}
