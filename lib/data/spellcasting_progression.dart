import '../models/enums.dart';

class SpellcastingProgression {
  static const List<int> _bardKnown = [4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 15, 16, 18, 19, 19, 20, 22, 22, 22];
  static const List<int> _rangerKnown = [0, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11];
  static const List<int> _sorcererKnown = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 13, 13, 14, 14, 15, 15, 15, 15];
  static const List<int> _warlockKnown = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15];

  static const Set<DndClass> _cantripCasters = {
    DndClass.bard, DndClass.cleric, DndClass.druid, DndClass.sorcerer, DndClass.warlock, DndClass.wizard
  };

  static int _breakpoints(int level, int at1, int at4, int at10) {
    if (level >= 10) return at10;
    if (level >= 4) return at4;
    return at1;
  }

  static int cantripsKnown(DndClass dndClass, int level, {int raceBonus = 0}) {
    if (!_cantripCasters.contains(dndClass)) return 0;
    int base;
    switch (dndClass) {
      case DndClass.bard:
        base = _breakpoints(level, 2, 3, 4);
      case DndClass.cleric:
      case DndClass.druid:
        base = _breakpoints(level, 3, 4, 5);
      case DndClass.sorcerer:
        base = _breakpoints(level, 4, 5, 6);
      case DndClass.warlock:
        base = _breakpoints(level, 2, 3, 4);
      case DndClass.wizard:
        base = _breakpoints(level, 3, 4, 5);
      default:
        base = 0;
    }
    return base + raceBonus;
  }

  static bool isKnownCaster(DndClass dndClass) =>
      {DndClass.bard, DndClass.ranger, DndClass.sorcerer, DndClass.warlock}.contains(dndClass);

  static bool isPreparedCaster(DndClass dndClass) =>
      {DndClass.cleric, DndClass.druid, DndClass.wizard, DndClass.paladin}.contains(dndClass);

  static int spellsKnownOrPrepared(DndClass dndClass, int level, int spellcastingAbilityMod) {
    final idx = (level - 1).clamp(0, 19);
    switch (dndClass) {
      case DndClass.bard:
        return _bardKnown[idx];
      case DndClass.ranger:
        return _rangerKnown[idx];
      case DndClass.sorcerer:
        return _sorcererKnown[idx];
      case DndClass.warlock:
        return _warlockKnown[idx];
      case DndClass.cleric:
      case DndClass.druid:
      case DndClass.wizard:
        return (level + spellcastingAbilityMod).clamp(1, 999);
      case DndClass.paladin:
        return ((level ~/ 2) + spellcastingAbilityMod).clamp(1, 999);
      default:
        return 0;
    }
  }
}
