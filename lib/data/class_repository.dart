import 'dart:math';
import '../models/enums.dart';
import '../models/class_definitions.dart';

class ClassRepository {
  static FeatureDefinition _f(String id, String name, int lvl, bool toggle, String desc) =>
      FeatureDefinition(id, name, lvl, toggle, desc);

  static final ClassDefinition barbarian = ClassDefinition(
    dndClass: DndClass.barbarian,
    casterType: CasterType.none,
    spellcastingAbility: null,
    resources: [
      ResourceDefinition(
        id: 'rage',
        name: 'Usos de Rabia',
        rechargeOn: RestType.long,
        maxAmount: (level, _) {
          if (level >= 17) return 6;
          if (level >= 12) return 5;
          if (level >= 6) return 4;
          if (level >= 3) return 3;
          return 2;
        },
      ),
    ],
    features: [
      _f('rage_active', 'Rabia (activa)', 1, true, 'Ventaja en pruebas/salvaciones de FUE, bono a daño cuerpo a cuerpo, resistencia a daño físico. Dura 1 min.'),
      _f('unarmored_defense_bar', 'Defensa sin Armadura', 1, false, 'CA = 10 + mod DES + mod CON sin armadura.'),
      _f('reckless_attack', 'Ataque Temerario (activo)', 2, true, 'Ventaja en ataques cuerpo a cuerpo con FUE este turno; a cambio, atacan con ventaja contra vos.'),
      _f('danger_sense', 'Sentido del Peligro', 2, false, 'Ventaja en salvaciones de DES contra efectos que puedas ver.'),
      _f('fast_movement', 'Movimiento Rápido', 5, false, '+3 m de velocidad sin armadura pesada.'),
      _f('brutal_critical', 'Crítico Brutal', 9, false, 'Tira un dado de daño extra en críticos cuerpo a cuerpo.'),
      _f('relentless_endurance', 'Resistencia Implacable', 7, false, 'Al llegar a 0 PV, podés quedar en 1 PV en su lugar (1/descanso largo).'),
      _f('persistent_rage', 'Rabia Persistente', 15, false, 'La rabia solo termina si quedás inconsciente o la terminás vos.'),
      _f('indomitable_might', 'Poderío Indomable', 18, false, 'Si una prueba de FUE da menos que tu puntuación de FUE, usás la puntuación.'),
    ],
  );

  static final ClassDefinition bard = ClassDefinition(
    dndClass: DndClass.bard,
    casterType: CasterType.full,
    spellcastingAbility: Ability.cha,
    resources: [
      ResourceDefinition(
        id: 'bardic_inspiration',
        name: 'Inspiración Bárdica',
        rechargeOn: RestType.long,
        relatedAbility: Ability.cha,
        note: 'Desde nivel 5 recarga en descanso corto (Fuente de Inspiración).',
        maxAmount: (_, mod) => max(1, mod),
      ),
    ],
    features: [
      _f('bardic_inspiration_use', 'Dar Inspiración Bárdica (activa)', 1, true, 'Un aliado gana un dado para sumar a una tirada.'),
      _f('jack_of_all_trades', 'Todos los Oficios', 2, false, 'Sumás la mitad de tu bono de competencia (redondeo abajo) a pruebas sin competencia.'),
      _f('song_of_rest', 'Canción de Descanso', 2, false, 'Los aliados curan PV extra en descanso corto si te escuchan tocar.'),
      _f('expertise', 'Pericia', 3, false, 'Duplicás el bono de competencia en 2 habilidades elegidas.'),
      _f('font_of_inspiration', 'Fuente de Inspiración', 5, false, 'La Inspiración Bárdica recarga en descanso corto o largo.'),
      _f('countercharm', 'Contracanto (activa)', 6, true, 'Vos y aliados cercanos tenéis ventaja contra asustado/hechizado.'),
      _f('magical_secrets', 'Secretos Mágicos', 10, false, 'Aprendés conjuros de cualquier lista de clase.'),
    ],
  );

