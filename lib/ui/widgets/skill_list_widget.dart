import '../../models/enums.dart';
import 'package:flutter/material.dart';
import '../../data/skill_repository.dart';
import '../../models/character.dart';
import '../../util/calculations.dart';
import '../theme/colors.dart';

class SkillListWidget extends StatelessWidget {
  final List<SkillDef> skills;
  final AbilityScores abilities;
  final int proficiencyBonus;
  final Set<String> proficient;
  final Set<String> expertise;
  final void Function(String skillId) onCycle;

  const SkillListWidget({
    super.key,
    required this.skills,
    required this.abilities,
    required this.proficiencyBonus,
    required this.proficient,
    required this.expertise,
    required this.onCycle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: skills.map((skill) {
        final isExpertise = expertise.contains(skill.id);
        final isProficient = proficient.contains(skill.id) || isExpertise;
        final bonus = abilities.modifier(skill.ability) +
            (isExpertise ? proficiencyBonus * 2 : (isProficient ? proficiencyBonus : 0));
        final bg = isExpertise
            ? parchmentGold.withValues(alpha: 0.25)
            : (isProficient ? arcaneBlue.withValues(alpha: 0.25) : surfaceDark);
        final statusText = isExpertise ? ' · Pericia' : (isProficient ? ' · Competente' : '');
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Material(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onCycle(skill.id),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(skill.name, style: Theme.of(context).textTheme.bodyMedium),
                        Text('${skill.ability.display}$statusText', style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    Text(Calculations.modifierString(bonus), style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
