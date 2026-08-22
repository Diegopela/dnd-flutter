import 'enums.dart';

class SpellDefinition {
  final String id;
  final String name;
  final int level;
  final String school;
  final Set<DndClass> classes;
  final bool concentration;
  final bool ritual;
  final String? damage;
  final String summary;

  const SpellDefinition(
    this.id,
    this.name,
    this.level,
    this.school,
    this.classes, {
    this.concentration = false,
    this.ritual = false,
    this.damage,
    required this.summary,
  });
}

class KnownSpell {
  final String id;
  final String name;
  final int level;
  final bool prepared;
  final bool concentration;
  final bool ritual;
  final String notes;

  const KnownSpell({
    required this.id,
    required this.name,
    required this.level,
    this.prepared = true,
    this.concentration = false,
    this.ritual = false,
    this.notes = '',
  });

  KnownSpell copyWith({bool? prepared}) => KnownSpell(
        id: id,
        name: name,
        level: level,
        prepared: prepared ?? this.prepared,
        concentration: concentration,
        ritual: ritual,
        notes: notes,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'level': level,
        'prepared': prepared,
        'concentration': concentration,
        'ritual': ritual,
        'notes': notes,
      };

  factory KnownSpell.fromMap(Map<dynamic, dynamic> m) => KnownSpell(
        id: m['id'] as String,
        name: m['name'] as String,
        level: m['level'] as int,
        prepared: m['prepared'] as bool? ?? false,
        concentration: m['concentration'] as bool? ?? false,
        ritual: m['ritual'] as bool? ?? false,
        notes: m['notes'] as String? ?? '',
      );
}
