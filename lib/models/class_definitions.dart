import 'enums.dart';

class ResourceDefinition {
  final String id;
  final String name;
  final int levelAvailableFrom;
  final RestType rechargeOn;
  final int Function(int level, int abilityMod) maxAmount;
  final Ability? relatedAbility;
  final String note;

  const ResourceDefinition({
    required this.id,
    required this.name,
    this.levelAvailableFrom = 1,
    required this.rechargeOn,
    required this.maxAmount,
    this.relatedAbility,
    this.note = '',
  });
}

class FeatureDefinition {
  final String id;
  final String name;
  final int levelAcquired;
  final bool isToggle;
  final String description;
  final String source;

  const FeatureDefinition(
    this.id,
    this.name,
    this.levelAcquired,
    this.isToggle,
    this.description, [
    this.source = '',
  ]);
}

class ClassDefinition {
  final DndClass dndClass;
  final CasterType casterType;
  final Ability? spellcastingAbility;
  final List<ResourceDefinition> resources;
  final List<FeatureDefinition> features;

  const ClassDefinition({
    required this.dndClass,
    required this.casterType,
    required this.spellcastingAbility,
    required this.resources,
    required this.features,
  });
}

class ProficiencyTable {
  static int bonusForLevel(int level) {
    if (level >= 17) return 6;
    if (level >= 13) return 5;
    if (level >= 9) return 4;
    if (level >= 5) return 3;
    return 2;
  }
}