  static final ClassDefinition cleric = ClassDefinition(
    dndClass: DndClass.cleric,
    casterType: CasterType.full,
    spellcastingAbility: Ability.wis,
    resources: [
      ResourceDefinition(
        id: 'channel_divinity',
        name: 'Canalizar Divinidad',
        levelAvailableFrom: 2,
        rechargeOn: RestType.short,
        maxAmount: (level, _) {
          if (level >= 18) return 3;
          if (level >= 6) return 2;
          return 1;
        },
      ),
    ],
    features: [
      _f('turn_undead', 'Expulsar Muertos Vivientes (usa Canalizar Divinidad)', 2, true, 'Los muertos vivientes cercanos deben salvar o huir.'),
      _f('channel_divinity_domain', 'Canalizar Divinidad (efecto de Dominio)', 2, true, 'Efecto según el Dominio Divino elegido.'),
      _f('destroy_undead', 'Destruir Muertos Vivientes', 5, false, 'Los muertos vivientes de bajo NP fallan y son destruidos al expulsarlos.'),
      _f('divine_intervention', 'Intervención Divina', 10, true, 'Pedís ayuda directa a tu deidad (1/semana aprox).'),
    ],
  );

  static final ClassDefinition druid = ClassDefinition(
    dndClass: DndClass.druid,
    casterType: CasterType.full,
    spellcastingAbility: Ability.wis,
    resources: [
      ResourceDefinition(
        id: 'wild_shape',
        name: 'Forma Salvaje',
        levelAvailableFrom: 2,
        rechargeOn: RestType.short,
        maxAmount: (_, __) => 2,
      ),
    ],
    features: [
      _f('wild_shape_use', 'Forma Salvaje (activa)', 2, true, 'Te transformás en una bestia que hayas visto, según CR permitido a tu nivel.'),
      _f('timeless_body', 'Cuerpo Atemporal', 18, false, 'Envejecés muy lentamente.'),
      _f('beast_spells', 'Conjuros de Bestia', 18, false, 'Podés lanzar conjuros mientras estás en Forma Salvaje.'),
      _f('archdruid', 'Archidruida', 20, false, 'Forma Salvaje ilimitada.'),
    ],
  );

  static final ClassDefinition fighter = ClassDefinition(
    dndClass: DndClass.fighter,
    casterType: CasterType.none,
    spellcastingAbility: null,
    resources: [
      ResourceDefinition(id: 'second_wind', name: 'Segundo Aliento', rechargeOn: RestType.short, maxAmount: (_, __) => 1),
      ResourceDefinition(id: 'action_surge', name: 'Oleada de Acción', levelAvailableFrom: 2, rechargeOn: RestType.short, maxAmount: (level, _) => level >= 17 ? 2 : 1),
      ResourceDefinition(
        id: 'indomitable',
        name: 'Indomable',
        levelAvailableFrom: 9,
        rechargeOn: RestType.long,
        maxAmount: (level, _) {
          if (level >= 17) return 3;
          if (level >= 13) return 2;
          return 1;
        },
      ),
    ],
    features: [
      _f('second_wind_use', 'Segundo Aliento (activa)', 1, true, 'Acción adicional: recuperás 1d10 + nivel de Guerrero PV.'),
      _f('action_surge_use', 'Oleada de Acción (activa)', 2, true, 'Tomás una acción adicional en tu turno.'),
      _f('extra_attack', 'Ataque Extra', 5, false, 'Atacás 2 veces al usar la acción de Atacar (3 en nivel 11, 4 en nivel 20).'),
      _f('indomitable_use', 'Indomable (activa)', 9, true, 'Repetís una tirada de salvación fallida.'),
      _f('fighting_style', 'Estilo de Combate', 1, false, 'Bono pasivo según el estilo elegido (Defensa, Duelo, Arquería, etc.).'),
    ],
  );

