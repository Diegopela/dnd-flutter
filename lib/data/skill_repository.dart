import '../models/enums.dart';

class SkillDef {
  final String id;
  final String name;
  final Ability ability;
  const SkillDef(this.id, this.name, this.ability);
}

class SkillRepository {
  static const List<SkillDef> skills = [
    SkillDef('acrobatics', 'Acrobacias', Ability.dex),
    SkillDef('animal_handling', 'Trato con Animales', Ability.wis),
    SkillDef('arcana', 'Arcanos', Ability.intel),
    SkillDef('athletics', 'Atletismo', Ability.str),
    SkillDef('deception', 'Engaño', Ability.cha),
    SkillDef('history', 'Historia', Ability.intel),
    SkillDef('insight', 'Perspicacia', Ability.wis),
    SkillDef('intimidation', 'Intimidación', Ability.cha),
    SkillDef('investigation', 'Investigación', Ability.intel),
    SkillDef('medicine', 'Medicina', Ability.wis),
    SkillDef('nature', 'Naturaleza', Ability.intel),
    SkillDef('perception', 'Percepción', Ability.wis),
    SkillDef('performance', 'Interpretación', Ability.cha),
    SkillDef('persuasion', 'Persuasión', Ability.cha),
    SkillDef('religion', 'Religión', Ability.intel),
    SkillDef('sleight_of_hand', 'Juego de Manos', Ability.dex),
    SkillDef('stealth', 'Sigilo', Ability.dex),
    SkillDef('survival', 'Supervivencia', Ability.wis),
  ];

  static const Map<DndClass, Set<Ability>> savingThrowProficiencies = {
    DndClass.barbarian: {Ability.str, Ability.con},
    DndClass.bard: {Ability.dex, Ability.cha},
    DndClass.cleric: {Ability.wis, Ability.cha},
    DndClass.druid: {Ability.intel, Ability.wis},
    DndClass.fighter: {Ability.str, Ability.con},
    DndClass.monk: {Ability.str, Ability.dex},
    DndClass.paladin: {Ability.wis, Ability.cha},
    DndClass.ranger: {Ability.str, Ability.dex},
    DndClass.rogue: {Ability.dex, Ability.intel},
    DndClass.sorcerer: {Ability.con, Ability.cha},
    DndClass.warlock: {Ability.wis, Ability.cha},
    DndClass.wizard: {Ability.intel, Ability.wis},
  };
}
