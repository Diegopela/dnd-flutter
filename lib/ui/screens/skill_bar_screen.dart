import '../../models/class_definitions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/character.dart';
import '../../models/enums.dart';
import '../../models/spell.dart';
import '../../models/weapon.dart';
import '../../data/class_repository.dart';
import '../../data/subclass_repository.dart';
import '../../data/race_repository.dart';
import '../../data/background_repository.dart';
import '../../data/spell_slot_tables.dart';
import '../../data/spellcasting_progression.dart';
import '../../data/skill_repository.dart';
import '../../data/spell_repository.dart';
import '../../data/feat_repository.dart';
import '../../data/metamagic_repository.dart';
import '../../data/maneuver_repository.dart';
import '../../data/fighting_style_repository.dart';
import '../../data/subclass_choice_repository.dart';
import '../../data/wild_shape_rules.dart';
import '../../providers/character_provider.dart';
import '../../util/calculations.dart';
import '../theme/colors.dart';
import '../widgets/hp_ac_bar.dart';
import '../widgets/info_chip.dart';
import '../widgets/saving_throws_row.dart';
import '../widgets/skill_list_widget.dart';
import '../widgets/spell_slot_tracker.dart';
import '../widgets/resource_pool_tracker.dart';
import '../widgets/feature_list.dart';
import '../widgets/attack_bar.dart';
import '../widgets/race_trait_list.dart';

class SkillBarScreen extends StatelessWidget {
  final String characterId;
  final VoidCallback onBack;
  final void Function(String id) onEdit;

