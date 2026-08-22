import '../models/enums.dart';
import '../models/character.dart';
import '../models/weapon.dart';

class Calculations {
  static String modifierString(int mod) => mod >= 0 ? '+$mod' : '$mod';

  static Ability effectiveAbility(Weapon weapon, AbilityScores abilities) {
    if (!weapon.isFinesse) return weapon.ability;
    return abilities.modifier(Ability.dex) >= abilities.modifier(Ability.str) ? Ability.dex : Ability.str;
  }

  static int attackBonus(Weapon weapon, AbilityScores abilities, int proficiencyBonus) {
    final ability = effectiveAbility(weapon, abilities);
    final abMod = abilities.modifier(ability);
    final prof = weapon.isProficient ? proficiencyBonus : 0;
    return abMod + prof + weapon.bonusToHit;
  }

  static int damageBonus(Weapon weapon, AbilityScores abilities) {
    final ability = effectiveAbility(weapon, abilities);
    return abilities.modifier(ability) + weapon.bonusToDamage;
  }

  static String damageFormula(Weapon weapon, AbilityScores abilities, {bool versatileTwoHanded = false}) {
    final dice = (versatileTwoHanded && weapon.versatileDice != null) ? weapon.versatileDice! : weapon.damageDice;
    final bonus = damageBonus(weapon, abilities);
    final bonusStr = bonus != 0 ? ' ${modifierString(bonus)}' : '';
    return '$dice$bonusStr ${weapon.damageType.display}';
  }

  static int? spellSaveDC(Ability? spellcastingAbility, AbilityScores abilities, int proficiencyBonus) {
    if (spellcastingAbility == null) return null;
    return 8 + proficiencyBonus + abilities.modifier(spellcastingAbility);
  }

  static int? spellAttackBonus(Ability? spellcastingAbility, AbilityScores abilities, int proficiencyBonus) {
    if (spellcastingAbility == null) return null;
    return proficiencyBonus + abilities.modifier(spellcastingAbility);
  }
}
