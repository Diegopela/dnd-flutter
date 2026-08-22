import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SpellSlotTracker extends StatelessWidget {
  final List<int> maxSlotsPerLevel;
  final List<int> usedSlotsPerLevel;
  final void Function(int level, bool consume) onToggle;

  const SpellSlotTracker({
    super.key,
    required this.maxSlotsPerLevel,
    required this.usedSlotsPerLevel,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var levelIdx = 0; levelIdx < 9; levelIdx++) {
      final max = levelIdx < maxSlotsPerLevel.length ? maxSlotsPerLevel[levelIdx] : 0;
      if (max <= 0) continue;
      final used = levelIdx < usedSlotsPerLevel.length ? usedSlotsPerLevel[levelIdx] : 0;
      rows.add(Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            SizedBox(width: 44, child: Text('Nv ${levelIdx + 1}', style: Theme.of(context).textTheme.labelMedium)),
            ...List.generate(max, (pipIndex) {
              final isUsed = pipIndex < used;
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () => onToggle(levelIdx + 1, !isUsed),
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: isUsed ? slotEmpty : slotFilled,
                      shape: BoxShape.circle,
                      border: Border.all(color: slotFilled, width: 1),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }
}