  static final ClassDefinition monk = ClassDefinition(
    dndClass: DndClass.monk,
    casterType: CasterType.none,
    spellcastingAbility: null,
    resources: [
      ResourceDefinition(
        id: 'ki_points',
        name: 'Puntos de Ki',
        levelAvailableFrom: 2,
        rechargeOn: RestType.short,
        relatedAbility: Ability.wis,
        maxAmount: (level, _) => level,
      ),
    ],
    features: [
      _f('martial_arts_die', 'Artes Marciales (dado)', 1, false, 'Podés usar DES para golpes/armas monásticas; dado de daño desarmado escala con nivel.'),
      _f('flurry_of_blows', 'Ráfaga de Golpes (1 Ki)', 2, true, 'Acción adicional: 2 ataques desarmados extra.'),
      _f('patient_defense', 'Defensa Paciente (1 Ki)', 2, true, 'Esquivar como acción adicional.'),
      _f('step_of_the_wind', 'Paso del Viento (1 Ki)', 2, true, 'Desengancharte/embestir como acción adicional, con alcance de salto duplicado.'),
      _f('unarmored_movement', 'Movimiento sin Armadura', 2, false, 'Bono de velocidad sin armadura/escudo.'),
      _f('stunning_strike', 'Golpe Aturdidor (1 Ki)', 5, true, 'Al golpear, el objetivo salva CON o queda aturdido.'),
      _f('extra_attack_monk', 'Ataque Extra', 5, false, 'Atacás 2 veces al usar la acción de Atacar.'),
      _f('evasion', 'Evasión', 7, false, 'Sin daño en salvaciones de DES exitosas contra efectos de área; mitad en fallidas.'),
      _f('stillness_of_mind', 'Quietud de la Mente', 7, false, 'Podés terminar por tu cuenta el estado hechizado o asustado.'),
    ],
  );

  static final ClassDefinition paladin = ClassDefinition(
    dndClass: DndClass.paladin,
    casterType: CasterType.half,
    spellcastingAbility: Ability.cha,
    resources: [
      ResourceDefinition(
        id: 'lay_on_hands',
        name: 'Imposición de Manos (PV en pool)',
        rechargeOn: RestType.long,
        relatedAbility: Ability.cha,
        note: 'El pool es 5 x nivel de Paladín, no un modificador.',
        maxAmount: (level, _) => level * 5,
      ),
      ResourceDefinition(id: 'channel_divinity_pal', name: 'Canalizar Divinidad', levelAvailableFrom: 3, rechargeOn: RestType.short, maxAmount: (_, __) => 1),
      ResourceDefinition(id: 'divine_sense', name: 'Sentido Divino', rechargeOn: RestType.long, relatedAbility: Ability.cha, maxAmount: (_, mod) => 1 + mod),
    ],
    features: [
      _f('divine_sense_use', 'Sentido Divino (activa)', 1, true, 'Detectás presencias celestiales/infernales/muertos vivientes cerca.'),
      _f('lay_on_hands_use', 'Imposición de Manos (activa)', 1, true, 'Curás PV del pool tocando a una criatura, o curás una enfermedad/veneno (5 PV).'),
      _f('divine_smite', 'Castigo Divino (activo, gasta espacio)', 2, true, 'Al golpear con arma cuerpo a cuerpo, gastás un espacio de conjuro para daño radiante extra.'),
      _f('extra_attack_pal', 'Ataque Extra', 5, false, 'Atacás 2 veces al usar la acción de Atacar.'),
      _f('aura_of_protection', 'Aura de Protección', 6, false, 'Vos y aliados cercanos sumáis tu mod CHA a salvaciones.'),
      _f('aura_of_courage', 'Aura de Valor', 10, false, 'Vos y aliados cercanos sois inmunes a asustado.'),
    ],
  );

  static final ClassDefinition ranger = ClassDefinition(
    dndClass: DndClass.ranger,
    casterType: CasterType.half,
    spellcastingAbility: Ability.wis,
    resources: [],
    features: [
      _f('favored_enemy', 'Enemigo Predilecto', 1, false, 'Ventaja en Sabiduría (Supervivencia) para rastrear ese tipo de enemigo, y en Inteligencia para recordar info.'),
      _f('natural_explorer', 'Explorador Natural', 1, false, 'Beneficios de viaje/exploración en tu terreno favorecido.'),
      _f('extra_attack_ranger', 'Ataque Extra', 5, false, 'Atacás 2 veces al usar la acción de Atacar.'),
      _f('land_stride', 'Paso de la Tierra', 8, false, 'El terreno difícil no consume más movimiento (no mágico).'),
      _f('evasion_ranger', 'Evasión', 9, false, 'Sin daño en salvaciones de DES exitosas contra efectos de área.'),
    ],
  );

