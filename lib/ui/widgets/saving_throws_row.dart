import 'package:flutter/material.dart';
import '../../models/character.dart';
import '../../models/enums.dart';
import '../../util/calculations.dart';
import '../theme/colors.dart';

class SavingThrowsRow extends StatelessWidget {
  final AbilityScores abilities;
  final int proficiencyBonus;
  final Set<Ability> proficientSaves;

  const SavingThrowsRow({
    super.key,
    required this.abilities,
    required this.proficiencyBonus,
    required this.proficientSaves,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Ability.values.map((ability) {
          final isProficient = proficientSaves.contains(ability);
          final bonus = abilities.modifier(ability) + (isProficient ? proficiencyBonus : 0);
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              constraints: const BoxConstraints(minWidth: 62),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: isProficient ? arcaneBlue.withValues(alpha: 0.25) : surfaceDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(ability.short, style: Theme.of(context).textTheme.labelSmall, maxLines: 1),
                  Text(Calculations.modifierString(bonus), style: Theme.of(context).textTheme.titleMedium, maxLines: 1),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
