import '../models/enums.dart';
import '../models/class_definitions.dart';
import '../models/subclass_definitions.dart';

class SubclassRepository {
  static const List<SubclassDefinition> all = [
  SubclassDefinition("path_berserker", "Camino del Berserker", DndClass.barbarian, "PHB", [
    FeatureDefinition("berserker_frenzy", "Frenesí (activa, con Rabia)", 3, true, "Al entrar en Rabia podés frenesiar: ataque cuerpo a cuerpo extra como acción adicional, pero quedás exhausto al terminar."),
    FeatureDefinition("berserker_mindless", "Rabia Irracional", 6, false, "No podés ser hechizado ni asustado mientras estás en Rabia."),
    FeatureDefinition("berserker_intimidating", "Presencia Intimidante (activa)", 10, true, "Como acción, asustás a una criatura cercana (salvación SAB)."),
    FeatureDefinition("berserker_retaliation", "Represalia", 14, false, "Como reacción al recibir daño cuerpo a cuerpo, podés atacar al agresor.")
  ]),
  SubclassDefinition("path_totem", "Camino del Guerrero Totémico", DndClass.barbarian, "PHB", [
    FeatureDefinition("totem_spirit", "Espíritu Totémico (Oso/Águila/Lobo)", 3, false, "Elegís un animal totémico; otorga un beneficio pasivo mientras estás en Rabia."),
    FeatureDefinition("totem_aspect", "Aspecto de la Bestia", 6, false, "Beneficio permanente según tu totem (fuerza, sentidos o movilidad)."),
    FeatureDefinition("totem_spirit_walker", "Paso del Espíritu (activa)", 10, true, "Ritual para comunicarte con el espíritu de la naturaleza."),
    FeatureDefinition("totem_attunement", "Sintonía Totémica", 14, false, "Beneficio adicional final según tu totem elegido.")
  ]),
  SubclassDefinition("college_lore", "Colegio del Conocimiento", DndClass.bard, "PHB", [
    FeatureDefinition("lore_proficiencies", "Competencias Adicionales", 3, false, "Ganás competencia en 3 habilidades más."),
    FeatureDefinition("lore_cutting_words", "Palabras Hirientes (reacción)", 3, true, "Gastás Inspiración Bárdica para restar a una tirada de ataque/prueba/daño enemiga."),
    FeatureDefinition("lore_secrets", "Secretos Mágicos Extra", 6, false, "Aprendés dos conjuros más de cualquier clase."),
    FeatureDefinition("lore_peerless", "Habilidad Incomparable", 14, false, "Podés añadir Inspiración Bárdica a tus propias pruebas de habilidad fallidas.")
  ]),
  SubclassDefinition("college_valor", "Colegio del Valor", DndClass.bard, "PHB", [
    FeatureDefinition("valor_proficiencies", "Competencias Marciales", 3, false, "Armadura media, escudos y armas marciales."),
    FeatureDefinition("valor_combat_inspiration", "Inspiración de Combate", 3, false, "El dado de Inspiración Bárdica también suma a daño o CA."),
    FeatureDefinition("valor_extra_attack", "Ataque Extra", 6, false, "Atacás 2 veces al usar la acción de Atacar."),
    FeatureDefinition("valor_battle_magic", "Magia de Batalla", 14, false, "Podés lanzar un conjuro y atacar con arma en el mismo turno.")
  ]),
  SubclassDefinition("domain_knowledge", "Dominio del Conocimiento", DndClass.cleric, "PHB", [
    FeatureDefinition("knowledge_blessings", "Bendiciones del Conocimiento", 1, false, "Competencia en 2 idiomas y 2 habilidades de conocimiento, con pericia."),
    FeatureDefinition("knowledge_read_history", "CD: Conocimiento de las Eras", 2, true, "Gastás Canalizar Divinidad para obtener info sobre un tema."),
    FeatureDefinition("knowledge_read_thoughts", "CD: Leer Pensamientos", 6, true, "Gastás Canalizar Divinidad para leer la mente de una criatura."),
    FeatureDefinition("knowledge_potent", "Lanzamiento Potente", 8, false, "Sumás mod SAB al daño de trucos de clérigo."),
    FeatureDefinition("knowledge_visions", "Visiones del Pasado", 17, false, "Podés ver el pasado de un objeto o lugar.")
  ]),
  SubclassDefinition("domain_life", "Dominio de la Vida", DndClass.cleric, "PHB", [
    FeatureDefinition("life_armor", "Competencia con Armadura Pesada", 1, false, ""),
    FeatureDefinition("life_disciple", "Discípulo de la Vida", 1, false, "Tus conjuros de curación restauran PV extra."),
    FeatureDefinition("life_preserve", "CD: Preservar la Vida", 2, true, "Gastás Canalizar Divinidad para repartir curación entre varios heridos."),
    FeatureDefinition("life_blessed_healer", "Sanador Bendecido", 6, false, "También te curás vos al lanzar curación sobre otros."),
    FeatureDefinition("life_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño radiante extra a un ataque con arma."),
    FeatureDefinition("life_supreme", "Curación Suprema", 17, false, "Tus tiradas de curación son siempre el máximo posible.")
  ]),
  SubclassDefinition("domain_light", "Dominio de la Luz", DndClass.cleric, "PHB", [
    FeatureDefinition("light_cantrip", "Truco de Luz", 1, false, "Conocés el truco Luz."),
    FeatureDefinition("light_warding_flare", "Destello de Protección (reacción)", 1, true, "Imponés desventaja a un atacante que te vea."),
    FeatureDefinition("light_radiance", "CD: Resplandor del Amanecer", 2, true, "Gastás Canalizar Divinidad para dañar y cegar criaturas oscuras cercanas."),
    FeatureDefinition("light_improved_flare", "Destello Mejorado", 6, false, "Podés usar Destello de Protección para proteger también a aliados."),
    FeatureDefinition("light_potent", "Lanzamiento Potente", 8, false, "Sumás mod SAB al daño de trucos."),
    FeatureDefinition("light_corona", "Corona de Luz", 17, false, "Emitís luz y ventaja en salvaciones contra ceguera/oscuridad.")
  ]),
  SubclassDefinition("domain_nature", "Dominio de la Naturaleza", DndClass.cleric, "PHB", [
    FeatureDefinition("nature_proficiency", "Competencia Extra", 1, false, "Competencia con armadura pesada y un truco de druida a elección."),
    FeatureDefinition("nature_acolyte", "Acólito de la Naturaleza", 1, false, ""),
    FeatureDefinition("nature_charm", "CD: Encantar Animales y Plantas", 2, true, "Gastás Canalizar Divinidad para encantar bestias/plantas cercanas."),
    FeatureDefinition("nature_dampen", "Amortiguar Elementos (reacción)", 6, true, "Reducís el daño elemental que reciben vos o un aliado."),
    FeatureDefinition("nature_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño elemental extra a un ataque con arma."),
    FeatureDefinition("nature_master", "Maestro de la Naturaleza", 17, false, "Podés dar órdenes a bestias y plantas cercanas.")
  ]),
  SubclassDefinition("domain_tempest", "Dominio de la Tempestad", DndClass.cleric, "PHB", [
    FeatureDefinition("tempest_proficiency", "Competencia Marcial y Armadura Pesada", 1, false, ""),
    FeatureDefinition("tempest_wrath", "Ira de la Tormenta (reacción)", 1, true, "Al golpear con ataque, sumás daño de rayo/trueno extra."),
    FeatureDefinition("tempest_destructive", "CD: Ira Destructiva", 2, true, "Gastás Canalizar Divinidad para maximizar daño de rayo/trueno."),
    FeatureDefinition("tempest_thunderbolt", "Golpe de Trueno", 6, false, "Al golpear con arma podés empujar y aturdir con daño de trueno."),
    FeatureDefinition("tempest_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño de rayo/trueno extra a un ataque con arma."),
    FeatureDefinition("tempest_stormborn", "Nacido de la Tormenta", 17, false, "Ganás velocidad de vuelo cuando estás al aire libre.")
  ]),
  SubclassDefinition("domain_trickery", "Dominio del Engaño", DndClass.cleric, "PHB", [
    FeatureDefinition("trickery_blessing", "Bendición del Embaucador", 1, false, "Podés hacer que un aliado sea difícil de rastrear mágicamente."),
    FeatureDefinition("trickery_duplicity", "CD: Invocar Duplicidad", 2, true, "Gastás Canalizar Divinidad para crear una ilusión tuya que puedas mover."),
    FeatureDefinition("trickery_cloak", "CD: Manto de Sombras", 6, true, "Gastás Canalizar Divinidad para volverte invisible."),
    FeatureDefinition("trickery_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño de veneno extra a un ataque con arma."),
    FeatureDefinition("trickery_improved", "Duplicidad Mejorada", 17, false, "Podés crear hasta 4 duplicados ilusorios simultáneos.")
  ]),
  SubclassDefinition("domain_war", "Dominio de la Guerra", DndClass.cleric, "PHB", [
    FeatureDefinition("war_proficiency", "Competencia Marcial y Armadura Pesada", 1, false, ""),
    FeatureDefinition("war_priest", "Sacerdote de Guerra (reacción/bono)", 1, true, "Un número limitado de veces por descanso largo, atacás con arma como acción adicional."),
    FeatureDefinition("war_guided", "CD: Golpe Guiado", 2, true, "Gastás Canalizar Divinidad para sumar +10 a una tirada de ataque."),
    FeatureDefinition("war_blessing", "CD: Bendición del Dios de Guerra", 6, true, "Gastás Canalizar Divinidad para dar +10 al ataque de un aliado."),
    FeatureDefinition("war_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño extra a un ataque con arma."),
    FeatureDefinition("war_avatar", "Avatar de Batalla", 17, false, "Resistencia a daño contundente/perforante/cortante de armas no mágicas.")
  ]),
  SubclassDefinition("circle_land", "Círculo de la Tierra", DndClass.druid, "PHB", [
    FeatureDefinition("land_cantrip", "Truco Adicional", 2, false, "Conocés un truco de druida más."),
    FeatureDefinition("land_recovery", "Recuperación Natural (activa)", 2, true, "1/descanso largo: recuperás espacios de conjuro (nivel total = mitad de tu nivel de druida)."),
    FeatureDefinition("land_circle_spells", "Conjuros de Círculo", 3, false, "Conjuros extra siempre preparados según tu terreno elegido."),
    FeatureDefinition("land_stride", "Paso de la Tierra", 6, false, "El terreno difícil no mágico no te cuesta movimiento extra."),
    FeatureDefinition("land_wards_nature", "Guardián de la Naturaleza", 10, false, "Resistencia a veneno/enfermedad, inmune a ser paralizado/petrificado por plantas."),
    FeatureDefinition("land_sanctuary", "Santuario de la Naturaleza", 14, false, "Bestias/plantas deben salvar para atacarte, o tenés desventaja para atacarlas.")
  ]),
  SubclassDefinition("circle_moon", "Círculo de la Luna", DndClass.druid, "PHB", [
    FeatureDefinition("moon_combat_wild_shape", "Forma Salvaje de Combate (activa)", 2, true, "Podés cambiar de forma como acción adicional y gastar espacios de conjuro para curar PV en Forma Salvaje."),
    FeatureDefinition("moon_circle_forms", "Formas de Círculo", 2, false, "Podés adoptar formas de bestia de NP más alto que lo normal."),
    FeatureDefinition("moon_primal_strike", "Golpe Primigenio", 6, false, "Tus ataques en Forma Salvaje cuentan como mágicos."),
    FeatureDefinition("moon_elemental_shape", "Forma Salvaje Elemental (gasta espacio)", 10, true, "Podés transformarte en un elemental gastando un espacio de conjuro."),
    FeatureDefinition("moon_thousand_forms", "Máscara de las Mil Formas", 14, false, "Conjuro Disfrazarse siempre disponible a voluntad.")
  ]),
  SubclassDefinition("champion", "Campeón", DndClass.fighter, "PHB", [
    FeatureDefinition("champion_crit", "Crítico Mejorado", 3, false, "Sacás crítico con arma en 19 o 20."),
    FeatureDefinition("champion_athlete", "Atleta Excepcional", 7, false, "Bono extra en pruebas de FUE/DES atléticas y saltos."),
    FeatureDefinition("champion_style2", "Estilo de Combate Adicional", 10, false, "Elegís un segundo Estilo de Combate."),
    FeatureDefinition("champion_superior", "Crítico Superior", 15, false, "Sacás crítico con arma en 18, 19 o 20."),
    FeatureDefinition("champion_survivor", "Superviviente", 18, false, "Regenerás PV al inicio de tu turno si estás herido.")
  ]),
  SubclassDefinition("battle_master", "Maestro de Batalla", DndClass.fighter, "PHB", [
    FeatureDefinition("bm_superiority", "Superioridad en Combate (maniobras, gasta dado)", 3, true, "Aprendés maniobras que gastan Dados de Superioridad para efectos extra en combate."),
    FeatureDefinition("bm_student", "Estudiante de Guerra", 3, false, "Competencia extra con un set de herramientas."),
    FeatureDefinition("bm_know_enemy", "Conocer al Enemigo", 7, false, "Podés evaluar las capacidades de un enemigo estudiándolo un momento."),
    FeatureDefinition("bm_improved", "Superioridad Mejorada", 10, false, "Los Dados de Superioridad suben de tamaño."),
    FeatureDefinition("bm_relentless", "Implacable", 15, false, "Recuperás un Dado de Superioridad si te quedás sin ninguno al tirar iniciativa."),
    FeatureDefinition("bm_ultimate", "Superioridad Definitiva", 18, false, "Los Dados de Superioridad vuelven a subir de tamaño.")
  ]),
  SubclassDefinition("eldritch_knight", "Caballero Arcano", DndClass.fighter, "PHB", [
    FeatureDefinition("ek_spellcasting", "Lanzamiento de Conjuros (Mago)", 3, false, "Aprendés conjuros de Mago (mayormente Abjuración/Evocación)."),
    FeatureDefinition("ek_bond", "Vínculo con el Arma (activa)", 3, true, "Vinculás un arma; podés invocarla a la mano como acción adicional."),
    FeatureDefinition("ek_war_magic", "Magia de Guerra", 7, false, "Podés atacar con arma como acción adicional tras lanzar un truco."),
    FeatureDefinition("ek_strike", "Golpe Arcano", 10, false, "Al golpear podés gastar un espacio de conjuro para efectos extra."),
    FeatureDefinition("ek_charge", "Carga Arcana", 15, false, "Al usar Oleada de Acción, también podés teletransportarte cerca."),
    FeatureDefinition("ek_improved_war", "Magia de Guerra Mejorada", 18, false, "Podés atacar dos veces tras lanzar un truco.")
  ]),
  SubclassDefinition("open_hand", "Camino de la Mano Abierta", DndClass.monk, "PHB", [
    FeatureDefinition("open_hand_technique", "Técnica de la Mano Abierta", 3, false, "Al golpear con Ráfaga de Golpes, agregás un efecto extra (derribar, empujar o evitar reacciones)."),
    FeatureDefinition("open_hand_wholeness", "Perfección del Cuerpo (activa)", 6, true, "Como acción, curás PV usando Ki."),
    FeatureDefinition("open_hand_tranquility", "Tranquilidad", 11, false, "Estás bajo el efecto de Santuario entre descansos."),
    FeatureDefinition("open_hand_quivering", "Palma Trémula (gasta Ki)", 17, true, "Al golpear, podés dejar vibraciones letales activables luego a distancia.")
  ]),
  SubclassDefinition("shadow", "Camino de la Sombra", DndClass.monk, "PHB", [
    FeatureDefinition("shadow_arts", "Artes de las Sombras (gasta Ki)", 3, true, "Podés lanzar Oscuridad, Silencio, Mano de Mago o disfrazarte gastando Ki."),
    FeatureDefinition("shadow_step", "Paso entre las Sombras (activa)", 6, true, "Te teletransportás entre sombras como acción adicional."),
    FeatureDefinition("shadow_cloak", "Manto de Sombras (activa)", 11, true, "Te volvés invisible cuando estás en penumbra u oscuridad."),
    FeatureDefinition("shadow_opportunist", "Oportunista (reacción)", 17, true, "Atacás como reacción cuando una criatura cercana recibe daño.")
  ]),
  SubclassDefinition("four_elements", "Camino de los Cuatro Elementos", DndClass.monk, "PHB", [
    FeatureDefinition("elements_disciplines", "Disciplinas Elementales (gastan Ki)", 3, true, "Aprendés disciplinas ki con efectos elementales (Golpe de Fuego, Ola, etc.)."),
    FeatureDefinition("elements_more1", "Disciplina Adicional", 6, false, "Aprendés otra disciplina elemental."),
    FeatureDefinition("elements_more2", "Disciplina Adicional", 11, false, "Aprendés otra disciplina elemental."),
    FeatureDefinition("elements_more3", "Disciplina Adicional", 17, false, "Aprendés otra disciplina elemental.")
  ]),
  SubclassDefinition("oath_devotion", "Juramento de Devoción", DndClass.paladin, "PHB", [
    FeatureDefinition("devotion_cd", "CD: Arma Sagrada / Reprender lo Impío", 3, true, "Gastás Canalizar Divinidad para encantar tu arma o ahuyentar muertos vivientes/demonios."),
    FeatureDefinition("devotion_aura", "Aura de Devoción", 7, false, "Vos y aliados cercanos sois inmunes a ser hechizados."),
    FeatureDefinition("devotion_purity", "Pureza de Espíritu", 15, false, "Estás bajo el efecto de Protección contra el Bien y el Mal permanentemente."),
    FeatureDefinition("devotion_nimbus", "Nimbo Sagrado (activa)", 20, true, "Emitís luz sagrada, con bonos de daño radiante y ventaja en salvaciones para aliados cercanos.")
  ]),
  SubclassDefinition("oath_ancients", "Juramento de los Ancianos", DndClass.paladin, "PHB", [
    FeatureDefinition("ancients_cd", "CD: Ira de la Naturaleza / Ahuyentar a los Desleales", 3, true, "Gastás Canalizar Divinidad para inmovilizar enemigos con enredaderas o ahuyentar criaturas hechizadas/asustadas."),
    FeatureDefinition("ancients_aura", "Aura de Protección", 7, false, "Vos y aliados cercanos ganáis resistencia al daño de conjuros."),
    FeatureDefinition("ancients_undying", "Centinela Imperecedero", 15, false, "Al llegar a 0 PV, podés quedar en 1 PV en su lugar (1/descanso largo)."),
    FeatureDefinition("ancients_champion", "Campeón Ancestral (activa)", 20, true, "Te transformás en un ser feérico ancestral con bonos de daño y movimiento.")
  ]),
  SubclassDefinition("oath_vengeance", "Juramento de Venganza", DndClass.paladin, "PHB", [
    FeatureDefinition("vengeance_cd", "CD: Abjurar Enemigo / Voto de Enemistad", 3, true, "Gastás Canalizar Divinidad para inmovilizar de miedo a un enemigo, o ganar ventaja para atacarlo."),
    FeatureDefinition("vengeance_relentless", "Vengador Implacable (reacción)", 7, false, "Como reacción, perseguís a un enemigo que se aleja."),
    FeatureDefinition("vengeance_soul", "Alma de Venganza (reacción)", 15, false, "Podés atacar como reacción a una criatura bajo tu Voto de Enemistad."),
    FeatureDefinition("vengeance_angel", "Ángel Vengador (activa)", 20, true, "Ganás alas espectrales, volás, y asustás a tu alrededor.")
  ]),
  SubclassDefinition("hunter", "Cazador", DndClass.ranger, "PHB", [
    FeatureDefinition("hunter_prey", "Presa del Cazador", 3, false, "Elegís un estilo de combate contra grupos, un enemigo grande o presas huidizas."),
    FeatureDefinition("hunter_defensive", "Tácticas Defensivas", 7, false, "Beneficio defensivo elegido según el tipo de amenaza."),
    FeatureDefinition("hunter_multiattack", "Multiataque del Cazador", 11, false, "Ataques extra contra varios enemigos cercanos."),
    FeatureDefinition("hunter_superior", "Defensa Superior del Cazador", 15, false, "Beneficio defensivo avanzado según el tipo de amenaza.")
  ]),
  SubclassDefinition("beast_master", "Maestro de Bestias", DndClass.ranger, "PHB", [
    FeatureDefinition("beast_companion", "Compañero del Explorador", 3, false, "Ganás un compañero animal que lucha a tu lado."),
    FeatureDefinition("beast_training", "Entrenamiento Excepcional", 7, false, "Tu compañero puede usar acción adicional sin gastar la tuya."),
    FeatureDefinition("beast_fury", "Furia Bestial", 11, false, "Tu compañero puede atacar más de una vez por turno."),
    FeatureDefinition("beast_share", "Compartir Conjuros", 15, false, "Podés hacer que tus conjuros afecten también a tu compañero.")
  ]),
  SubclassDefinition("thief", "Ladrón", DndClass.rogue, "PHB", [
    FeatureDefinition("thief_fast_hands", "Manos Rápidas", 3, false, "Usás Acción Astuta para usar objetos, abrir cerraduras o robar con Manos Largas."),
    FeatureDefinition("thief_second_story", "Trabajo de Segundo Piso", 3, false, "Trepás a la mitad de velocidad; más distancia al saltar."),
    FeatureDefinition("thief_supreme_sneak", "Sigilo Supremo", 9, false, "Ventaja en Sigilo si te movés a la mitad de tu velocidad."),
    FeatureDefinition("thief_magic_device", "Usar Objetos Mágicos", 13, false, "Ignorás requisitos de clase para usar objetos mágicos."),
    FeatureDefinition("thief_reflexes", "Reflejos de Ladrón", 17, false, "Podés actuar dos veces en el primer turno de combate.")
  ]),
  SubclassDefinition("assassin", "Asesino", DndClass.rogue, "PHB", [
    FeatureDefinition("assassin_proficiency", "Competencias de Asesino", 3, false, "Herramientas de disfraz y de veneno."),
    FeatureDefinition("assassin_assassinate", "Asesinato", 3, false, "Ventaja al atacar a quien no actuó aún; crítico automático por sorpresa."),
    FeatureDefinition("assassin_infiltration", "Pericia en Infiltración", 9, false, "Podés fabricar una identidad falsa creíble."),
    FeatureDefinition("assassin_impostor", "Impostor", 13, false, "Podés imitar el habla, escritura y comportamiento de otra persona."),
    FeatureDefinition("assassin_death_strike", "Golpe Mortal", 17, false, "El objetivo sorprendido debe salvar o sufrir el doble de daño.")
  ]),
  SubclassDefinition("arcane_trickster", "Truhan Arcano", DndClass.rogue, "PHB", [
    FeatureDefinition("at_spellcasting", "Lanzamiento de Conjuros (Mago)", 3, false, "Aprendés conjuros de Mago (mayormente Ilusión/Encantamiento)."),
    FeatureDefinition("at_mage_hand", "Legerdemain de Mano de Mago", 3, false, "Tu Mano de Mago puede robar/manipular objetos sigilosamente."),
    FeatureDefinition("at_ambush", "Emboscada Mágica", 9, false, "Podés lanzar un conjuro contra un objetivo que no te haya visto, con ventaja."),
    FeatureDefinition("at_versatile", "Truhan Versátil", 13, false, "Podés usar Mano de Mago para ganar ventaja en un ataque cuerpo a cuerpo."),
    FeatureDefinition("at_spell_thief", "Ladrón de Conjuros (reacción)", 17, false, "Podés robar temporalmente un conjuro que te lanzaron.")
  ]),
  SubclassDefinition("draconic_bloodline", "Linaje Dracónico", DndClass.sorcerer, "PHB", [
    FeatureDefinition("draconic_ancestor", "Ancestro Dracónico", 1, false, "Elegís un tipo de dragón; determina resistencia y tipo de daño asociado."),
    FeatureDefinition("draconic_resilience", "Resiliencia Dracónica", 1, false, "+1 PV máximo por nivel; CA base 13 + mod DES sin armadura."),
    FeatureDefinition("draconic_affinity", "Afinidad Elemental", 6, false, "Sumás mod CHA al daño de conjuros del tipo de tu linaje."),
    FeatureDefinition("draconic_wings", "Alas Dracónicas (activa)", 14, true, "Como acción adicional, ganás alas y velocidad de vuelo por un tiempo."),
    FeatureDefinition("draconic_presence", "Presencia Dracónica (activa)", 18, true, "Emanás autoridad o terror dracónico, asustando o fascinando cerca.")
  ]),
  SubclassDefinition("wild_magic", "Magia Salvaje", DndClass.sorcerer, "PHB", [
    FeatureDefinition("wild_surge", "Oleada de Magia Salvaje", 1, false, "A veces, al lanzar un conjuro, ocurre un efecto aleatorio de magia salvaje."),
    FeatureDefinition("wild_tides", "Mareas del Caos (activa)", 1, true, "1/descanso largo: ventaja en una tirada, arriesgándote a una Oleada."),
    FeatureDefinition("wild_bend_luck", "Torcer la Suerte (reacción, gasta puntos)", 6, true, "Gastás Puntos de Hechicería para sumar/restar a la tirada de otra criatura."),
    FeatureDefinition("wild_controlled", "Caos Controlado", 14, false, "Podés tirar dos veces en la tabla de Oleada y elegir el resultado."),
    FeatureDefinition("wild_bombardment", "Bombardeo de Conjuros (reacción)", 18, false, "Al sacar el mínimo en un dado de daño de conjuro, podés re-tirarlo.")
  ]),
  SubclassDefinition("archfey", "El Archifeérico", DndClass.warlock, "PHB", [
    FeatureDefinition("archfey_presence", "Presencia Feérica (activa)", 1, true, "Como acción: encantás o asustás a criaturas cercanas (1/descanso corto/largo)."),
    FeatureDefinition("archfey_escape", "Fuga Brumosa (reacción)", 6, false, "Al recibir daño, podés volverte invisible y teletransportarte."),
    FeatureDefinition("archfey_beguiling", "Defensas Seductoras", 10, false, "Sos inmune a ser hechizado, y podés reflejar el hechizo al agresor."),
    FeatureDefinition("archfey_delirium", "Delirio Oscuro (activa)", 14, true, "Rodeás a una criatura de ilusión oscura que la incapacita y confunde.")
  ]),
  SubclassDefinition("fiend", "El Diablo", DndClass.warlock, "PHB", [
    FeatureDefinition("fiend_blessing", "Bendición del Señor Oscuro", 1, false, "Ganás PV temporales al derrotar a una criatura."),
    FeatureDefinition("fiend_luck", "Suerte del Señor Oscuro (activa, gasta usos)", 6, true, "Podés forzar a repetir una salvación fallida."),
    FeatureDefinition("fiend_resilience", "Resiliencia Diabólica", 10, false, "Resistencia a un tipo de daño elegido entre varios descansos."),
    FeatureDefinition("fiend_hurl", "Arrojar al Infierno (activa)", 14, true, "Al matar a una criatura, podés enviar a otra a un plano infernal temporalmente.")
  ]),
  SubclassDefinition("great_old_one", "El Viejo Dios", DndClass.warlock, "PHB", [
    FeatureDefinition("goo_mind", "Mente Despierta", 1, false, "Telepatía limitada con criaturas cercanas."),
    FeatureDefinition("goo_ward", "Guardia Entrópica (reacción)", 6, false, "Impones desventaja/ventaja a una tirada de ataque contra vos."),
    FeatureDefinition("goo_shield", "Escudo Mental", 10, false, "Inmune a ser leído/detectado mentalmente; resistencia a daño psíquico."),
    FeatureDefinition("goo_thrall", "Crear Esclavo (activa)", 14, true, "Podés incapacitar y dominar la mente de un humanoide.")
  ]),
  SubclassDefinition("abjuration", "Escuela de Abjuración", DndClass.wizard, "PHB", [
    FeatureDefinition("abj_ward", "Guardia Arcana (activa)", 2, true, "Creás un escudo de PV temporales usando un espacio de conjuro de Abjuración."),
    FeatureDefinition("abj_projected", "Guardia Proyectada (reacción)", 6, false, "Podés desviar daño de otra criatura hacia tu Guardia Arcana."),
    FeatureDefinition("abj_improved", "Abjuración Mejorada", 10, false, "Sumás bono de competencia a las CD de tus conjuros de Abjuración."),
    FeatureDefinition("abj_resistance", "Resistencia a Conjuros", 14, false, "Ventaja en salvaciones contra conjuros; resistencia al daño de conjuros.")
  ]),
  SubclassDefinition("conjuration", "Escuela de Conjuración", DndClass.wizard, "PHB", [
    FeatureDefinition("conj_minor", "Conjuración Menor (activa)", 2, true, "Creás un objeto pequeño temporal de la nada."),
    FeatureDefinition("conj_transposition", "Transposición Benigna (activa)", 6, true, "Te teletransportás intercambiando lugar con un aliado o creando un espacio."),
    FeatureDefinition("conj_focused", "Conjuración Enfocada", 10, false, "Tus conjuros de invocación no pueden ser interrumpidos por daño."),
    FeatureDefinition("conj_durable", "Invocaciones Duraderas", 14, false, "Las criaturas que invocás ganan PV extra y golpean con más fuerza.")
  ]),
  SubclassDefinition("divination", "Escuela de Adivinación", DndClass.wizard, "PHB", [
    FeatureDefinition("div_portent", "Presagio", 2, false, "Tirás 2 d20 tras descansar; podés reemplazar cualquier tirada por uno de ellos."),
    FeatureDefinition("div_expert", "Adivinación Experta", 6, false, "Copiar conjuros de Adivinación al libro cuesta menos tiempo/oro."),
    FeatureDefinition("div_third_eye", "El Tercer Ojo (activa)", 10, true, "Ganás visión en la oscuridad, en penumbra, u otros sentidos temporalmente."),
    FeatureDefinition("div_greater_portent", "Presagio Mayor", 14, false, "Tirás 3 d20 para Presagio en vez de 2.")
  ]),
  SubclassDefinition("enchantment", "Escuela de Encantamiento", DndClass.wizard, "PHB", [
    FeatureDefinition("ench_gaze", "Mirada Hipnótica (activa)", 2, true, "Como acción, hechizás a una criatura con la mirada mientras la sostenés."),
    FeatureDefinition("ench_charm", "Encanto Instintivo (reacción)", 6, false, "Redirigís un ataque o conjuro dirigido a vos hacia otro objetivo cercano."),
    FeatureDefinition("ench_split", "Encantamiento Dividido", 10, false, "Tus conjuros de encantamiento de un objetivo pueden afectar a un segundo objetivo."),
    FeatureDefinition("ench_memories", "Alterar Recuerdos", 14, false, "Podés modificar los recuerdos de una criatura que hayas hechizado.")
  ]),
  SubclassDefinition("evocation", "Escuela de Evocación", DndClass.wizard, "PHB", [
    FeatureDefinition("evo_sculpt", "Esculpir Conjuros", 2, false, "Podés proteger a aliados del daño de área de tus propios conjuros de evocación."),
    FeatureDefinition("evo_potent", "Truco Potente", 6, false, "Los objetivos con salvación exitosa contra tus trucos igual reciben la mitad del daño."),
    FeatureDefinition("evo_empowered", "Evocación Potenciada", 10, false, "Podés re-tirar un dado de daño al lanzar un conjuro de evocación."),
    FeatureDefinition("evo_overchannel", "Sobrecarga (activa)", 14, true, "Maximizás el daño de un conjuro de nivel bajo, a costa de daño propio si repetís.")
  ]),
  SubclassDefinition("illusion", "Escuela de Ilusión", DndClass.wizard, "PHB", [
    FeatureDefinition("illu_minor", "Ilusión Menor Mejorada", 2, false, "Tu Ilusión Menor puede incluir sonido Y imagen simultáneamente."),
    FeatureDefinition("illu_malleable", "Ilusiones Maleables", 6, false, "Podés cambiar la naturaleza de una ilusión persistente que hayas lanzado."),
    FeatureDefinition("illu_self", "Yo Ilusorio (reacción)", 10, false, "Creás una imagen tuya como señuelo para evitar un ataque."),
    FeatureDefinition("illu_reality", "Realidad Ilusoria", 14, false, "Un objeto dentro de una de tus ilusiones puede volverse real temporalmente.")
  ]),
  SubclassDefinition("necromancy", "Escuela de Nigromancia", DndClass.wizard, "PHB", [
    FeatureDefinition("necro_harvest", "Cosecha Sombría", 2, false, "Al matar con un conjuro, recuperás PV."),
    FeatureDefinition("necro_thralls", "Siervos Sin Muerte", 6, false, "Tus muertos vivientes creados por conjuro ganan PV y daño extra."),
    FeatureDefinition("necro_inured", "Curtido ante la No-Muerte", 10, false, "Resistencia a daño necrótico; tu máximo de PV no puede reducirse."),
    FeatureDefinition("necro_command", "Comandar No-Muertos (activa)", 14, true, "Podés tomar control de un muerto viviente con un conjuro de encantamiento.")
  ]),
  SubclassDefinition("transmutation", "Escuela de Transmutación", DndClass.wizard, "PHB", [
    FeatureDefinition("trans_alchemy", "Alquimia Menor (activa)", 2, true, "Transformás un material en otro temporalmente (madera en metal, etc.)."),
    FeatureDefinition("trans_stone", "Piedra del Transmutador (activa)", 6, true, "Creás una piedra que otorga un beneficio pasivo elegido a quien la porte."),
    FeatureDefinition("trans_shapechanger", "Cambiaformas (activa)", 10, true, "Podés lanzar Metamorfosis con un espacio de conjuro, sin componentes."),
    FeatureDefinition("trans_master", "Maestro Transmutador", 14, false, "Tu Piedra del Transmutador también puede revertir enfermedad, veneno o transformación no deseada.")
  ]),
  SubclassDefinition("path_ancestral", "Camino del Guardián Ancestral", DndClass.barbarian, "Xanathar's", [
    FeatureDefinition("ancestral_spirits", "Espíritus Ancestrales (con Rabia)", 3, false, "Al entrar en Rabia, un enemigo golpeado tiene desventaja para atacar a otros que no seas vos."),
    FeatureDefinition("ancestral_consult", "Consultar a los Espíritus (activa)", 6, true, "Lanzás Augurio o Clarividencia sin gastar componentes, ligado a tus ancestros."),
    FeatureDefinition("ancestral_vengeful", "Espíritu Vengativo", 10, false, "Al entrar en Rabia, podés asustar a un enemigo cercano.")
  ]),
  SubclassDefinition("path_storm_herald", "Camino del Heraldo de la Tormenta", DndClass.barbarian, "Xanathar's", [
    FeatureDefinition("storm_aura", "Aura de Tormenta (con Rabia, elegís Desierto/Mar/Tundra)", 3, false, "Emanás un efecto de área mientras estás en Rabia, según el entorno elegido."),
    FeatureDefinition("storm_shield", "Escudo de Tormenta", 6, false, "Tu Aura otorga resistencia a un tipo de daño elegido."),
    FeatureDefinition("storm_raging", "Tormenta Enfurecida", 10, false, "Tu Aura de Tormenta se vuelve más potente.")
  ]),
  SubclassDefinition("path_zealot", "Camino del Fanático", DndClass.barbarian, "Xanathar's", [
    FeatureDefinition("zealot_fury", "Furia Divina (con Rabia)", 3, false, "Sumás daño radiante/necrótico extra al golpear en Rabia."),
    FeatureDefinition("zealot_undying", "Fanático Imperecedero", 6, false, "Al llegar a 0 PV en Rabia, seguís actuando con 1 PV en vez de caer inconsciente."),
    FeatureDefinition("zealot_rage_beyond", "Rabia Más Allá de la Muerte", 10, false, "No morís mientras estés en Rabia, salvo por daño masivo.")
  ]),
  SubclassDefinition("college_glamour", "Colegio del Glamour", DndClass.bard, "Xanathar's", [
    FeatureDefinition("glamour_beguiling", "Halo Seductor (activa)", 3, true, "Ganás PV temporales y podés encantar/asustar a criaturas cercanas."),
    FeatureDefinition("glamour_mantle", "Manto de Inspiración (activa)", 6, true, "Repartís PV temporales a aliados que puedan verte/oírte, con velocidad extra."),
    FeatureDefinition("glamour_unbreakable", "Belleza Inquebrantable", 14, false, "Ventaja en salvaciones contra ser encantado; podés convertir un fallo en éxito.")
  ]),
  SubclassDefinition("college_swords", "Colegio de las Espadas", DndClass.bard, "Xanathar's", [
    FeatureDefinition("swords_fighting_style", "Estilo de Combate + Arma de Bardo", 3, false, "Competencia con armas marciales y un Estilo de Combate."),
    FeatureDefinition("swords_flourish", "Floritura de Espadas (gasta Inspiración)", 3, true, "Gastás Inspiración Bárdica para efectos extra al atacar (empujar, PV temp, o desengancharte)."),
    FeatureDefinition("swords_extra_attack", "Ataque Extra", 6, false, "Atacás 2 veces al usar la acción de Atacar.")
  ]),
  SubclassDefinition("college_whispers", "Colegio de los Susurros", DndClass.bard, "Xanathar's", [
    FeatureDefinition("whispers_psychic", "Blades Psíquicas (con Inspiración)", 3, true, "Sumás daño psíquico extra 1/turno al golpear con arma."),
    FeatureDefinition("whispers_dreadful", "Aspecto Terrible (activa)", 6, true, "Asustás a una criatura tocada, o volvés indetectable tu presencia sobrenatural."),
    FeatureDefinition("whispers_shadow_lore", "Saber de las Sombras (activa)", 14, true, "Encantás a una criatura para que solo diga la verdad y olvide la conversación.")
  ]),
  SubclassDefinition("domain_forge", "Dominio de la Fragua", DndClass.cleric, "Xanathar's", [
    FeatureDefinition("forge_blessing", "Bendición del Herrero (activa)", 1, true, "Podés fabricar un objeto no mágico simple con materiales, gratis."),
    FeatureDefinition("forge_channel", "CD: Alma de Forja", 2, true, "Gastás Canalizar Divinidad para volverte resistente a daño físico un rato."),
    FeatureDefinition("forge_divine_strike", "Golpe Divino", 8, false, "1/turno sumás daño de fuego extra a un ataque con arma."),
    FeatureDefinition("forge_soul_of_forge", "Alma de la Fragua Mejorada", 17, false, "Ganás resistencia a fuego e inmunidad a daño de tu propia arma/armadura mágica.")
  ]),
  SubclassDefinition("domain_grave", "Dominio de la Tumba", DndClass.cleric, "Xanathar's", [
    FeatureDefinition("grave_circle", "Círculo de Mortalidad", 1, false, "Maximizás la curación al estabilizar/curar a alguien cerca de morir."),
    FeatureDefinition("grave_eyes", "Ojos de la Tumba (activa)", 1, true, "Detectás muertos vivientes cercanos."),
    FeatureDefinition("grave_channel", "CD: Camino a la Tumba", 2, true, "Gastás Canalizar Divinidad para volver vulnerable a un objetivo al siguiente golpe."),
    FeatureDefinition("grave_sentinel", "Centinela de la Tumba", 17, false, "Al matar a una criatura, restauras un uso de Canalizar Divinidad.")
  ]),
  SubclassDefinition("circle_dreams", "Círculo de los Sueños", DndClass.druid, "Xanathar's", [
    FeatureDefinition("dreams_balm", "Bálsamo de Sanación (activa)", 2, true, "Al lanzar un conjuro de curación, curás PV extra a otro objetivo cercano."),
    FeatureDefinition("dreams_hearth", "Fuego de Hogar (activa)", 6, true, "Invocás luz reconfortante que otorga PV temp y ventaja en salvaciones."),
    FeatureDefinition("dreams_walker", "Caminante de los Sueños", 10, false, "Podés visitar los sueños de criaturas dormidas para comunicarte.")
  ]),
  SubclassDefinition("circle_shepherd", "Círculo del Pastor", DndClass.druid, "Xanathar's", [
    FeatureDefinition("shepherd_spirits", "Espíritus Guardianes (activa)", 2, true, "Invocás espíritus fantasmales que curan o dañan cerca de vos."),
    FeatureDefinition("shepherd_totem", "Tótem Espiritual (activa)", 6, true, "Colocás un tótem con un beneficio de área elegido (Bear/Hawk/Unicorn)."),
    FeatureDefinition("shepherd_faithful", "Compañero Fiel", 10, false, "Tus animales invocados/compañeros ganan PV extra y resistencia mágica.")
  ]),
  SubclassDefinition("arcane_archer", "Arquero Arcano", DndClass.fighter, "Xanathar's", [
    FeatureDefinition("archer_shots", "Disparos Arcanos (gastan usos)", 3, true, "Tus flechas ganan efectos mágicos elegidos (explosivas, enredadoras, etc.)."),
    FeatureDefinition("archer_magic_arrow", "Flecha Encantada (activa)", 7, true, "Podés crear una flecha mágica temporal si te quedás sin munición mágica."),
    FeatureDefinition("archer_curving", "Disparo Curvo", 15, false, "Un disparo que falla puede redirigirse a otro objetivo cercano.")
  ]),
  SubclassDefinition("cavalier", "Caballero", DndClass.fighter, "Xanathar's", [
    FeatureDefinition("cavalier_born", "Nacido para la Silla", 3, false, "Ventaja para no caer de una montura; esta no se mueve por miedo."),
    FeatureDefinition("cavalier_challenge", "Desafío Marcial (reacción)", 3, true, "Marcás un enemigo para que tenga desventaja al atacar a otros que no seas vos."),
    FeatureDefinition("cavalier_vigor", "Vigilancia Impetuosa (reacción)", 7, false, "Podés reducir el daño que recibe un aliado cercano, absorbiéndolo vos.")
  ]),
  SubclassDefinition("samurai", "Samurái", DndClass.fighter, "Xanathar's", [
    FeatureDefinition("samurai_fighting_spirit", "Espíritu de Lucha (activa)", 3, true, "Ganás ventaja en ataques y PV temporales por un turno."),
    FeatureDefinition("samurai_elegant", "Cortesía Elegante", 7, false, "Ventaja en una prueba de Persuasión o Perspicacia por turno."),
    FeatureDefinition("samurai_tireless", "Espíritu Incansable", 15, false, "Ventaja en salvaciones contra asustado; recuperás PV al usar Espíritu de Lucha.")
  ]),
  SubclassDefinition("drunken_master", "Camino del Maestro Ebrio", DndClass.monk, "Xanathar's", [
    FeatureDefinition("drunken_technique", "Técnica del Maestro Ebrio (con Ráfaga)", 3, false, "Ganás movimiento extra y desventaja a ataques de oportunidad contra vos."),
    FeatureDefinition("drunken_tipsy", "Sway Alcohólico (reacción)", 6, false, "Podés esquivar un ataque de oportunidad 'tambaleándote'."),
    FeatureDefinition("drunken_drunkards", "Resiliencia del Bebedor", 11, false, "Ventaja contra veneno; podés fingir estar borracho para engañar.")
  ]),
  SubclassDefinition("kensei", "Camino del Kensei", DndClass.monk, "Xanathar's", [
    FeatureDefinition("kensei_weapons", "Armas Kensei", 3, false, "Elegís armas que cuentan como armas monásticas para vos."),
    FeatureDefinition("kensei_agile_parry", "Parada Ágil (reacción)", 3, false, "+CA tras atacar con arma kensei."),
    FeatureDefinition("kensei_deft", "Golpe Certero (con Ki)", 6, true, "Sumás daño extra a un ataque con arma kensei gastando Ki.")
  ]),
  SubclassDefinition("sun_soul", "Camino del Alma Solar", DndClass.monk, "Xanathar's", [
    FeatureDefinition("sunsoul_radiant", "Puños Radiantes (con Ki)", 3, true, "Disparás una ráfaga de energía radiante a distancia gastando Ki."),
    FeatureDefinition("sunsoul_burst", "Estallido Solar (con Ki)", 6, true, "Tu daño radiante afecta un área gastando más Ki."),
    FeatureDefinition("sunsoul_searing", "Halo Abrasador (con Ki)", 11, true, "Emanás luz dañina para enemigos cercanos gastando Ki.")
  ]),
  SubclassDefinition("oath_conquest", "Juramento de la Conquista", DndClass.paladin, "Xanathar's", [
    FeatureDefinition("conquest_cd", "CD: Presencia Temible / Golpe Conquistador", 3, true, "Gastás Canalizar Divinidad para asustar enemigos cercanos o sumar daño psíquico."),
    FeatureDefinition("conquest_aura", "Aura de Conquista", 7, false, "Los enemigos asustados cerca tuyo tienen su velocidad reducida a 0."),
    FeatureDefinition("conquest_scornful", "Ira Desdeñosa (reacción)", 15, false, "Podés ignorar el efecto de asustado mientras dura tu propio miedo infligido.")
  ]),
  SubclassDefinition("oath_redemption", "Juramento de la Redención", DndClass.paladin, "Xanathar's", [
    FeatureDefinition("redemption_cd", "CD: Ruego Pacífico / Aura de la Guardia", 3, true, "Gastás Canalizar Divinidad para calmar a un enemigo o interponerte y absorber daño de un aliado."),
    FeatureDefinition("redemption_protector", "Alma del Protector", 7, false, "Podés usar tu reacción para interponerte con más frecuencia."),
    FeatureDefinition("redemption_emissary", "Emisario de la Redención (reacción)", 15, false, "Si perdonás a un enemigo que se rinde, tu próximo ataque contra otro objetivo gana bonos.")
  ]),
  SubclassDefinition("gloom_stalker", "Acechador Tenebroso", DndClass.ranger, "Xanathar's", [
    FeatureDefinition("gloom_dread", "Ambush Tenebroso (activa)", 3, true, "Ganás iniciativa extra, ataque extra y daño extra en el primer turno de combate."),
    FeatureDefinition("gloom_umbral", "Forma Umbría (activa)", 7, true, "Te volvés parcialmente invisible en oscuridad como acción adicional."),
    FeatureDefinition("gloom_iron_mind", "Mente de Hierro", 11, false, "Ventaja en salvaciones de SAB.")
  ]),
  SubclassDefinition("horizon_walker", "Caminante del Horizonte", DndClass.ranger, "Xanathar's", [
    FeatureDefinition("horizon_detect", "Portales Detectables (activa)", 3, true, "Detectás portales planares/invocaciones cercanas."),
    FeatureDefinition("horizon_rift", "Paso de la Grieta (activa)", 3, true, "Sumás daño de fuerza extra y podés teletransportarte corto al golpear."),
    FeatureDefinition("horizon_ethereal", "Paso Etéreo (activa)", 11, true, "Te volvés parcialmente etéreo por un turno.")
  ]),
  SubclassDefinition("monster_slayer", "Cazador de Monstruos", DndClass.ranger, "Xanathar's", [
    FeatureDefinition("slayer_sense", "Sentido del Cazador (activa)", 3, true, "Aprendés resistencias/inmunidades de una criatura al estudiarla."),
    FeatureDefinition("slayer_mark", "Marca del Cazador (reacción)", 3, true, "Marcás a una criatura que lance un conjuro cerca, ganando ventaja contra ella."),
    FeatureDefinition("slayer_supernatural", "Defensa Sobrenatural (reacción)", 11, false, "Ganás bono a salvación/CA contra el objetivo marcado.")
  ]),
  SubclassDefinition("inquisitive", "Inquisitivo", DndClass.rogue, "Xanathar's", [
    FeatureDefinition("inquisitive_insight", "Percepción del Ojo Agudo", 3, false, "Competencia y pericia extra en Perspicacia/Investigación."),
    FeatureDefinition("inquisitive_eye", "Ojo Insensible al Engaño", 3, false, "Ventaja para detectar mentiras y disfraces mágicos."),
    FeatureDefinition("inquisitive_steady", "Mirada Firme (con Ataque Furtivo)", 9, false, "Podés hacer Ataque Furtivo aunque no tengas ventaja, si el objetivo no te vio venir.")
  ]),
  SubclassDefinition("mastermind", "Mente Maestra", DndClass.rogue, "Xanathar's", [
    FeatureDefinition("mastermind_master_tactics", "Tácticas del Maestro (bono)", 3, false, "Podés darle ventaja de ataque a un aliado a distancia con la Ayuda."),
    FeatureDefinition("mastermind_languages", "Códigos y Disfraces", 3, false, "Competencias sociales y de idiomas extra."),
    FeatureDefinition("mastermind_misdirection", "Desvío (reacción)", 9, false, "Redirigís un ataque hacia otro criatura consintiente cerca tuyo.")
  ]),
  SubclassDefinition("scout", "Explorador (Pícaro)", DndClass.rogue, "Xanathar's", [
    FeatureDefinition("scout_skirmisher", "Escaramuzador (reacción)", 3, false, "Te movés sin provocar ataques de oportunidad cuando un enemigo termina su movimiento cerca."),
    FeatureDefinition("scout_survivalist", "Superviviente Nato", 3, false, "Pericia en Naturaleza y Supervivencia."),
    FeatureDefinition("scout_ambush", "Maestro de la Emboscada", 9, false, "Ventaja en iniciativa; los objetivos sorprendidos no ganan bono DES a la CA contra vos.")
  ]),
  SubclassDefinition("swashbuckler", "Espadachín", DndClass.rogue, "Xanathar's", [
    FeatureDefinition("swash_fancy", "Ataque Elegante", 3, false, "Podés aplicar Ataque Furtivo en un duelo 1 contra 1 sin ventaja."),
    FeatureDefinition("swash_footwork", "Juego de Pies del Espadachín", 3, false, "Un enemigo que ataques no gana ventaja por otros aliados cercanos a vos ese turno."),
    FeatureDefinition("swash_panache", "Petulancia (activa)", 9, true, "Podés encantar/distraer a un enemigo con carisma para que solo pueda atacarte a vos.")
  ]),
  SubclassDefinition("divine_soul", "Alma Divina", DndClass.sorcerer, "Xanathar's", [
    FeatureDefinition("divine_affinity", "Afinidad Divina", 1, false, "Podés elegir conjuros de la lista de Clérigo además de la de Hechicero."),
    FeatureDefinition("divine_favor", "Favor Divino (activa)", 1, true, "1/descanso largo: ventaja en una tirada de ataque, prueba o salvación."),
    FeatureDefinition("divine_wings", "Alas Angelicales (activa)", 6, true, "Ganás alas y velocidad de vuelo por un tiempo.")
  ]),
  SubclassDefinition("shadow_magic", "Magia de las Sombras", DndClass.sorcerer, "Xanathar's", [
    FeatureDefinition("shadow_eyes", "Ojos de la Oscuridad (activa)", 1, true, "Ves en la oscuridad mágica también."),
    FeatureDefinition("shadow_hound", "Sabueso de Sombras (gasta espacio)", 1, true, "Invocás un sabueso hecho de sombra para rastrear/atacar."),
    FeatureDefinition("shadow_walk", "Paso entre las Sombras (activa)", 6, true, "Te teletransportás entre sombras como acción adicional.")
  ]),
  SubclassDefinition("storm_sorcery", "Hechicería de la Tormenta", DndClass.sorcerer, "Xanathar's", [
    FeatureDefinition("storm_wind_speaker", "Vocero del Viento", 1, false, "Entendés y podés ser entendido en Primordial."),
    FeatureDefinition("storm_tattoo", "Guardia Tormentosa (activa)", 1, true, "Podés volar brevemente al lanzar un conjuro de nivel 1+, controlando el viento a tu alrededor."),
    FeatureDefinition("storm_heart", "Corazón de la Tormenta", 6, false, "Resistencia a rayo/trueno; podés empujar criaturas al lanzar conjuros de esos tipos.")
  ]),
  SubclassDefinition("celestial", "El Celestial", DndClass.warlock, "Xanathar's", [
    FeatureDefinition("celestial_healing", "Luz Curativa (con usos, gasta Ki-like pool)", 1, true, "Curás PV a una criatura gastando dados de una reserva ligada a tu nivel."),
    FeatureDefinition("celestial_radiant", "Resistencia Radiante", 1, false, "Resistencia a daño radiante; conocés el truco Luz."),
    FeatureDefinition("celestial_searing", "Vengeance Abrasadora (reacción)", 6, false, "Al recibir daño, podés causar daño radiante de vuelta y curarte.")
  ]),
  SubclassDefinition("hexblade", "El Espadón Maldito", DndClass.warlock, "Xanathar's", [
    FeatureDefinition("hexblade_bond", "Vínculo de Espadón Maldito (activa)", 1, true, "Vinculás un arma; podés usar CAR para atacar/dañar con ella."),
    FeatureDefinition("hexblade_curse", "Maldición del Espadón (activa)", 1, true, "Maldecís a una criatura: crítico ampliado, daño extra y curación al matarla."),
    FeatureDefinition("hexblade_armor", "Armadura Espectral (activa)", 6, true, "Ganás CA temporal espectral como acción adicional.")
  ]),
  SubclassDefinition("war_magic", "Escuela de Magia de Guerra", DndClass.wizard, "Xanathar's", [
    FeatureDefinition("war_arcane_deflection", "Desviación Arcana (reacción)", 2, false, "Ganás bono a CA o salvación, a costa de tu próximo ataque de conjuro."),
    FeatureDefinition("war_tactical_wit", "Ingenio Táctico", 2, false, "Sumás tu INT a la iniciativa."),
    FeatureDefinition("war_power_surge", "Sobrecarga de Poder (activa)", 6, true, "Al golpear con un conjuro de ataque, podés sumar daño extra guardado.")
  ]),
  SubclassDefinition("path_beast", "Camino de la Bestia", DndClass.barbarian, "Tasha's", [
    FeatureDefinition("beast_form", "Forma Bestial (con Rabia)", 3, false, "En Rabia, generás un arma natural (garras, colmillos, cola) como ataque desarmado."),
    FeatureDefinition("beast_infectious", "Furia Contagiosa (reacción)", 6, false, "Podés compartir los efectos de tu Rabia con un aliado herido."),
    FeatureDefinition("beast_call", "Llamado a la Cacería", 10, false, "Vos y aliados cercanos ganan velocidad extra mientras estás en Rabia.")
  ]),
  SubclassDefinition("path_wild_magic", "Camino de la Magia Salvaje", DndClass.barbarian, "Tasha's", [
    FeatureDefinition("wildmagic_surge", "Magia Salvaje Bárbara (con Rabia)", 3, false, "Al entrar en Rabia, tirás en una tabla de efectos mágicos aleatorios."),
    FeatureDefinition("wildmagic_bolstering", "Magia Fortalecedora (con Rabia)", 6, true, "Repartís dados mágicos que otorgan bonos a tiradas entre aliados cercanos."),
    FeatureDefinition("wildmagic_unstable", "Cambio Inestable", 10, false, "Podés forzar una nueva Oleada de Magia como acción adicional.")
  ]),
  SubclassDefinition("college_creation", "Colegio de la Creación", DndClass.bard, "Tasha's", [
    FeatureDefinition("creation_note", "Nota de la Melodía Primigenia (activa)", 3, true, "Como acción adicional, das PV temp o bono a ataque/daño a un aliado."),
    FeatureDefinition("creation_performance", "Performance de la Creación (gasta espacio)", 3, true, "Creás un objeto no mágico temporal cantando, según el nivel de espacio gastado."),
    FeatureDefinition("creation_animating", "Performance Animada", 6, false, "Tus objetos creados pueden cobrar vida temporalmente como aliados.")
  ]),
  SubclassDefinition("college_eloquence", "Colegio de la Elocuencia", DndClass.bard, "Tasha's", [
    FeatureDefinition("eloquence_silver", "Lengua de Plata", 3, false, "Podés repetir una prueba de Persuasión o Engaño fallida usando el nuevo resultado."),
    FeatureDefinition("eloquence_unsettling", "Palabras Inquietantes (reacción, gasta Inspiración)", 3, true, "Reducís la próxima tirada de salvación de un enemigo que falló contra tu conjuro."),
    FeatureDefinition("eloquence_universal", "Persuasión Universal", 6, false, "Tus conjuros que encantan afectan a más de un objetivo igual de bien.")
  ]),
  SubclassDefinition("domain_order", "Dominio del Orden", DndClass.cleric, "Tasha's", [
    FeatureDefinition("order_voice", "Voz de Autoridad (bono)", 1, false, "Podés ordenar a un aliado atacar como reacción a tu conjuro."),
    FeatureDefinition("order_channel", "CD: Palabra de Obligación", 2, true, "Gastás Canalizar Divinidad para reducir la velocidad de enemigos que te oigan."),
    FeatureDefinition("order_divine_strike", "Golpe Divino (Psíquico)", 8, false, "1/turno sumás daño psíquico extra a un ataque con arma."),
    FeatureDefinition("order_embodiment", "Encarnación de la Ley", 17, false, "Ventaja en pruebas de característica; podés forzar desventaja en el ataque de un enemigo cercano.")
  ]),
  SubclassDefinition("domain_peace", "Dominio de la Paz", DndClass.cleric, "Tasha's", [
    FeatureDefinition("peace_emboldening", "Vínculo Alentador (activa)", 1, true, "Das un dado extra a aliados vinculados para sumar a tiradas."),
    FeatureDefinition("peace_channel", "CD: Enlace Pacífico", 2, true, "Gastás Canalizar Divinidad para vincular aliados que compartan daño entre sí."),
    FeatureDefinition("peace_protective", "Vínculo Protector", 6, false, "Podés teletransportarte para absorber daño dirigido a un aliado vinculado."),
    FeatureDefinition("peace_expert", "Comunicador Experto (activa)", 17, true, "Podés forzar a criaturas cercanas a entender la verdad de tus palabras.")
  ]),
  SubclassDefinition("domain_twilight", "Dominio del Crepúsculo", DndClass.cleric, "Tasha's", [
    FeatureDefinition("twilight_eyes", "Ojos de la Noche", 1, false, "Visión en la oscuridad extendida para vos y aliados cercanos."),
    FeatureDefinition("twilight_channel", "CD: Fase Crepuscular", 2, true, "Gastás Canalizar Divinidad para dar sigilo/vuelo temporal a aliados cercanos."),
    FeatureDefinition("twilight_vigilant", "Bendición Vigilante", 6, false, "Ganás alerta constante contra sorpresas cerca de tu Fase Crepuscular."),
    FeatureDefinition("twilight_eternal", "Alma Crepuscular Eterna", 17, false, "Al llegar a 0 PV, podés quedar en 1 PV en su lugar (1/descanso largo).")
  ]),
  SubclassDefinition("circle_spores", "Círculo de las Esporas", DndClass.druid, "Tasha's", [
    FeatureDefinition("spores_halo", "Halo de Esporas (con Ki-like, reacción)", 2, false, "Al matar una criatura cerca, ganás PV temporales."),
    FeatureDefinition("spores_symbiotic", "Entidad Simbiótica (activa, gasta usos de Forma Salvaje)", 2, true, "Ganás PV temp y tu arma desarmada hace daño necrótico extra por un tiempo."),
    FeatureDefinition("spores_fungal", "Infestación Fúngica (reacción)", 6, false, "Una criatura que muere cerca tuyo puede volverse un zombi controlado brevemente.")
  ]),
  SubclassDefinition("circle_stars", "Círculo de las Estrellas", DndClass.druid, "Tasha's", [
    FeatureDefinition("stars_map", "Mapa Estelar (activa)", 2, true, "Invocás una constelación luminosa que sirve de foco de conjuro y otorga un truco."),
    FeatureDefinition("stars_starry_form", "Forma Estelar (activa)", 2, true, "Te transformás en una constelación (Arquero, Cáliz o Guerrero) con beneficios distintos."),
    FeatureDefinition("stars_cosmic", "Omen Cósmico (reacción)", 6, false, "Podés dar ventaja/desventaja a una tirada cercana antes de que se resuelva.")
  ]),
  SubclassDefinition("circle_wildfire", "Círculo del Fuego Salvaje", DndClass.druid, "Tasha's", [
    FeatureDefinition("wildfire_spirit", "Espíritu del Fuego Salvaje (activa, gasta Forma Salvaje)", 2, true, "Invocás un espíritu elemental de fuego que cura o daña cerca de sí."),
    FeatureDefinition("wildfire_enhanced", "Forma Salvaje Mejorada por el Fuego", 6, false, "Podés teletransportarte cerca de tu espíritu al adoptar Forma Salvaje."),
    FeatureDefinition("wildfire_cauterizing", "Golpe Cauterizante (reacción)", 10, false, "Cuando tu espíritu recibe daño, cura a una criatura cercana.")
  ]),
  SubclassDefinition("psi_warrior", "Guerrero Psíquico", DndClass.fighter, "Tasha's", [
    FeatureDefinition("psi_protective", "Poder Psiónico (dados)", 3, false, "Ganás una reserva de Dados de Energía Psiónica que recarga con descansos."),
    FeatureDefinition("psi_telekinetic", "Movimiento Telequinético (gasta dados)", 3, true, "Movés objetos/criaturas a distancia con la mente."),
    FeatureDefinition("psi_protective_field", "Campo Protector (reacción, gasta dados)", 7, true, "Reducís el daño que reciben vos o un aliado cercano.")
  ]),
  SubclassDefinition("rune_knight", "Caballero Rúnico", DndClass.fighter, "Tasha's", [
    FeatureDefinition("rune_carver", "Tallador de Runas", 3, false, "Grabás runas mágicas en tu equipo, cada una con un beneficio activable."),
    FeatureDefinition("rune_giant", "Poder de Gigante (activa)", 3, true, "Crecés de tamaño temporalmente ganando FUE y alcance extra."),
    FeatureDefinition("rune_great_stature", "Gran Estatura", 10, false, "Tu tamaño base aumenta permanentemente un poco.")
  ]),
  SubclassDefinition("way_of_mercy", "Camino de la Misericordia", DndClass.monk, "Tasha's", [
    FeatureDefinition("mercy_hands", "Manos de Sanación y Daño (con Ki)", 3, true, "Gastás Ki para curar PV o infligir daño necrótico con el toque."),
    FeatureDefinition("mercy_physician", "Médico de Batalla", 3, false, "Podés estabilizar/curar criaturas con tu set de herramientas de curandero."),
    FeatureDefinition("mercy_flurry", "Ráfaga de Sanación y Daño", 6, false, "Tu Ráfaga de Golpes puede aplicar los efectos de tus Manos de Misericordia.")
  ]),
  SubclassDefinition("way_astral_self", "Camino del Ser Astral", DndClass.monk, "Tasha's", [
    FeatureDefinition("astral_arms", "Brazos Astrales (con Ki)", 3, true, "Manifestás brazos espectrales con alcance extra para golpear/agarrar."),
    FeatureDefinition("astral_visage", "Visage Astral (con Ki)", 6, true, "Manifestás un rostro espectral con ventaja en Perspicacia/Intimidación y visión en la oscuridad."),
    FeatureDefinition("astral_body", "Cuerpo Astral", 11, false, "Tus Brazos Astrales ganan resistencia a daño físico no mágico.")
  ]),
  SubclassDefinition("oath_glory", "Juramento de la Gloria", DndClass.paladin, "Tasha's", [
    FeatureDefinition("glory_cd", "CD: Ánimo Peligroso / Rasgo Épico", 3, true, "Gastás Canalizar Divinidad para ganar velocidad extra o repetir una prueba de característica."),
    FeatureDefinition("glory_aura", "Aura de Alacridad", 7, false, "Vos y aliados cercanos ganan velocidad extra."),
    FeatureDefinition("glory_legend", "Vida de Leyenda (activa)", 15, true, "1/descanso largo: repetís una prueba de característica, salvación o de muerte fallida.")
  ]),
  SubclassDefinition("oath_watchers", "Juramento de los Vigilantes", DndClass.paladin, "Tasha's", [
    FeatureDefinition("watchers_cd", "CD: Advertencia del Vigilante / Silenciar al Malvado", 3, true, "Gastás Canalizar Divinidad para dar ventaja contra un enemigo o silenciar magia enemiga."),
    FeatureDefinition("watchers_aura", "Aura Aegis", 7, false, "Vos y aliados cercanos ganan resistencia a daño de conjuros extraplanares."),
    FeatureDefinition("watchers_vigilant", "Guardián Vigilante (reacción)", 15, false, "Podés ver a través de ilusiones e invisibilidad brevemente al percibir peligro.")
  ]),
  SubclassDefinition("fey_wanderer", "Errante Feérico", DndClass.ranger, "Tasha's", [
    FeatureDefinition("fey_dread", "Ataque Terrible (gasta espacio, con Presa Predilecta)", 3, true, "Sumás daño psíquico y asustás al golpear con tu Presa del Cazador."),
    FeatureDefinition("fey_otherworldly", "Percepción de Otro Mundo (activa)", 3, true, "Lanzás Detectar Magia/Pensamientos sin gastar espacio, 1/descanso corto."),
    FeatureDefinition("fey_beguiling", "Encanto Feérico (activa)", 7, true, "Podés encantar a una criatura como acción, 1/descanso corto/largo.")
  ]),
  SubclassDefinition("swarmkeeper", "Guardián del Enjambre", DndClass.ranger, "Tasha's", [
    FeatureDefinition("swarm_gather", "Enjambre Reunido (activa)", 3, true, "Un enjambre mágico te acompaña; podés atacar a distancia con él."),
    FeatureDefinition("swarm_wrath", "Ira del Enjambre (reacción)", 3, false, "Al recibir daño, podés empujar al atacante con tu enjambre."),
    FeatureDefinition("swarm_gliding", "Planeo del Enjambre (activa)", 7, true, "Podés frenar tu caída o planear brevemente usando el enjambre.")
  ]),
  SubclassDefinition("phantom", "Fantasma", DndClass.rogue, "Tasha's", [
    FeatureDefinition("phantom_whispers", "Susurros de la Muerte (activa)", 3, true, "Absorbés el conocimiento de un ser que murió cerca, ganando competencia temporal."),
    FeatureDefinition("phantom_wail", "Lamento de la Tumba (con Ataque Furtivo)", 3, false, "Al hacer Ataque Furtivo, podés drenar vida extra con energía necrótica."),
    FeatureDefinition("phantom_touch", "Toque Etéreo (activa)", 9, false, "Podés atravesar objetos/criaturas brevemente al moverte.")
  ]),
  SubclassDefinition("soulknife", "Cuchilla del Alma", DndClass.rogue, "Tasha's", [
    FeatureDefinition("soulknife_blades", "Hojas Psíquicas (activa)", 3, true, "Manifestás dagas psíquicas para atacar a distancia con INT."),
    FeatureDefinition("soulknife_veil", "Velo Psíquico (activa)", 3, true, "Te volvés invisible brevemente usando energía psiónica."),
    FeatureDefinition("soulknife_psychic", "Golpe Psíquico (con Ataque Furtivo)", 9, false, "Podés reemplazar tu Ataque Furtivo por un empuje psíquico de control mental.")
  ]),
  SubclassDefinition("aberrant_mind", "Mente Aberrante", DndClass.sorcerer, "Tasha's", [
    FeatureDefinition("aberrant_telepathic", "Habla Telepática", 1, false, "Podés comunicarte telepáticamente con criaturas cercanas."),
    FeatureDefinition("aberrant_psionic", "Espíritu Psiónico (bono, gasta puntos)", 1, false, "Podés lanzar ciertos conjuros psiónicos sin componentes materiales/verbales."),
    FeatureDefinition("aberrant_psychic_defense", "Defensa Psíquica", 6, false, "Resistencia a daño psíquico; ventaja contra ser hechizado/asustado.")
  ]),
  SubclassDefinition("clockwork_soul", "Alma de Relojería", DndClass.sorcerer, "Tasha's", [
    FeatureDefinition("clockwork_order", "Magia del Orden (reacción, gasta puntos)", 1, true, "Podés anular un dado de daño/tirada enemiga sumando/restando con Puntos de Hechicería."),
    FeatureDefinition("clockwork_restore", "Restaurar Equilibrio (reacción, gasta puntos)", 1, true, "Anulás ventaja/desventaja de una tirada cercana."),
    FeatureDefinition("clockwork_bastion", "Bastión de la Ley (activa)", 6, true, "Otorgás un escudo de PV temporales resistente a hechizar/asustar a un aliado.")
  ]),
  SubclassDefinition("fathomless", "El Insondable", DndClass.warlock, "Tasha's", [
    FeatureDefinition("fathomless_tentacle", "Látigo Tentacular (activa)", 1, true, "Invocás un tentáculo espectral que ataca a distancia y puede agarrar."),
    FeatureDefinition("fathomless_guardian", "Guardián de las Profundidades", 1, false, "Ganás velocidad de nado y podés respirar bajo el agua."),
    FeatureDefinition("fathomless_oath_of_the_deep", "Voto de las Profundidades (activa)", 6, true, "Podés viajar instantáneamente hacia un cuerpo de agua grande cercano.")
  ]),
  SubclassDefinition("genie_patron", "El Genio", DndClass.warlock, "Tasha's", [
    FeatureDefinition("genie_vessel", "Vasija del Genio (activa)", 1, true, "Portás una vasija donde podés refugiarte; según el tipo de genio elegido otorga un beneficio distinto."),
    FeatureDefinition("genie_wrath", "Ira Elemental (con Ataque)", 1, false, "Sumás daño elemental extra según tu tipo de genio al golpear."),
    FeatureDefinition("genie_escape", "Refugio Elemental (activa)", 6, true, "Ganás resistencia a un tipo de daño y podés esconderte en tu Vasija.")
  ]),
  SubclassDefinition("bladesinging", "Escuela del Canto de Espadas", DndClass.wizard, "Tasha's", [
    FeatureDefinition("blade_song", "Canto de Espadas (activa)", 2, true, "Como acción adicional: +CA, ventaja en Acrobacias y velocidad extra mientras dure."),
    FeatureDefinition("blade_extra_attack", "Ataque Extra", 6, false, "Atacás 2 veces al usar la acción de Atacar mientras tu Canto está activo."),
    FeatureDefinition("blade_song_defense", "Defensa del Canto de Espadas", 10, false, "Sumás mod INT a la CA otorgada por tu Canto de Espadas.")
  ]),
  SubclassDefinition("order_scribes", "Orden de los Escribas", DndClass.wizard, "Tasha's", [
    FeatureDefinition("scribes_awakened", "Libro de Hechizos Despierto", 2, false, "Tu libro de conjuros es una entidad mágica que ayuda a copiar y potenciar conjuros."),
    FeatureDefinition("scribes_wordy", "Manifestación Silenciosa (activa)", 2, true, "Podés cambiar el tipo de daño de un conjuro que lanzás desde tu libro."),
    FeatureDefinition("scribes_master_scrivener", "Escriba Maestro (activa)", 6, true, "Podés crear un pergamino temporal de un conjuro que ya lanzaste hoy.")
  ]),
  ];

  static List<SubclassDefinition> forClass(DndClass dndClass) =>
      all.where((s) => s.dndClass == dndClass).toList();

  static SubclassDefinition? byId(String id) {
    try {
      return all.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
