import 'package:uuid/uuid.dart';
import 'enums.dart';
import 'weapon.dart';
import 'spell.dart';

class AbilityScores {
  final int str, dex, con, intel, wis, cha;

  const AbilityScores({
    this.str = 10,
    this.dex = 10,
    this.con = 10,
    this.intel = 10,
    this.wis = 10,
    this.cha = 10,
  });

  int score(Ability a) => switch (a) {
        Ability.str => str,
        Ability.dex => dex,
        Ability.con => con,
        Ability.intel => intel,
        Ability.wis => wis,
        Ability.cha => cha,
      };

  int modifier(Ability a) {
    final diff = score(a) - 10;
    return diff >= 0 ? diff ~/ 2 : -((-diff + 1) ~/ 2);
  }

  Map<String, dynamic> toMap() => {'str': str, 'dex': dex, 'con': con, 'intel': intel, 'wis': wis, 'cha': cha};

  factory AbilityScores.fromMap(Map<dynamic, dynamic> m) => AbilityScores(
        str: m['str'] as int? ?? 10,
        dex: m['dex'] as int? ?? 10,
        con: m['con'] as int? ?? 10,
        intel: m['intel'] as int? ?? 10,
        wis: m['wis'] as int? ?? 10,
        cha: m['cha'] as int? ?? 10,
      );
}

class CharacterEntity {
  final String id;
  final String name;
  final DndClass dndClass;
  final int level;
  final String raceId;
  final String subraceId;
  final String subclassId;
  final AbilityScores abilities;

  final int maxHp;
  final int currentHp;
  final int tempHp;
  final int armorClass;

  final List<int> usedSpellSlots; // 9 posiciones
  final int usedPactSlots;
  final Map<String, int> usedResources;
  final Set<String> activeFeatureToggles;

  final List<KnownSpell> knownSpells;
  final List<Weapon> weapons;

  final Set<String> skillProficiencies;
  final Set<String> skillExpertise;

  final List<String> feats;
  final List<String> metamagicOptions;
  final String subclassChoiceId;
  final List<String> knownBeastForms;

  final String backgroundId;
  final String customBackgroundText;

  final String fightingStyleId;
  final List<String> maneuvers;

  final String notes;

  CharacterEntity({
    String? id,
    required this.name,
    required this.dndClass,
    required this.level,
    this.raceId = '',
    this.subraceId = '',
    this.subclassId = '',
    this.abilities = const AbilityScores(),
    this.maxHp = 8,
    this.currentHp = 8,
    this.tempHp = 0,
    this.armorClass = 10,
    List<int>? usedSpellSlots,
    this.usedPactSlots = 0,
    this.usedResources = const {},
    this.activeFeatureToggles = const {},
    this.knownSpells = const [],
    this.weapons = const [],
    this.skillProficiencies = const {},
    this.skillExpertise = const {},
    this.feats = const [],
    this.metamagicOptions = const [],
    this.subclassChoiceId = '',
    this.knownBeastForms = const [],
    this.backgroundId = '',
    this.customBackgroundText = '',
    this.fightingStyleId = '',
    this.maneuvers = const [],
    this.notes = '',
  })  : id = id ?? const Uuid().v4(),
        usedSpellSlots = usedSpellSlots ?? List.filled(9, 0);