  const SkillBarScreen({super.key, required this.characterId, required this.onBack, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final c = context.watch<CharacterProvider>().byId(characterId);
    if (c == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return _SkillBarBody(character: c, onBack: onBack, onEdit: onEdit);
  }
}

class _SkillBarBody extends StatefulWidget {
  final CharacterEntity character;
  final VoidCallback onBack;
  final void Function(String id) onEdit;

  const _SkillBarBody({required this.character, required this.onBack, required this.onEdit});

  @override
  State<_SkillBarBody> createState() => _SkillBarBodyState();
}

class _SkillBarBodyState extends State<_SkillBarBody> {
  @override
  Widget build(BuildContext context) {
    final c = widget.character;
    final provider = context.read<CharacterProvider>();
    final classDef = ClassRepository.get(c.dndClass);
    final subclassDef = SubclassRepository.byId(c.subclassId);
    final raceDef = RaceRepository.byId(c.raceId);
    final subraceDef = raceDef?.subraces.where((s) => s.id == c.subraceId).firstOrNull;
    final profBonus = ProficiencyTable.bonusForLevel(c.level);
    final maxSpellSlots = SpellSlotTables.slotsFor(classDef.casterType, c.level);
    final saveDC = Calculations.spellSaveDC(classDef.spellcastingAbility, c.abilities, profBonus);
    final spellAtk = Calculations.spellAttackBonus(classDef.spellcastingAbility, c.abilities, profBonus);
    final raceLabel = raceDef == null ? null : (subraceDef?.name ?? raceDef.name);
    final classLabel = subclassDef == null ? c.dndClass.display : '${c.dndClass.display} (${subclassDef.name})';
    final hasBattleMaster = c.subclassId == 'battle_master';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${c.name} · Nv ${c.level}', style: const TextStyle(fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('$classLabel${raceLabel != null ? " · $raceLabel" : ""}', style: const TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
        actions: [
          TextButton(onPressed: () => widget.onEdit(c.id), child: const Text('Editar')),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HpAcBar(
              currentHp: c.currentHp,
              maxHp: c.maxHp,
              tempHp: c.tempHp,
              armorClass: c.armorClass,
              onDamage: (amount) => provider.applyDamage(c, amount),
              onHeal: (amount) => provider.applyHeal(c, amount),
              onSetTempHp: (amount) => provider.setTempHp(c, amount),
            ),
            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                InfoChip(label: 'Bono competencia', value: Calculations.modifierString(profBonus)),
                if (classDef.spellcastingAbility != null) ...[
                  const SizedBox(width: 20),
                  InfoChip(label: 'Característica Mágica', value: classDef.spellcastingAbility!.display),
                ],
                if (saveDC != null) ...[
                  const SizedBox(width: 20),
                  InfoChip(label: 'CD salvación', value: '$saveDC'),
                ],
                if (spellAtk != null) ...[
                  const SizedBox(width: 20),
                  InfoChip(label: 'Ataque conjuro', value: Calculations.modifierString(spellAtk)),
                ],
                if (raceDef != null) ...[
                  const SizedBox(width: 20),
                  InfoChip(label: 'Velocidad', value: '${raceDef.speed} m'),
                ],
                if (SpellcastingProgression.cantripsKnown(c.dndClass, c.level) > 0) ...[
                  const SizedBox(width: 20),
                  InfoChip(
                    label: 'Trucos',
                    value: '${SpellcastingProgression.cantripsKnown(c.dndClass, c.level, raceBonus: (c.raceId == "elf" && c.subraceId == "elf_high") ? 1 : 0)}',
                  ),
                ],
                if (classDef.casterType != CasterType.none) ...[
                  const SizedBox(width: 20),
                  InfoChip(
                    label: SpellcastingProgression.isPreparedCaster(c.dndClass) ? 'Conjuros a preparar' : 'Conjuros conocidos',
                    value: '${SpellcastingProgression.spellsKnownOrPrepared(c.dndClass, c.level, classDef.spellcastingAbility != null ? c.abilities.modifier(classDef.spellcastingAbility!) : 0)}',
                  ),
                ],
              ]),
            ),
            const SizedBox(height: 20),

            if (c.backgroundId.isNotEmpty) _buildBackground(context, c),

            _sectionTitle(context, 'Salvaciones'),
            SavingThrowsRow(
              abilities: c.abilities,
              proficiencyBonus: profBonus,
              proficientSaves: SkillRepository.savingThrowProficiencies[c.dndClass] ?? const {},
            ),
            const SizedBox(height: 20),

            _sectionTitle(context, 'Habilidades (tocá para ciclar: competente → pericia → nada)'),
            SkillListWidget(
              skills: SkillRepository.skills,
              abilities: c.abilities,
              proficiencyBonus: profBonus,
              proficient: c.skillProficiencies,
              expertise: c.skillExpertise,
              onCycle: (skillId) => provider.cycleSkillProficiency(c, skillId),
            ),
            const SizedBox(height: 20),

            Row(children: [
              OutlinedButton(onPressed: () => provider.shortRest(c), child: const Text('Descanso corto')),
              const SizedBox(width: 12),
              FilledButton(onPressed: () => provider.longRest(c), child: const Text('Descanso largo')),
            ]),
            const SizedBox(height: 20),

            if (classDef.casterType != CasterType.none) _buildPreparedSection(context, c),

            if (classDef.casterType == CasterType.full || classDef.casterType == CasterType.half) ...[
              _sectionTitle(context, 'Espacios de conjuro'),
              SpellSlotTracker(
                maxSlotsPerLevel: maxSpellSlots,
                usedSlotsPerLevel: c.usedSpellSlots,
                onToggle: (level, consume) => provider.toggleSpellSlot(c, level, consume),
              ),
              const SizedBox(height: 20),
            ],

            if (classDef.casterType == CasterType.pact) _buildPactSlots(context, c),

            if (classDef.resources.isNotEmpty || hasBattleMaster) _buildClassResources(context, c, classDef, hasBattleMaster),

            if (FightingStyleRepository.levelGrantedAt(c.dndClass) != null &&
                c.level >= FightingStyleRepository.levelGrantedAt(c.dndClass)!) _buildFightingStyle(context, c),

            if (hasBattleMaster) Padding(padding: const EdgeInsets.only(bottom: 20), child: _buildManeuvers(context, c)),

            _sectionTitle(context, 'Ataques'),
            AttackBar(
              weapons: c.weapons,
              abilities: c.abilities,
              proficiencyBonus: profBonus,
              onRemoveWeapon: (weaponId) => provider.removeWeapon(c, weaponId),
            ),
            TextButton(onPressed: () => _showAddWeapon(context, c), child: const Text('+ Agregar arma')),
            const SizedBox(height: 20),

            _buildFeats(context, c),

            if (c.dndClass == DndClass.sorcerer && c.level >= 3) _buildMetamagic(context, c),

            _buildSubclassChoice(context, c),

            if (c.dndClass == DndClass.druid && c.level >= 2) _buildWildShape(context, c),

            if (raceDef != null) ...[
              _sectionTitle(context, 'Rasgos raciales ($raceLabel)'),
              RaceTraitList(
                traits: [...raceDef.traits, ...?subraceDef?.traits],
                activeToggles: c.activeFeatureToggles,
                onToggleTrait: (id) => provider.toggleFeature(c, id),
              ),
              const SizedBox(height: 20),
            ],

            _sectionTitle(context, 'Rasgos de clase ($classLabel)'),
            Builder(builder: (context) {
              final allFeatures = [...classDef.features, ...?subclassDef?.features]
                  .where((f) => c.level >= f.levelAcquired)
                  .toList()
                ..sort((a, b) => a.levelAcquired.compareTo(b.levelAcquired));
              return FeatureList(
                features: allFeatures
                    .map((f) => FeatureRow(id: f.id, name: f.name, description: f.description, isToggle: f.isToggle))
                    .toList(),
                activeToggles: c.activeFeatureToggles,
                onToggleFeature: (id) => provider.toggleFeature(c, id),
              );
            }),
            const SizedBox(height: 20),

            if (classDef.casterType != CasterType.none) _buildKnownSpells(context, c),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );

