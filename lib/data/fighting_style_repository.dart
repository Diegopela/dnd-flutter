import '../models/enums.dart';

class FightingStyleOption {
  final String id;
  final String name;
  final String summary;
  const FightingStyleOption(this.id, this.name, this.summary);
}

class FightingStyleRepository {
  static const List<FightingStyleOption> all = [
    FightingStyleOption('archery', 'Arquería', '+2 a las tiradas de ataque con armas a distancia.'),
    FightingStyleOption('defense', 'Defensa', '+1 a la CA mientras lleves armadura.'),
    FightingStyleOption('dueling', 'Duelo',
        '+2 al daño cuando empuñás un arma cuerpo a cuerpo a una mano y ninguna otra arma.'),
    FightingStyleOption('great_weapon', 'Combate con Arma Pesada',
        'Re-tirás 1s y 2s en dados de daño con armas a dos manos/pesadas.'),
    FightingStyleOption('protection', 'Protección (reacción, con escudo)',
        'Con escudo, imponés desventaja al ataque de un enemigo contra un aliado adyacente.'),
    FightingStyleOption('two_weapon', 'Combate con Dos Armas',
        'Sumás el mod de característica al daño del ataque con el arma secundaria.'),
    FightingStyleOption('blind_fighting', 'Combate a Ciegas', 'Visión a ciegas de 3 m.'),
    FightingStyleOption('thrown_weapon', 'Combate con Armas Arrojadizas',
        'Sacar y lanzar un arma cuenta como una sola acción; +2 al daño con armas arrojadizas.'),
    FightingStyleOption('unarmed', 'Combate Desarmado',
        'Tus golpes desarmados suben de dado y podés derribar/empujar al golpear.'),
  ];

  static FightingStyleOption? byId(String id) {
    try {
      return all.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  static int? levelGrantedAt(DndClass dndClass) {
    switch (dndClass) {
      case DndClass.fighter:
        return 1;
      case DndClass.paladin:
      case DndClass.ranger:
        return 2;
      default:
        return null;
    }
  }
}