  CharacterEntity copyWith({
    String? name,
    DndClass? dndClass,
    int? level,
    String? raceId,
    String? subraceId,
    String? subclassId,
    AbilityScores? abilities,
    int? maxHp,
    int? currentHp,
    int? tempHp,
    int? armorClass,
    List<int>? usedSpellSlots,
    int? usedPactSlots,
    Map<String, int>? usedResources,
    Set<String>? activeFeatureToggles,
    List<KnownSpell>? knownSpells,
    List<Weapon>? weapons,
    Set<String>? skillProficiencies,
    Set<String>? skillExpertise,
    List<String>? feats,
    List<String>? metamagicOptions,
    String? subclassChoiceId,
    List<String>? knownBeastForms,
    String? backgroundId,
    String? customBackgroundText,
    String? fightingStyleId,
    List<String>? maneuvers,
    String? notes,
  }) {
    return CharacterEntity(
      id: id,
      name: name ?? this.name,
      dndClass: dndClass ?? this.dndClass,
      level: level ?? this.level,
      raceId: raceId ?? this.raceId,
      subraceId: subraceId ?? this.subraceId,
      subclassId: subclassId ?? this.subclassId,
      abilities: abilities ?? this.abilities,
      maxHp: maxHp ?? this.maxHp,
      currentHp: currentHp ?? this.currentHp,
      tempHp: tempHp ?? this.tempHp,
      armorClass: armorClass ?? this.armorClass,
      usedSpellSlots: usedSpellSlots ?? this.usedSpellSlots,
      usedPactSlots: usedPactSlots ?? this.usedPactSlots,
      usedResources: usedResources ?? this.usedResources,
      activeFeatureToggles: activeFeatureToggles ?? this.activeFeatureToggles,
      knownSpells: knownSpells ?? this.knownSpells,
      weapons: weapons ?? this.weapons,
      skillProficiencies: skillProficiencies ?? this.skillProficiencies,
      skillExpertise: skillExpertise ?? this.skillExpertise,
      feats: feats ?? this.feats,
      metamagicOptions: metamagicOptions ?? this.metamagicOptions,
      subclassChoiceId: subclassChoiceId ?? this.subclassChoiceId,
      knownBeastForms: knownBeastForms ?? this.knownBeastForms,
      backgroundId: backgroundId ?? this.backgroundId,
      customBackgroundText: customBackgroundText ?? this.customBackgroundText,
      fightingStyleId: fightingStyleId ?? this.fightingStyleId,
      maneuvers: maneuvers ?? this.maneuvers,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'dndClass': dndClass.name,
        'level': level,
        'raceId': raceId,
        'subraceId': subraceId,
        'subclassId': subclassId,
        'abilities': abilities.toMap(),
        'maxHp': maxHp,
        'currentHp': currentHp,
        'tempHp': tempHp,
        'armorClass': armorClass,
        'usedSpellSlots': usedSpellSlots,
        'usedPactSlots': usedPactSlots,
        'usedResources': usedResources,
        'activeFeatureToggles': activeFeatureToggles.toList(),
        'knownSpells': knownSpells.map((s) => s.toMap()).toList(),
        'weapons': weapons.map((w) => w.toMap()).toList(),
        'skillProficiencies': skillProficiencies.toList(),
        'skillExpertise': skillExpertise.toList(),
        'feats': feats,
        'metamagicOptions': metamagicOptions,
        'subclassChoiceId': subclassChoiceId,
        'knownBeastForms': knownBeastForms,
        'backgroundId': backgroundId,
        'customBackgroundText': customBackgroundText,
        'fightingStyleId': fightingStyleId,
        'maneuvers': maneuvers,
        'notes': notes,
      };

  factory CharacterEntity.fromMap(Map<dynamic, dynamic> m) => CharacterEntity(
        id: m['id'] as String,
        name: m['name'] as String,
        dndClass: dndClassFromName(m['dndClass'] as String),
        level: m['level'] as int,
        raceId: m['raceId'] as String? ?? '',
        subraceId: m['subraceId'] as String? ?? '',
        subclassId: m['subclassId'] as String? ?? '',
        abilities: AbilityScores.fromMap(m['abilities'] as Map? ?? {}),
        maxHp: m['maxHp'] as int? ?? 8,
        currentHp: m['currentHp'] as int? ?? 8,
        tempHp: m['tempHp'] as int? ?? 0,
        armorClass: m['armorClass'] as int? ?? 10,
        usedSpellSlots: (m['usedSpellSlots'] as List?)?.map((e) => e as int).toList() ?? List.filled(9, 0),
        usedPactSlots: m['usedPactSlots'] as int? ?? 0,
        usedResources: Map<String, int>.from(m['usedResources'] as Map? ?? {}),
        activeFeatureToggles: Set<String>.from(m['activeFeatureToggles'] as List? ?? []),
        knownSpells: (m['knownSpells'] as List?)?.map((e) => KnownSpell.fromMap(e as Map)).toList() ?? [],
        weapons: (m['weapons'] as List?)?.map((e) => Weapon.fromMap(e as Map)).toList() ?? [],
        skillProficiencies: Set<String>.from(m['skillProficiencies'] as List? ?? []),
        skillExpertise: Set<String>.from(m['skillExpertise'] as List? ?? []),
        feats: List<String>.from(m['feats'] as List? ?? []),
        metamagicOptions: List<String>.from(m['metamagicOptions'] as List? ?? []),
        subclassChoiceId: m['subclassChoiceId'] as String? ?? '',
        knownBeastForms: List<String>.from(m['knownBeastForms'] as List? ?? []),
        backgroundId: m['backgroundId'] as String? ?? '',
        customBackgroundText: m['customBackgroundText'] as String? ?? '',
        fightingStyleId: m['fightingStyleId'] as String? ?? '',
        maneuvers: List<String>.from(m['maneuvers'] as List? ?? []),
        notes: m['notes'] as String? ?? '',
      );
}
