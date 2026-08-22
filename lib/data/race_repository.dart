import '../models/race_definitions.dart';

class RaceRepository {
  static final List<RaceDefinition> all = [
  RaceDefinition(
    id: "human", name: "Humano", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("human_versatile", "Versatilidad", "Sin rasgos raciales mágicos destacados, pero muy adaptable (competencias/idiomas extra según variante).")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "elf", name: "Elfo", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("elf_darkvision", "Visión en la Oscuridad", "Ves en la oscuridad hasta 18 m como si fuera penumbra (sin color)."),
      RaceTrait("elf_fey_ancestry", "Ascendencia Feérica", "Ventaja en salvaciones contra ser hechizado; el sueño mágico no te afecta."),
      RaceTrait("elf_trance", "Trance", "No necesitás dormir; meditás 4 h para el mismo descanso que 8 h de sueño."),
      RaceTrait("elf_perception", "Percepción Élfica", "Competencia en Percepción (pasiva).")
    ],
    subraces: [
      Subrace("elf_high", "Alto Elfo", [RaceTrait("elf_high_cantrip", "Truco Adicional", "Conocés un truco de Mago.")]),
      Subrace("elf_wood", "Elfo del Bosque", [RaceTrait("elf_wood_stealth", "Máscara de la Espesura", "Podés intentar esconderte incluso con ligera cobertura natural.")]),
      Subrace("elf_drow", "Elfo Oscuro (Drow)", [RaceTrait("drow_superior_darkvision", "Visión Superior", "Visión en la oscuridad hasta 36 m."), RaceTrait("drow_sunlight_sensitivity", "Sensibilidad a la Luz Solar", "Desventaja en ataques y percepción con luz solar directa."), RaceTrait("drow_magic", "Magia Drow", "Trucos/conjuros menores innatos de origen feérico oscuro.")])
    ],
  ),
  RaceDefinition(
    id: "dwarf", name: "Enano", size: "Mediano", speed: 7, sourceBook: "PHB",
    traits: [
      RaceTrait("dwarf_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("dwarf_resilience", "Resistencia Enana", "Ventaja en salvaciones contra veneno; resistencia a daño de veneno."),
      RaceTrait("dwarf_combat_training", "Entrenamiento en Combate Enano", "Competencia con hacha de mano/batalla, martillo ligero/de guerra."),
      RaceTrait("dwarf_stonecunning", "Conocimiento de la Piedra", "Doble competencia en Historia relacionada a trabajos en piedra.")
    ],
    subraces: [
      Subrace("dwarf_hill", "Enano de las Colinas", [RaceTrait("dwarf_hill_toughness", "Robustez Enana", "+1 PV máximo por nivel.")]),
      Subrace("dwarf_mountain", "Enano de las Montañas", [RaceTrait("dwarf_mountain_armor", "Entrenamiento con Armadura", "Competencia con armadura ligera y media.")])
    ],
  ),
  RaceDefinition(
    id: "halfling", name: "Mediano", size: "Pequeño", speed: 7, sourceBook: "PHB",
    traits: [
      RaceTrait("halfling_lucky", "Suerte", "Repetís un 1 natural en pruebas FUE/DES/salvación de ataque, y usás el nuevo resultado."),
      RaceTrait("halfling_brave", "Valentía", "Ventaja en salvaciones contra asustado."),
      RaceTrait("halfling_agile", "Agilidad Mediana", "Podés moverte a través del espacio de criaturas de tamaño mayor.")
    ],
    subraces: [
      Subrace("halfling_lightfoot", "Piesligeros", [RaceTrait("halfling_lightfoot_stealth", "Sigilo Natural", "Podés esconderte incluso detrás de una criatura una talla mayor que la tuya.")]),
      Subrace("halfling_stout", "Fornido", [RaceTrait("halfling_stout_resilience", "Resistencia Fornida", "Ventaja en salvaciones contra veneno; resistencia a daño de veneno.")])
    ],
  ),
  RaceDefinition(
    id: "dragonborn", name: "Dracónido", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("dragonborn_ancestry", "Ascendencia Dracónica", "Tu tipo de aliento y resistencia dependen del linaje de dragón elegido."),
      RaceTrait("dragonborn_breath", "Arma de Aliento (activa)", "Acción, recarga tras descanso corto/largo: área de daño según tu linaje, salvación CON/DES.", true),
      RaceTrait("dragonborn_resistance", "Resistencia al Daño", "Resistencia al tipo de daño de tu linaje dracónico.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "gnome", name: "Gnomo", size: "Pequeño", speed: 7, sourceBook: "PHB",
    traits: [
      RaceTrait("gnome_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("gnome_cunning", "Astucia Gnoma", "Ventaja en salvaciones de INT/SAB/CAR contra magia.")
    ],
    subraces: [
      Subrace("gnome_forest", "Gnomo del Bosque", [RaceTrait("gnome_forest_illusion", "Ilusionismo Innato", "Conocés el truco Ilusión Menor."), RaceTrait("gnome_forest_speak", "Habla con Bestias Pequeñas", "Podés comunicarte de forma simple con bestias pequeñas.")]),
      Subrace("gnome_rock", "Gnomo de las Rocas", [RaceTrait("gnome_rock_tinker", "Manitas", "Podés construir pequeños autómatas/juguetes mecánicos (Artificio)."), RaceTrait("gnome_rock_knowledge", "Conocimiento de Artificiero", "Doble competencia en Historia sobre alquimia/tecnología mágica.")])
    ],
  ),
  RaceDefinition(
    id: "half_elf", name: "Semielfo", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("half_elf_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("half_elf_fey_ancestry", "Ascendencia Feérica", "Ventaja en salvaciones contra hechizado; inmune a dormir mágicamente."),
      RaceTrait("half_elf_versatility", "Versatilidad en Habilidad", "Competencia en dos habilidades a elección.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "half_orc", name: "Semiorco", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("half_orc_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("half_orc_endurance", "Resistencia Implacable", "Al llegar a 0 PV, podés quedar en 1 PV en su lugar (1/descanso largo)."),
      RaceTrait("half_orc_savage", "Ataques Salvajes", "Al sacar crítico cuerpo a cuerpo, tirás un dado de daño extra adicional.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "tiefling", name: "Tiefling", size: "Mediano", speed: 9, sourceBook: "PHB",
    traits: [
      RaceTrait("tiefling_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("tiefling_resistance", "Resistencia Infernal", "Resistencia a daño de fuego."),
      RaceTrait("tiefling_magic", "Legado Infernal", "Trucos/conjuros menores innatos (Taumaturgia y más según nivel).")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "aasimar", name: "Aasimar", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("aasimar_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("aasimar_resistance", "Resistencia Celestial", "Resistencia a daño necrótico y radiante."),
      RaceTrait("aasimar_healing", "Toque Curativo (activa)", "Acción, usos limitados/descanso largo: curás PV a una criatura tocada.", true)
    ],
    subraces: [
      Subrace("aasimar_protector", "Protector", [RaceTrait("aasimar_protector_wings", "Alas Radiantes (activa)", "Alas espectrales por 1 minuto, volás, y hacés daño radiante extra 1/turno.", true)]),
      Subrace("aasimar_scourge", "Flagelo", [RaceTrait("aasimar_scourge_aura", "Aura Consumidora (activa)", "Aura radiante por 1 minuto que daña a las criaturas cercanas (y a vos).", true)]),
      Subrace("aasimar_fallen", "Caído", [RaceTrait("aasimar_fallen_necrotic", "Aspecto Sombrío (activa)", "Aura necrótica que empuja a atacar con miedo cercano por 1 minuto.", true)])
    ],
  ),
  RaceDefinition(
    id: "firbolg", name: "Firbolg", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("firbolg_magic", "Magia Firbolg (activa)", "Podés lanzar Disfrazarse y Detectar Magia 1 vez cada uno por descanso corto/largo.", true),
      RaceTrait("firbolg_hidden", "Paso Oculto (activa)", "Podés volverte invisible por 1 turno como acción adicional (1/descanso corto/largo).", true),
      RaceTrait("firbolg_speech", "Habla con Bestias y Plantas", "Podés comunicarte de forma simple con bestias y plantas."),
      RaceTrait("firbolg_strength", "Poderoso", "Ventaja en pruebas de FUE.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "goliath", name: "Goliat", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("goliath_athlete", "Atleta Natural", "Ventaja en pruebas de Atletismo y para saltar."),
      RaceTrait("goliath_stone", "Resistencia Pétrea (activa)", "1/descanso corto: reducís el daño de un golpe.", true),
      RaceTrait("goliath_mountain", "Persistencia de Montaña", "Ventaja para resistir agotamiento por clima extremo/altitud.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "kenku", name: "Kenku", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("kenku_mimicry", "Mímica Experta", "Podés imitar sonidos y voces que hayas escuchado."),
      RaceTrait("kenku_stealth", "Camuflaje Reconocible", "Competencia en dos habilidades relacionadas a engaño/sigilo/mano.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "lizardfolk", name: "Hombre Lagarto", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("lizardfolk_bite", "Mordisco Natural", "Ataque desarmado natural que hace daño perforante."),
      RaceTrait("lizardfolk_hide", "Piel Escamosa", "CA base 13 + mod DES sin armadura."),
      RaceTrait("lizardfolk_hold_breath", "Aguantar la Respiración", "Podés contener la respiración hasta 15 minutos."),
      RaceTrait("lizardfolk_survival", "Instinto Cazador", "Competencia en dos habilidades entre Percepción, Naturaleza, Sigilo y Supervivencia.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "tabaxi", name: "Tabaxi", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("tabaxi_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("tabaxi_claws", "Garras Felinas", "Ataque desarmado natural cortante; ventaja en pruebas de Atletismo/Acrobacias para trepar."),
      RaceTrait("tabaxi_agility", "Agilidad Felina (activa)", "Una vez por turno podés duplicar tu velocidad hasta el final del turno tras moverte 3 m.", true)
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "triton", name: "Tritón", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("triton_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("triton_amphibious", "Anfibio", "Podés respirar aire y agua."),
      RaceTrait("triton_swim", "Nadador Ágil", "Velocidad de nado igual a tu velocidad terrestre."),
      RaceTrait("triton_resistance", "Resistencia a Frío", "Resistencia a daño de frío."),
      RaceTrait("triton_control", "Control del Agua Innato", "Conjuros menores innatos ligados al agua según nivel.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "goblin", name: "Goblin", size: "Pequeño", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("goblin_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("goblin_fury", "Furia Feroz (activa)", "1/descanso corto: si te dañan y seguís consciente, podés hacer un ataque como reacción.", true),
      RaceTrait("goblin_nimble", "Escurridizo", "Podés moverte a través del espacio de criaturas de tamaño mayor.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "hobgoblin", name: "Hobgoblin", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("hobgoblin_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("hobgoblin_fortune", "Fortuna Marcial (activa)", "1/descanso corto: le das a vos o un aliado cercano un dado extra para sumar a una tirada.", true),
      RaceTrait("hobgoblin_resistance", "Entrenamiento Marcial", "Competencia con dos armas marciales y armadura ligera.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "kobold", name: "Kobold", size: "Pequeño", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("kobold_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("kobold_frail", "Constitución Frágil", "Desventaja en salvaciones contra veneno; vulnerabilidad a daño de veneno."),
      RaceTrait("kobold_pack", "Táctica de Manada", "Ventaja para atacar si un aliado está adyacente al objetivo (no incapacitado)."),
      RaceTrait("kobold_grovel", "Suplicar por la Vida (activa)", "Como acción, un enemigo cercano debe salvar o darte ventaja para atacarlo hasta tu próximo turno.", true)
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "orc_volo", name: "Orco", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("orc_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("orc_aggressive", "Agresivo (activa)", "Acción adicional: movete hacia un enemigo hasta tu velocidad.", true),
      RaceTrait("orc_intimidating", "Presencia Intimidante", "Competencia en Intimidación.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "yuan_ti", name: "Yuan-ti Purasangre", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("yuanti_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("yuanti_immunity", "Inmunidad a Veneno", "Inmune a daño y estado envenenado."),
      RaceTrait("yuanti_charm", "Resistencia Mágica", "Ventaja en salvaciones contra conjuros y otros efectos mágicos."),
      RaceTrait("yuanti_magic", "Magia Innata de Serpiente", "Conjuros menores innatos (Sugestión y otros según nivel).")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "bugbear", name: "Bugbear", size: "Mediano", speed: 9, sourceBook: "Volo's Guide",
    traits: [
      RaceTrait("bugbear_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("bugbear_long_limbed", "Extremidades Largas", "Tu alcance cuerpo a cuerpo aumenta 1,5 m con ataques desarmados."),
      RaceTrait("bugbear_stealth", "Sigiloso", "Competencia en Sigilo."),
      RaceTrait("bugbear_surprise", "Ataque Sorpresa", "Daño extra al golpear por sorpresa a un objetivo que no te vio actuar.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "changeling", name: "Changeling", size: "Mediano", speed: 9, sourceBook: "Eberron",
    traits: [
      RaceTrait("changeling_shape", "Cambiar Apariencia (activa)", "Acción: cambiás tu apariencia (altura, peso, rasgos, voz) dentro de rangos humanoides.", true),
      RaceTrait("changeling_instincts", "Instintos Cambiantes", "Competencia en dos habilidades sociales a elección.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "kalashtar", name: "Kalashtar", size: "Mediano", speed: 9, sourceBook: "Eberron",
    traits: [
      RaceTrait("kalashtar_mind_link", "Vínculo Mental", "Telepatía limitada con criaturas cercanas que entiendan un idioma."),
      RaceTrait("kalashtar_resistance", "Mente Estable", "Ventaja en salvaciones contra ser hechizado o asustado; inmune a poseer."),
      RaceTrait("kalashtar_dual_mind", "Mente Dual", "Ventaja en salvaciones de SAB."),
      RaceTrait("kalashtar_sever", "Sueño Severo", "No sueñas, y sos inmune a magia que requiera que sueñes.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "shifter", name: "Cambiaformas (Shifter)", size: "Mediano", speed: 9, sourceBook: "Eberron",
    traits: [
      RaceTrait("shifter_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("shifter_shifting", "Cambio (activa)", "Acción adicional: adoptás rasgos bestiales por 1 minuto (1/descanso corto/largo); ganás PV temporales al activarlo.", true)
    ],
    subraces: [
      Subrace("shifter_beasthide", "Piel de Bestia", [RaceTrait("shifter_beasthide_tough", "Resistencia (durante Cambio)", "PV temp extra y +1 CA mientras estás cambiado.")]),
      Subrace("shifter_longtooth", "Diente Largo", [RaceTrait("shifter_longtooth_bite", "Mordisco (durante Cambio)", "Ataque de mordisco extra mientras estás cambiado.")]),
      Subrace("shifter_swiftstride", "Paso Veloz", [RaceTrait("shifter_swiftstride_speed", "Velocidad (durante Cambio)", "+3 m de velocidad y podés desengancharte como reacción una vez al cambiar.")]),
      Subrace("shifter_wildhunt", "Cacería Salvaje", [RaceTrait("shifter_wildhunt_sense", "Sentidos (durante Cambio)", "Ventaja en Percepción y nadie puede esconderse de vos con desventaja mientras estás cambiado.")])
    ],
  ),
  RaceDefinition(
    id: "warforged", name: "Forjado de Guerra", size: "Mediano", speed: 9, sourceBook: "Eberron",
    traits: [
      RaceTrait("warforged_constructed", "Resiliencia de Constructo", "Ventaja contra veneno, resistencia a daño de veneno, no necesitás comer/beber/respirar, inmune a enfermedades."),
      RaceTrait("warforged_armor", "Blindaje Integrado", "Tu cuerpo cuenta como armadura (CA base propia, podés sumar escudo)."),
      RaceTrait("warforged_sentry", "Reposo Centinela", "Tu descanso largo puede hacerse en un estado inerte sin quedar inconsciente del todo.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "centaur", name: "Centauro", size: "Mediano", speed: 10, sourceBook: "Ravnica",
    traits: [
      RaceTrait("centaur_hooves", "Casco Natural", "Ataque desarmado natural que hace daño contundente."),
      RaceTrait("centaur_charge", "Embestida (activa)", "Si te movés 9 m en línea recta antes de atacar con casco, hace daño extra.", true),
      RaceTrait("centaur_survivor", "Instinto Superviviente", "Competencia en Naturaleza o Supervivencia (a elección).")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "loxodon", name: "Loxodon", size: "Mediano", speed: 9, sourceBook: "Ravnica",
    traits: [
      RaceTrait("loxodon_hp", "Resiliente", "PV extra por nivel (contitución elefantina)."),
      RaceTrait("loxodon_trunk", "Trompa Prensil", "Podés manipular objetos livianos y tenés ventaja en pruebas de Olfato."),
      RaceTrait("loxodon_stability", "Paso Firme", "No podés ser derribado mientras estés de pie en el suelo."),
      RaceTrait("loxodon_natural_armor", "Piel Natural", "CA base 12 + mod DES sin armadura.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "simic_hybrid", name: "Híbrido Simic", size: "Mediano", speed: 9, sourceBook: "Ravnica",
    traits: [
      RaceTrait("simic_darkvision", "Visión en la Oscuridad", "Hasta 18 m."),
      RaceTrait("simic_animal", "Aumento Animal", "Elegís un rasgo animal fijo (branquias, garras, caparazón, o zancos) al crear el personaje."),
      RaceTrait("simic_adapt", "Adaptación Biológica", "Resistencia a un tipo de daño elegido al crearlo.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "vedalken", name: "Vedalken", size: "Mediano", speed: 9, sourceBook: "Ravnica",
    traits: [
      RaceTrait("vedalken_focus", "Precisión Vedalken (activa)", "1/descanso corto: repetís una prueba de característica fallida.", true),
      RaceTrait("vedalken_resistance", "Mente Estable", "Ventaja en salvaciones para evitar ser hechizado."),
      RaceTrait("vedalken_sleepless", "Sin Descanso", "No necesitás dormir y no podés ser cegado por falta de sueño; solo necesitás 4 h de trance.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "minotaur", name: "Minotauro", size: "Mediano", speed: 9, sourceBook: "Ravnica",
    traits: [
      RaceTrait("minotaur_horns", "Cornamenta Natural", "Ataque desarmado natural que hace daño perforante."),
      RaceTrait("minotaur_goring", "Embestida con Cuernos (activa)", "Si te movés 3 m antes de atacar con los cuernos, hace daño extra y puede empujar.", true),
      RaceTrait("minotaur_labyrinth", "Recuerdo del Laberinto", "Nunca te perdés por medios no mágicos; recordás cualquier camino recorrido.")
    ],
    subraces: [
      
    ],
  ),
  RaceDefinition(
    id: "custom_lineage", name: "Linaje Personalizado", size: "Mediano", speed: 9, sourceBook: "Tasha's",
    traits: [
      RaceTrait("custom_feat", "Dote Inicial", "Ganás una dote a elección en vez de rasgos raciales fijos."),
      RaceTrait("custom_skill", "Habilidad Extra", "Competencia en una habilidad a elección."),
      RaceTrait("custom_vision", "Visión (opcional)", "Podés elegir Visión en la Oscuridad (18 m) al crear el personaje.")
    ],
    subraces: [
      
    ],
  ),
  ]..sort((a, b) => a.name.compareTo(b.name));

  static RaceDefinition? byId(String id) {
    try {
      return all.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }
}
