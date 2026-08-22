import 'package:flutter/material.dart';
import '../../models/race_definitions.dart';
import '../theme/colors.dart';

class RaceTraitList extends StatelessWidget {
  final List<RaceTrait> traits;
  final Set<String> activeToggles;
  final void Function(String id) onToggleTrait;

  const RaceTraitList({
    super.key,
    required this.traits,
    required this.activeToggles,
    required this.onToggleTrait,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: traits.map((rt) {
        final isActive = activeToggles.contains(rt.id);
        final bg = rt.isToggle && isActive ? arcaneBlue : surfaceDark;
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Material(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: rt.isToggle ? () => onToggleTrait(rt.id) : null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(rt.name, style: Theme.of(context).textTheme.bodyMedium),
                          Text(rt.description, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    if (rt.isToggle) Text(isActive ? 'ON' : 'off', style: Theme.of(context).textTheme.labelSmall),
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
