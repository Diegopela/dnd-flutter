enum Ability { str, dex, con, intel, wis, cha }

extension AbilityDisplay on Ability {
  String get display => switch (this) {
        Ability.str => 'Fuerza',
        Ability.dex => 'Destreza',
        Ability.con => 'Constitución',
        Ability.intel => 'Inteligencia',
        Ability.wis => 'Sabiduría',
        Ability.cha => 'Carisma',
      };

  String get short => switch (this) {
        Ability.str => 'STR',
        Ability.dex => 'DEX',
        Ability.con => 'CON',
        Ability.intel => 'INT',
        Ability.wis => 'WIS',
        Ability.cha => 'CHA',
      };
}

enum DndClass {
  barbarian,
  bard,
  cleric,
  druid,
  fighter,
  monk,
  paladin,
  ranger,
  rogue,
  sorcerer,
  warlock,
  wizard
}

extension DndClassDisplay on DndClass {
  String get display => switch (this) {
        DndClass.barbarian => 'Bárbaro',
        DndClass.bard => 'Bardo',
        DndClass.cleric => 'Clérigo',
        DndClass.druid => 'Druida',
        DndClass.fighter => 'Guerrero',
        DndClass.monk => 'Monje',
        DndClass.paladin => 'Paladín',
        DndClass.ranger => 'Explorador',
        DndClass.rogue => 'Pícaro',
        DndClass.sorcerer => 'Hechicero',
        DndClass.warlock => 'Brujo',
        DndClass.wizard => 'Mago',
      };

  int get hitDie => switch (this) {
        DndClass.barbarian => 12,
        DndClass.bard => 8,
        DndClass.cleric => 8,
        DndClass.druid => 8,
        DndClass.fighter => 10,
        DndClass.monk => 8,
        DndClass.paladin => 10,
        DndClass.ranger => 10,
        DndClass.rogue => 8,
        DndClass.sorcerer => 6,
        DndClass.warlock => 8,
        DndClass.wizard => 6,
      };
}

enum CasterType { none, full, half, pact }

enum RestType { short, long }

extension RestTypeDisplay on RestType {
  String get display => this == RestType.short ? 'Descanso corto' : 'Descanso largo';
}

enum DamageType {
  bludgeoning,
  piercing,
  slashing,
  fire,
  cold,
  lightning,
  acid,
  poison,
  necrotic,
  radiant,
  force,
  psychic,
  thunder
}

extension DamageTypeDisplay on DamageType {
  String get display => switch (this) {
        DamageType.bludgeoning => 'Contundente',
        DamageType.piercing => 'Perforante',
        DamageType.slashing => 'Cortante',
        DamageType.fire => 'Fuego',
        DamageType.cold => 'Frío',
        DamageType.lightning => 'Rayo',
        DamageType.acid => 'Ácido',
        DamageType.poison => 'Veneno',
        DamageType.necrotic => 'Necrótico',
        DamageType.radiant => 'Radiante',
        DamageType.force => 'Fuerza',
        DamageType.psychic => 'Psíquico',
        DamageType.thunder => 'Trueno',
      };
}

/// Mapea el string guardado en DB de vuelta a un DndClass (para persistencia simple).
DndClass dndClassFromName(String name) =>
    DndClass.values.firstWhere((c) => c.name == name, orElse: () => DndClass.fighter);

Ability abilityFromName(String name) =>
    Ability.values.firstWhere((a) => a.name == name, orElse: () => Ability.str);
