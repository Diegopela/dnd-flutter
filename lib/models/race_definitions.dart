class RaceTrait {
  final String id;
  final String name;
  final String description;
  final bool isToggle;

  const RaceTrait(this.id, this.name, this.description, [this.isToggle = false]);
}

class Subrace {
  final String id;
  final String name;
  final List<RaceTrait> traits;

  const Subrace(this.id, this.name, [this.traits = const []]);
}

class RaceDefinition {
  final String id;
  final String name;
  final String size;
  final int speed;
  final String sourceBook;
  final List<RaceTrait> traits;
  final List<Subrace> subraces;

  const RaceDefinition({
    required this.id,
    required this.name,
    required this.size,
    required this.speed,
    required this.sourceBook,
    required this.traits,
    this.subraces = const [],
  });
}
