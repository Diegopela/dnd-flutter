import '../models/feat_and_background.dart';

class FeatRepository {
  static const List<FeatDefinition> all = [
  FeatDefinition("alert", "Alerta", "", "+5 a iniciativa; no podés ser sorprendido mientras estés consciente; enemigos ocultos no ganan ventaja extra contra vos."),
  FeatDefinition("athlete", "Atleta", "", "Levantarte de prono cuesta solo parte de tu movimiento; +1 FUE o DES; mejor trepar/saltar."),
  FeatDefinition("actor", "Actor", "", "+1 CAR; ventaja en Interpretación/Engaño al hacerte pasar por otra persona; imitás voces y sonidos."),
  FeatDefinition("charger", "Embestida", "", "Al usar Carrera y luego atacar, sumás daño extra o empujás al objetivo."),
  FeatDefinition("crossbow_expert", "Experto con Ballestas", "", "Ignorás la carga en ballestas; disparar a corta distancia no da desventaja; atacás con ballesta ligera como acción adicional tras atacar."),
  FeatDefinition("defensive_duelist", "Duelista Defensivo (reacción)", "DES 13+", "Con arma con Finesse empuñada, podés sumar bono de competencia a tu CA contra un ataque."),
  FeatDefinition("dual_wielder", "Combate a Dos Armas", "", "+1 CA al pelear con dos armas; podés usar armas no ligeras; podés desenvainar dos armas a la vez."),
  FeatDefinition("dungeon_delver", "Explorador de Mazmorras", "", "Ventaja para detectar trampas/puertas secretas; resistencia a daño de trampas; ventaja contra trampas mágicas."),
  FeatDefinition("durable", "Resistente", "", "+1 CON; al gastar Dados de Golpe para curarte, el resultado mínimo es la mitad del dado."),
  FeatDefinition("elemental_adept", "Adepto Elemental", "capacidad de lanzar conjuros", "Elegís un tipo de daño elemental: tus conjuros de ese tipo ignoran resistencia y los 1 cuentan como 2."),
  FeatDefinition("grappler", "Forcejeador", "FUE 13+", "Ventaja en ataques contra criaturas que ya agarraste; podés intentar inmovilizar a quien tengas agarrado."),
  FeatDefinition("great_weapon_master", "Maestro de Arma Pesada", "", "Al sacar crítico o reducir a 0 PV con arma pesada, atacás de nuevo gratis; podés aceptar -5 al ataque por +10 de daño."),
  FeatDefinition("healer", "Sanador", "", "Con un kit de curación, estabilizás y curás PV extra; podés usarlo varias veces al día para curar heridos."),
  FeatDefinition("heavily_armored", "Fuertemente Armado", "competencia con armadura media", "+1 FUE; ganás competencia con armadura pesada."),
  FeatDefinition("heavy_armor_master", "Maestro de Armadura Pesada", "competencia con armadura pesada", "+1 FUE; el daño físico no mágico que recibís se reduce 3 mientras lleves armadura pesada."),
  FeatDefinition("inspiring_leader", "Líder Inspirador", "", "Con un discurso de 10 minutos, hasta 6 aliados ganan PV temporales."),
  FeatDefinition("keen_mind", "Mente Aguda", "", "+1 INT; siempre sabés dónde queda el norte, cuánto falta para el amanecer/atardecer, y recordás lo vivido el último mes en detalle."),
  FeatDefinition("lightly_armored", "Ligeramente Armado", "", "+1 FUE o DES; ganás competencia con armadura ligera."),
  FeatDefinition("linguist", "Lingüista", "", "+1 INT; aprendés 3 idiomas; podés crear códigos escritos que otros no puedan descifrar fácilmente."),
  FeatDefinition("lucky", "Suertudo", "", "3 puntos de suerte por descanso largo: gastás uno para tirar un d20 extra en un ataque, prueba o salvación (tuya o para imponerla a un atacante)."),
  FeatDefinition("mage_slayer", "Cazador de Magos (reacción)", "", "Podés atacar como reacción a quien lanza un conjuro cerca tuyo; impone desventaja en su concentración; ventaja en salvaciones contra conjuros dirigidos a vos."),
  FeatDefinition("magic_initiate", "Iniciado en Magia", "", "Aprendés 2 trucos y 1 conjuro de nivel 1 de una lista de clase elegida; podés lanzar ese conjuro 1 vez gratis por descanso largo."),
  FeatDefinition("martial_adept", "Adepto Marcial", "", "Aprendés 2 maniobras de Maestro de Batalla y ganás 1 Dado de Superioridad."),
  FeatDefinition("medium_armor_master", "Maestro de Armadura Media", "competencia con armadura media", "La armadura media ya no impone desventaja en Sigilo; podés sumar hasta +3 (en vez de +2) de mod DES a tu CA."),
  FeatDefinition("mobile", "Móvil", "", "+3 m de velocidad; Carrera ignora terreno difícil; no provocás ataques de oportunidad de a quien atacaste cuerpo a cuerpo ese turno."),
  FeatDefinition("moderately_armored", "Moderadamente Armado", "competencia con armadura ligera", "+1 FUE o DES; ganás competencia con armadura media y escudos."),
  FeatDefinition("mounted_combatant", "Combatiente Montado", "", "Ventaja en ataques cuerpo a cuerpo contra criaturas más pequeñas que tu montura; podés forzar ataques hacia vos en vez de tu montura; tu montura evita daño en salvaciones exitosas."),
  FeatDefinition("observant", "Observador", "", "+1 INT o SAB; podés leer los labios; +5 a Percepción/Investigación pasivas."),
  FeatDefinition("polearm_master", "Maestro de Arma de Asta (con lanza/alabarda/etc.)", "", "Ataque adicional con el otro extremo del arma (1d4); ataque de oportunidad si un enemigo entra en tu alcance."),
  FeatDefinition("resilient", "Resiliente", "", "+1 a una característica elegida; ganás competencia en salvaciones de esa característica."),
  FeatDefinition("ritual_caster", "Lanzador de Rituales", "INT o SAB 13+", "Adquirís un libro de rituales con 2 conjuros rituales de una lista de clase; podés aprender más luego."),
  FeatDefinition("savage_attacker", "Atacante Salvaje", "", "1/turno podés tirar el dado de daño de un arma dos veces y quedarte con el mejor resultado."),
  FeatDefinition("sentinel", "Centinela (reacción)", "", "Cuando pegás un ataque de oportunidad, la velocidad del objetivo baja a 0; podés atacar como reacción a quien ataque a un aliado cerca tuyo; los enemigos ya no evitan tus ataques de oportunidad al atacar."),
  FeatDefinition("sharpshooter", "Tirador Certero", "", "Ataques a distancia ignoran cobertura parcial/media y desventaja por larga distancia; podés aceptar -5 al ataque por +10 de daño."),
  FeatDefinition("shield_master", "Maestro del Escudo (con escudo)", "", "Acción adicional para empujar con el escudo; +2 a salvaciones DES de área si tenés escudo; podés usar reacción para evitar todo el daño en una salvación DES exitosa."),
  FeatDefinition("skilled", "Diestro", "", "Ganás competencia en 3 habilidades o herramientas a elección."),
  FeatDefinition("skulker", "Furtivo", "DES 13+", "Podés esconderte estando levemente oscurecido; fallar un ataque a distancia oculto no revela tu posición; ver con poca luz no te penaliza Percepción pasiva."),
  FeatDefinition("spell_sniper", "Francotirador de Conjuros", "capacidad de lanzar conjuros", "Duplicás el alcance de conjuros de ataque; ignoran cobertura parcial/media; aprendés un truco de ataque a distancia."),
  FeatDefinition("tavern_brawler", "Camorrista de Taberna", "", "+1 FUE o CON; competencia con ataques desarmados (1d4 de daño); podés agarrar como acción adicional tras un golpe desarmado."),
  FeatDefinition("tough", "Fornido", "", "+2 PV máximos por nivel de personaje (retroactivo y futuro)."),
  FeatDefinition("war_caster", "Lanzador de Guerra (reacción)", "capacidad de lanzar conjuros", "Ventaja en salvaciones de concentración; podés lanzar conjuros de componente somático aunque tengas las manos ocupadas; podés lanzar un conjuro como ataque de oportunidad."),
  FeatDefinition("weapon_master", "Maestro de Armas", "", "+1 FUE o DES; ganás competencia con 4 armas a elección."),
  ];

  static FeatDefinition? byId(String id) {
    try {
      return all.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }
}