  Widget _selectableRow({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: isSelected ? arcaneBlue.withValues(alpha: 0.25) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('$title${isSelected ? "  ✓" : ""}', style: Theme.of(context).textTheme.bodyMedium),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context, CharacterEntity c) {
    String name;
    String desc;
    if (c.backgroundId == 'custom' && c.customBackgroundText.isNotEmpty) {
      name = 'Personalizado';
      desc = c.customBackgroundText;
    } else {
      final bg = BackgroundRepository.byId(c.backgroundId);
      if (bg == null) return const SizedBox.shrink();
      name = bg.name;
      desc = '${bg.featureName}: ${bg.summary}';
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Trasfondo: $name'),
        Text(desc, style: Theme.of(context).textTheme.bodySmall),
      ]),
    );
  }

  Widget _buildPreparedSection(BuildContext context, CharacterEntity c) {
    final preparedList = c.knownSpells.where((s) => s.level == 0 || s.prepared).toList()
      ..sort((a, b) => a.level.compareTo(b.level));
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Preparados para combate (tocá para ver qué hace)'),
        if (preparedList.isEmpty)
          Text('Ninguno marcado como preparado todavía.', style: Theme.of(context).textTheme.bodySmall)
        else
          ...preparedList.map((s) => InkWell(
                onTap: () => _showSpellDetail(context, s),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '${s.level == 0 ? "Truco" : "Nv ${s.level}"} · ${s.name}${s.concentration ? " (Conc.)" : ""}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )),
      ]),
    );
  }

  Widget _buildPactSlots(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final entry = SpellSlotTables.warlockPact[(c.level - 1).clamp(0, 19)];
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Espacios de Pacto (nivel ${entry[1]}, recargan en descanso corto)'),
        ResourcePoolTracker(
          label: 'Espacios de Pacto',
          max: entry[0],
          used: c.usedPactSlots,
          onToggle: (consume) => provider.togglePactSlot(c, consume),
        ),
      ]),
    );
  }

  Widget _buildClassResources(BuildContext context, CharacterEntity c, ClassDefinition classDef, bool hasBattleMaster) {
    final provider = context.read<CharacterProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Recursos de clase'),
        ...classDef.resources.where((r) => c.level >= r.levelAvailableFrom).map<Widget>((r) {
          final abilityMod = r.relatedAbility != null ? c.abilities.modifier(r.relatedAbility!) : 0;
          final max = r.maxAmount(c.level, abilityMod);
          final used = c.usedResources[r.id] ?? 0;
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ResourcePoolTracker(
                label: '${r.name} · recarga: ${r.rechargeOn.display}',
                max: max,
                used: used,
                onToggle: (consume) => provider.toggleResource(c, r.id, max, consume),
              ),
              if (r.id == 'sorcery_points')
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: surfaceDark, borderRadius: BorderRadius.circular(8)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Fuente de Magia — conversión de referencia', style: Theme.of(context).textTheme.labelMedium),
                      Text('Crear espacio con puntos: Nv1 = 2 · Nv2 = 3 · Nv3 = 5 · Nv4 = 6 · Nv5 = 7', style: Theme.of(context).textTheme.bodySmall),
                      Text('Convertir espacio en puntos: ganás puntos = nivel del espacio gastado', style: Theme.of(context).textTheme.bodySmall),
                    ]),
                  ),
                ),
            ]),
          );
        }),
        if (hasBattleMaster) Builder(builder: (context) {
          final maxDice = ManeuverRepository.superiorityDiceCount(c.level);
          final dieSize = ManeuverRepository.superiorityDieSize(c.level);
          final used = c.usedResources['superiority_dice'] ?? 0;
          return ResourcePoolTracker(
            label: 'Dados de Superioridad ($dieSize) · recarga: Descanso corto',
            max: maxDice,
            used: used,
            onToggle: (consume) => provider.toggleResource(c, 'superiority_dice', maxDice, consume),
          );
        }),
      ]),
    );
  }

  Widget _buildFightingStyle(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Estilo de Combate'),
        ...FightingStyleRepository.all.map((style) => _selectableRow(
              context: context,
              title: style.name,
              subtitle: style.summary,
              isSelected: c.fightingStyleId == style.id,
              onTap: () => provider.setFightingStyle(c, style.id),
            )),
      ]),
    );
  }

  Widget _buildFeats(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Dotes'),
        ...c.feats.map((id) => FeatRepository.byId(id)).whereType<Object>().map((f) {
          final feat = f as dynamic;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(feat.name, style: Theme.of(context).textTheme.bodyMedium),
                  Text(feat.summary, style: Theme.of(context).textTheme.bodySmall),
                ]),
              ),
              TextButton(onPressed: () => provider.removeFeat(c, feat.id), child: const Text('Quitar')),
            ]),
          );
        }),
        TextButton(onPressed: () => _showAddFeat(context, c), child: const Text('+ Agregar dote')),
      ]),
    );
  }

  Widget _buildMetamagic(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final maxKnown = MetamagicRepository.knownAtLevel(c.level);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Metamagia (${c.metamagicOptions.length}/$maxKnown conocidas)'),
        ...c.metamagicOptions.map((id) => MetamagicRepository.byId(id)).whereType<Object>().map((o) {
          final opt = o as dynamic;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${opt.name} · ${opt.cost}', style: Theme.of(context).textTheme.bodyMedium),
                  Text(opt.summary, style: Theme.of(context).textTheme.bodySmall),
                ]),
              ),
              TextButton(onPressed: () => provider.removeMetamagic(c, opt.id), child: const Text('Quitar')),
            ]),
          );
        }),
        TextButton(onPressed: () => _showAddMetamagic(context, c), child: const Text('+ Elegir metamagia')),
      ]),
    );
  }

  Widget _buildSubclassChoice(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final options = SubclassChoiceRepository.optionsFor(c.subclassId);
    if (options.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Espíritu Totémico'),
        ...options.map((opt) => _selectableRow(
              context: context,
              title: opt.name,
              subtitle: opt.summary,
              isSelected: c.subclassChoiceId == opt.id,
              onTap: () => provider.setSubclassChoice(c, opt.id),
            )),
      ]),
    );
  }

  Widget _buildWildShape(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Forma Salvaje — límite: ${WildShapeRules.maxChallengeRating(c.level)}'),
        ...c.knownBeastForms.map((formName) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formName, style: Theme.of(context).textTheme.bodyMedium),
                TextButton(onPressed: () => provider.removeBeastForm(c, formName), child: const Text('Quitar')),
              ],
            )),
        TextButton(onPressed: () => _showAddBeastForm(context, c), child: const Text('+ Guardar forma conocida')),
      ]),
    );
  }

  Widget _buildManeuvers(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final knownCount = ManeuverRepository.knownAtLevel(c.level);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionTitle(context, 'Maniobras (${c.maneuvers.length}/$knownCount conocidas)'),
      ...c.maneuvers.map((id) => ManeuverRepository.byId(id)).whereType<Object>().map((m0) {
        final m = m0 as dynamic;
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(m.name, style: Theme.of(context).textTheme.bodyMedium),
                Text(m.summary, style: Theme.of(context).textTheme.bodySmall),
              ]),
            ),
            TextButton(onPressed: () => provider.removeManeuver(c, m.id), child: const Text('Quitar')),
          ]),
        );
      }),
      TextButton(onPressed: () => _showAddManeuver(context, c), child: const Text('+ Elegir maniobra')),
    ]);
  }

  Widget _buildKnownSpells(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final sorted = List<KnownSpell>.from(c.knownSpells)..sort((a, b) => a.level.compareTo(b.level));
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionTitle(context, 'Hechizos conocidos (tocá "Marcar preparado" para elegir cuáles usás en combate)'),
        ...sorted.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${s.level == 0 ? "Truco" : "Nv ${s.level}"} · ${s.name}${s.concentration ? " (Conc.)" : ""}${s.ritual ? " (Ritual)" : ""}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(children: [
                  if (s.level > 0)
                    TextButton(
                      onPressed: () => provider.toggleSpellPrepared(c, s.id),
                      child: Text(s.prepared ? '✓ Preparado' : 'Marcar preparado'),
                    ),
                  TextButton(onPressed: () => provider.removeSpell(c, s.id), child: const Text('Quitar')),
                ]),
              ]),
            )),
        TextButton(onPressed: () => _showAddSpell(context, c), child: const Text('+ Agregar hechizo conocido')),
      ]),
    );
  }

  // ---------------- Diálogos ----------------

  void _showSpellDetail(BuildContext context, KnownSpell spell) {
    final catalogEntry = SpellRepository.all.where((s) => s.name == spell.name).firstOrNull;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(spell.name),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${spell.level == 0 ? "Truco" : "Nivel ${spell.level}"}'
            '${catalogEntry != null ? " · ${catalogEntry.school}" : ""}'
            '${spell.concentration ? " · Concentración" : ""}'
            '${spell.ritual ? " · Ritual" : ""}',
            style: Theme.of(ctx).textTheme.labelMedium,
          ),
          const SizedBox(height: 6),
          if (catalogEntry?.damage != null) ...[
            Text('Daño: ${catalogEntry!.damage}', style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(color: parchmentGold)),
            const SizedBox(height: 6),
          ],
          Text(catalogEntry?.summary ?? 'Sin descripción guardada para este hechizo.'),
        ]),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cerrar'))],
      ),
    );
  }

  void _showAddWeapon(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    Weapon selected = WeaponPresets.presets.first;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setDialogState) {
        return AlertDialog(
          title: const Text('Agregar arma'),
          content: DropdownButton<Weapon>(
            value: selected,
            isExpanded: true,
            items: WeaponPresets.presets.map((w) => DropdownMenuItem(value: w, child: Text(w.name))).toList(),
            onChanged: (v) => setDialogState(() => selected = v!),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
            TextButton(
              onPressed: () {
                provider.addWeapon(c, selected.copyWith(id: '${selected.id}_${DateTime.now().millisecondsSinceEpoch}'));
                Navigator.pop(ctx);
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      }),
    );
  }

  void _showAddFeat(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    String query = '';
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setDialogState) {
        final filtered = FeatRepository.all
            .where((f) => !c.feats.contains(f.id) && f.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return AlertDialog(
          title: const Text('Agregar dote'),
          content: SizedBox(
            width: double.maxFinite,
            height: 420,
            child: Column(children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Buscar...'),
                onChanged: (v) => setDialogState(() => query = v),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final feat = filtered[i];
                    return ListTile(
                      title: Text(feat.name + (feat.prerequisite.isNotEmpty ? ' (req: ${feat.prerequisite})' : '')),
                      subtitle: Text(feat.summary),
                      onTap: () {
                        provider.addFeat(c, feat.id);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ]),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cerrar'))],
        );
      }),
    );
  }

  void _showAddMetamagic(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final maxAllowed = MetamagicRepository.knownAtLevel(c.level);
    final canAddMore = c.metamagicOptions.length < maxAllowed;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Elegir Metamagia (${c.metamagicOptions.length}/$maxAllowed)'),
        content: SizedBox(
          width: double.maxFinite,
          height: 420,
          child: Column(children: [
            if (!canAddMore) const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('Ya elegiste el máximo de opciones para tu nivel.')),
            Expanded(
              child: ListView(
                children: MetamagicRepository.all.where((o) => !c.metamagicOptions.contains(o.id)).map((opt) {
                  return ListTile(
                    title: Text('${opt.name} · ${opt.cost}'),
                    subtitle: Text(opt.summary),
                    onTap: canAddMore
                        ? () {
                            provider.addMetamagic(c, opt.id);
                            Navigator.pop(ctx);
                          }
                        : null,
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cerrar'))],
      ),
    );
  }

  void _showAddManeuver(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final maxAllowed = ManeuverRepository.knownAtLevel(c.level);
    final canAddMore = c.maneuvers.length < maxAllowed;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Elegir Maniobra (${c.maneuvers.length}/$maxAllowed)'),
        content: SizedBox(
          width: double.maxFinite,
          height: 420,
          child: Column(children: [
            if (!canAddMore) const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('Ya elegiste el máximo de maniobras para tu nivel.')),
            Expanded(
              child: ListView(
                children: ManeuverRepository.all.where((m) => !c.maneuvers.contains(m.id)).map((m) {
                  return ListTile(
                    title: Text(m.name),
                    subtitle: Text(m.summary),
                    onTap: canAddMore
                        ? () {
                            provider.addManeuver(c, m.id);
                            Navigator.pop(ctx);
                          }
                        : null,
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cerrar'))],
      ),
    );
  }

  void _showAddBeastForm(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Guardar forma de bestia'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Nombre (ej. Lobo, Oso Pardo, Águila Gigante)')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          TextButton(
            onPressed: () {
              provider.addBeastForm(c, ctrl.text);
              Navigator.pop(ctx);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  void _showAddSpell(BuildContext context, CharacterEntity c) {
    final provider = context.read<CharacterProvider>();
    var available = SpellRepository.forClass(c.dndClass);
    if (c.subclassId == 'divine_soul') {
      final merged = {...available, ...SpellRepository.forClass(DndClass.cleric)}.toList();
      merged.sort((a, b) => a.level != b.level ? a.level.compareTo(b.level) : a.name.compareTo(b.name));
      available = merged;
    }
    String query = '';
    int? levelFilter;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setDialogState) {
        var filtered = available.where((s) => s.name.toLowerCase().contains(query.toLowerCase()));
        if (levelFilter != null) filtered = filtered.where((s) => s.level == levelFilter);
        final filteredList = filtered.toList();

        return AlertDialog(
          title: const Text('Agregar hechizo'),
          content: SizedBox(
            width: double.maxFinite,
            height: 480,
            child: Column(children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Buscar...'),
                onChanged: (v) => setDialogState(() => query = v),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _levelChip(ctx, 'Todos', null, levelFilter, (v) => setDialogState(() => levelFilter = v)),
                    _levelChip(ctx, 'Truco', 0, levelFilter, (v) => setDialogState(() => levelFilter = v)),
                    for (var lvl = 1; lvl <= 9; lvl++)
                      _levelChip(ctx, 'Nv$lvl', lvl, levelFilter, (v) => setDialogState(() => levelFilter = v)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, i) {
                    final spell = filteredList[i];
                    return ListTile(
                      title: Text('${spell.level == 0 ? "Truco" : "Nv ${spell.level}"} · ${spell.name}${spell.concentration ? " (Conc.)" : ""}${spell.ritual ? " (Ritual)" : ""}'),
                      subtitle: Text(spell.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                      onTap: () {
                        provider.addSpell(
                          c,
                          KnownSpell(
                            id: '${spell.id}_${DateTime.now().millisecondsSinceEpoch}',
                            name: spell.name,
                            level: spell.level,
                            prepared: spell.level == 0,
                            concentration: spell.concentration,
                            ritual: spell.ritual,
                          ),
                        );
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ]),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cerrar'))],
        );
      }),
    );
  }

  Widget _levelChip(BuildContext context, String label, int? value, int? current, void Function(int?) onSelect) {
    final selected = current == value;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ChoiceChip(label: Text(label), selected: selected, onSelected: (_) => onSelect(value)),
    );
  }
}
