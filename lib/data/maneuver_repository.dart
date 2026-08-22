class Maneuver {
  final String id;
  final String name;
  final String summary;
  const Maneuver(this.id, this.name, this.summary);
}

class ManeuverRepository {
  static const List<Maneuver> all = [
    Maneuver('commanders_strike', 'Golpe de Mando',
        'Cedés parte de tu ataque a un aliado, que ataca como reacción sumando el dado de superioridad al daño.'),
    Maneuver('disarming_attack', 'Ataque Desarmante',
        'Al golpear, sumás el dado y podés forzar al objetivo a soltar un objeto (salvación FUE).'),
    Maneuver('distracting_strike', 'Golpe Distractor',
        'Al golpear, sumás el dado y das ventaja al próximo ataque de un aliado contra ese objetivo.'),
    Maneuver('evasive_footwork', 'Movimiento Evasivo',
        'Al moverte, sumás el dado a tu CA hasta que termines de moverte.'),
    Maneuver('feinting_attack', 'Ataque de Amago',
        'Acción adicional: ganás ventaja en tu próximo ataque contra un objetivo y sumás el dado al daño.'),
    Maneuver('goading_attack', 'Ataque Provocador',
        'Al golpear, sumás el dado y el objetivo tiene desventaja para atacar a otro que no seas vos.'),
    Maneuver('lunging_attack', 'Ataque de Estocada',
        'Ganás 1,5 m extra de alcance en el ataque y sumás el dado al daño si golpeás.'),
    Maneuver('maneuvering_attack', 'Ataque de Maniobra',
        'Al golpear, sumás el dado y un aliado puede moverse sin provocar ataques de oportunidad de ese objetivo.'),
    Maneuver('menacing_attack', 'Ataque Amenazante',
        'Al golpear, sumás el dado y el objetivo debe salvar o quedar asustado.'),
    Maneuver('parry', 'Parada (reacción)',
        'Reducís el daño de un ataque cuerpo a cuerpo sumando el dado + mod DES.'),
    Maneuver('precision_attack', 'Ataque Preciso',
        'Sumás el dado a una tirada de ataque, antes o después de tirar.'),
    Maneuver('pushing_attack', 'Ataque de Empuje',
        'Al golpear, sumás el dado y podés empujar al objetivo 4,5 m (salvación FUE).'),
    Maneuver('rally', 'Reagrupar',
        'Acción adicional: un aliado gana PV temporales igual al dado + tu mod CAR.'),
    Maneuver('riposte', 'Contraataque (reacción)',
        'Si un enemigo falla su ataque cuerpo a cuerpo contra vos, atacás como reacción sumando el dado al daño.'),
    Maneuver('sweeping_attack', 'Ataque en Área',
        'Al golpear, podés dañar a otra criatura adyacente al objetivo sumando el dado.'),
    Maneuver('trip_attack', 'Ataque de Zancadilla',
        'Al golpear, sumás el dado y podés derribar al objetivo (salvación FUE).'),
  ];

  static Maneuver? byId(String id) {
    try {
      return all.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  static int knownAtLevel(int level) {
    if (level >= 15) return 7;
    if (level >= 10) return 5;
    if (level >= 7) return 4;
    return 3;
  }

  static int superiorityDiceCount(int level) {
    if (level >= 15) return 6;
    if (level >= 7) return 5;
    return 4;
  }

  static String superiorityDieSize(int level) {
    if (level >= 18) return 'd12';
    if (level >= 10) return 'd10';
    return 'd8';
  }
}
