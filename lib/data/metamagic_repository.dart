class MetamagicOption {
  final String id;
  final String name;
  final String cost;
  final String summary;
  const MetamagicOption(this.id, this.name, this.cost, this.summary);
}

class MetamagicRepository {
  static const List<MetamagicOption> all = [
    MetamagicOption('careful', 'Conjuro Cuidadoso', '1 punto',
        'Hasta un número de criaturas igual a tu mod CHA (mín. 1) dentro del área de tu conjuro automáticamente salvan con éxito.'),
    MetamagicOption('distant', 'Conjuro Distante', '1 punto',
        'Duplicás el alcance del conjuro, o si es de Toque, lo volvés de 9 m de alcance.'),
    MetamagicOption('empowered', 'Conjuro Empoderado', '1 punto',
        'Re-tirás hasta un número de dados de daño igual a tu mod CHA (mín. 1) al lanzar un conjuro de daño.'),
    MetamagicOption('extended', 'Conjuro Extendido', '1 punto',
        'Duplicás la duración del conjuro (máximo 24 horas).'),
    MetamagicOption('heightened', 'Conjuro Elevado', '3 puntos',
        'Un objetivo tiene desventaja en su primera salvación contra el conjuro.'),
    MetamagicOption('quickened', 'Conjuro Rápido', '2 puntos',
        'Un conjuro que normalmente lleva 1 acción, lo lanzás como acción adicional.'),
    MetamagicOption('subtle', 'Conjuro Sutil', '1 punto',
        'Lanzás el conjuro sin componentes verbales ni somáticos.'),
    MetamagicOption('twinned', 'Conjuro Gemelo', '= nivel del conjuro (1 si es truco)',
        'Un conjuro de un solo objetivo puede apuntar a un segundo objetivo dentro de su alcance.'),
  ];

  static MetamagicOption? byId(String id) {
    try {
      return all.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  static int knownAtLevel(int level) {
    if (level >= 17) return 4;
    if (level >= 10) return 3;
    if (level >= 3) return 2;
    return 0;
  }
}
