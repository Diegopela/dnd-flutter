import 'package:flutter/foundation.dart';
import '../models/character.dart';
import '../models/spell.dart';
import '../models/weapon.dart';
import '../data/class_repository.dart';
import '../data/spell_slot_tables.dart';
import '../models/enums.dart';
import '../storage/character_storage.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterStorage storage;
  CharacterProvider(this.storage) {
    storage.box.listenable().addListener(_onBoxChanged);
  }

  void _onBoxChanged() => notifyListeners();

  List<CharacterEntity> get characters => storage.getAll();

  CharacterEntity? byId(String id) => storage.getById(id);

  Future<void> saveCharacter(CharacterEntity character) async {
    await storage.save(character);
  }

  Future<void> deleteCharacter(CharacterEntity character) async {
    await storage.delete(character);
  }

  // ---- Acciones de la barra de habilidades ----

  Future<void> toggleSpellSlot(CharacterEntity c, int slotLevel, bool consume) async {
    final classDef = ClassRepository.all[c.dndClass]!;
    final maxSlots = SpellSlotTables.slotsFor(classDef.casterType, c.level);
    final idx = slotLevel - 1;
    final used = List<int>.from(c.usedSpellSlots);
    final current = idx < used.length ? used[idx] : 0;
    final maxForLevel = idx < maxSlots.length ? maxSlots[idx] : 0;
    final newVal = consume ? (current + 1).clamp(0, maxForLevel) : (current - 1).clamp(0, maxForLevel);
    used[idx] = newVal;
    await saveCharacter(c.copyWith(usedSpellSlots: used));
  }

  Future<void> togglePactSlot(CharacterEntity c, bool consume) async {
    final entry = SpellSlotTables.warlockPact[(c.level - 1).clamp(0, 19)];
    final maxSlots = entry[0];
    final newVal = consume ? (c.usedPactSlots + 1).clamp(0, maxSlots) : (c.usedPactSlots - 1).clamp(0, maxSlots);
    await saveCharacter(c.copyWith(usedPactSlots: newVal));
  }

  Future<void> toggleResource(CharacterEntity c, String resourceId, int maxAmount, bool consume) async {
    final used = Map<String, int>.from(c.usedResources);
    final current = used[resourceId] ?? 0;
    final newVal = consume ? (current + 1).clamp(0, maxAmount) : (current - 1).clamp(0, maxAmount);
    used[resourceId] = newVal;
    await saveCharacter(c.copyWith(usedResources: used));
  }

  Future<void> toggleFeature(CharacterEntity c, String featureId) async {
    final active = Set<String>.from(c.activeFeatureToggles);
    if (!active.add(featureId)) active.remove(featureId);
    await saveCharacter(c.copyWith(activeFeatureToggles: active));
  }

  Future<void> cycleSkillProficiency(CharacterEntity c, String skillId) async {
    final prof = Set<String>.from(c.skillProficiencies);
    final expertise = Set<String>.from(c.skillExpertise);
    if (expertise.contains(skillId)) {
      expertise.remove(skillId);
      prof.remove(skillId);
    } else if (prof.contains(skillId)) {
      expertise.add(skillId);
    } else {
      prof.add(skillId);
    }
    await saveCharacter(c.copyWith(skillProficiencies: prof, skillExpertise: expertise));
  }

  Future<void> shortRest(CharacterEntity c) async {
    final classDef = ClassRepository.all[c.dndClass]!;
    final used = Map<String, int>.from(c.usedResources);
    for (final r in classDef.resources.where((r) => r.rechargeOn == RestType.short)) {
      used.remove(r.id);
    }
    if (c.subclassId == 'battle_master') used.remove('superiority_dice');
    var pact = c.usedPactSlots;
    if (classDef.casterType == CasterType.pact) pact = 0;
    await saveCharacter(c.copyWith(usedResources: used, usedPactSlots: pact));
  }

  Future<void> longRest(CharacterEntity c) async {
    final classDef = ClassRepository.all[c.dndClass]!;
    final used = Map<String, int>.from(c.usedResources);
    for (final r in classDef.resources) {
      used.remove(r.id);
    }
    if (c.subclassId == 'battle_master') used.remove('superiority_dice');
    await saveCharacter(c.copyWith(
      usedResources: used,
      usedSpellSlots: List.filled(9, 0),
      usedPactSlots: 0,
      currentHp: c.maxHp,
    ));
  }

  Future<void> applyDamage(CharacterEntity c, int amount) async {
    if (amount <= 0) return;
    var temp = c.tempHp;
    var current = c.currentHp;
    final fromTemp = temp < amount ? temp : amount;
    temp -= fromTemp;
    current = (current - (amount - fromTemp)).clamp(0, c.maxHp + 1000);
    await saveCharacter(c.copyWith(currentHp: current, tempHp: temp));
  }

  Future<void> applyHeal(CharacterEntity c, int amount) async {
    if (amount <= 0) return;
    final newHp = (c.currentHp + amount).clamp(0, c.maxHp);
    await saveCharacter(c.copyWith(currentHp: newHp));
  }

  Future<void> setTempHp(CharacterEntity c, int amount) async {
    await saveCharacter(c.copyWith(tempHp: amount.clamp(0, 999999)));
  }

  Future<void> addWeapon(CharacterEntity c, Weapon weapon) async {
    await saveCharacter(c.copyWith(weapons: [...c.weapons, weapon]));
  }

  Future<void> removeWeapon(CharacterEntity c, String weaponId) async {
    await saveCharacter(c.copyWith(weapons: c.weapons.where((w) => w.id != weaponId).toList()));
  }

  Future<void> addSpell(CharacterEntity c, KnownSpell spell) async {
    await saveCharacter(c.copyWith(knownSpells: [...c.knownSpells, spell]));
  }

  Future<void> removeSpell(CharacterEntity c, String spellId) async {
    await saveCharacter(c.copyWith(knownSpells: c.knownSpells.where((s) => s.id != spellId).toList()));
  }

  Future<void> toggleSpellPrepared(CharacterEntity c, String spellId) async {
    final updated = c.knownSpells.map((s) => s.id == spellId ? s.copyWith(prepared: !s.prepared) : s).toList();
    await saveCharacter(c.copyWith(knownSpells: updated));
  }

  Future<void> addFeat(CharacterEntity c, String featId) async {
    if (c.feats.contains(featId)) return;
    await saveCharacter(c.copyWith(feats: [...c.feats, featId]));
  }

  Future<void> removeFeat(CharacterEntity c, String featId) async {
    await saveCharacter(c.copyWith(feats: c.feats.where((f) => f != featId).toList()));
  }

  Future<void> addMetamagic(CharacterEntity c, String optionId) async {
    if (c.metamagicOptions.contains(optionId)) return;
    await saveCharacter(c.copyWith(metamagicOptions: [...c.metamagicOptions, optionId]));
  }

  Future<void> removeMetamagic(CharacterEntity c, String optionId) async {
    await saveCharacter(c.copyWith(metamagicOptions: c.metamagicOptions.where((m) => m != optionId).toList()));
  }

  Future<void> setSubclassChoice(CharacterEntity c, String choiceId) async {
    await saveCharacter(c.copyWith(subclassChoiceId: c.subclassChoiceId == choiceId ? '' : choiceId));
  }

  Future<void> addBeastForm(CharacterEntity c, String name) async {
    if (name.trim().isEmpty) return;
    await saveCharacter(c.copyWith(knownBeastForms: [...c.knownBeastForms, name.trim()]));
  }

  Future<void> removeBeastForm(CharacterEntity c, String name) async {
    await saveCharacter(c.copyWith(knownBeastForms: c.knownBeastForms.where((f) => f != name).toList()));
  }

  Future<void> setFightingStyle(CharacterEntity c, String styleId) async {
    await saveCharacter(c.copyWith(fightingStyleId: c.fightingStyleId == styleId ? '' : styleId));
  }

  Future<void> addManeuver(CharacterEntity c, String maneuverId) async {
    if (c.maneuvers.contains(maneuverId)) return;
    await saveCharacter(c.copyWith(maneuvers: [...c.maneuvers, maneuverId]));
  }

  Future<void> removeManeuver(CharacterEntity c, String maneuverId) async {
    await saveCharacter(c.copyWith(maneuvers: c.maneuvers.where((m) => m != maneuverId).toList()));
  }
}