  static final ClassDefinition rogue = ClassDefinition(
    dndClass: DndClass.rogue,
    casterType: CasterType.none,
    spellcastingAbility: null,
    resources: [],
    features: [
      _f('expertise_rogue', 'Pericia', 1, false, 'Duplicás el bono de competencia en 2 habilidades (o 1 habilidad + ganzúas).'),
      _f('sneak_attack', 'Ataque Furtivo (pasivo, recordatorio)', 1, false, '1d6 (escala cada 2 niveles) de daño extra 1/turno si tenés ventaja o un aliado adyacente al objetivo.'),
      _f('cunning_action', 'Acción Astuta (activa)', 2, true, 'Acción adicional para Desengancharte, Esconderte o Desplazarte.'),
      _f('uncanny_dodge', 'Esquiva Asombrosa (reacción)', 5, true, 'Como reacción, reducís a la mitad el daño de un ataque que te impacte.'),
      _f('evasion_rogue', 'Evasión', 7, false, 'Sin daño en salvaciones de DES exitosas contra efectos de área.'),
      _f('reliable_talent', 'Talento Confiable', 11, false, 'Los d20 de pruebas con competencia que salgan menos de 10 cuentan como 10.'),
    ],
  );

  static final ClassDefinition sorcerer = ClassDefinition(
    dndClass: DndClass.sorcerer,
    casterType: CasterType.full,
    spellcastingAbility: Ability.cha,
    resources: [
      ResourceDefinition(id: 'sorcery_points', name: 'Puntos de Hechicería', levelAvailableFrom: 2, rechargeOn: RestType.long, maxAmount: (level, _) => level),
    ],
    features: [
      _f('font_of_magic', 'Fuente de Magia (activa)', 2, true, 'Convertís espacios de conjuro en Puntos de Hechicería y viceversa.'),
      _f('metamagic', 'Metamagia (gasta puntos)', 3, true, 'Modificás un conjuro al lanzarlo (Silencioso, Rápido, Distante, etc.).'),
      _f('sorcerous_restoration', 'Restauración Arcana', 20, false, 'Recuperás 4 Puntos de Hechicería en descanso corto.'),
    ],
  );

  static final ClassDefinition warlock = ClassDefinition(
    dndClass: DndClass.warlock,
    casterType: CasterType.pact,
    spellcastingAbility: Ability.cha,
    resources: [],
    features: [
      _f('eldritch_invocations', 'Invocaciones Ancestrales', 2, false, 'Habilidades mágicas fijas ganadas por invocación elegida.'),
      _f('pact_boon', 'Dádiva del Pacto', 3, false, 'Beneficio del pacto elegido (Cadena, Espada/Tomo/Lámina).'),
      _f('mystic_arcanum', 'Arcano Místico', 11, true, 'Conjuro de alto nivel lanzable 1 vez por descanso largo, sin gastar espacio.'),
    ],
  );

  static final ClassDefinition wizard = ClassDefinition(
    dndClass: DndClass.wizard,
    casterType: CasterType.full,
    spellcastingAbility: Ability.intel,
    resources: [
      ResourceDefinition(id: 'arcane_recovery', name: 'Recuperación Arcana (usos)', rechargeOn: RestType.long, maxAmount: (_, __) => 1),
    ],
    features: [
      _f('arcane_recovery_use', 'Recuperación Arcana (activa)', 1, true, '1/día en descanso corto: recuperás espacios de conjuro (nivel total = mitad de tu nivel de Mago, redondeo arriba).'),
      _f('spell_mastery', 'Maestría de Conjuros', 18, false, 'Lanzás un conjuro de nivel 1 y otro de nivel 2 elegidos sin gastar espacio.'),
      _f('signature_spells', 'Conjuros Distintivos', 20, false, 'Dos conjuros de nivel 3 siempre preparados, lanzables gratis 1 vez cada uno por descanso corto/largo.'),
    ],
  );

  static final Map<DndClass, ClassDefinition> all = {
    DndClass.barbarian: barbarian,
    DndClass.bard: bard,
    DndClass.cleric: cleric,
    DndClass.druid: druid,
    DndClass.fighter: fighter,
    DndClass.monk: monk,
    DndClass.paladin: paladin,
    DndClass.ranger: ranger,
    DndClass.rogue: rogue,
    DndClass.sorcerer: sorcerer,
    DndClass.warlock: warlock,
    DndClass.wizard: wizard,
  };

  static ClassDefinition get(DndClass dndClass) => all[dndClass]!;
}
