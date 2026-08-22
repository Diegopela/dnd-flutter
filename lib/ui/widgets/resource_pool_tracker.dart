import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ResourcePoolTracker extends StatelessWidget {
  final String label;
  final int max;
  final int used;
  final void Function(bool consume) onToggle;

  const ResourcePoolTracker({
    super.key,
    required this.label,
    required this.max,
    required this.used,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (max <= 0) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label ($max - $used = ${max - used})', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        Wrap(
          spacing: 6,
          children: List.generate(max, (i) {
            final isUsed = i < used;
            return GestureDetector(
              onTap: () => onToggle(!isUsed),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isUsed ? slotEmpty : arcaneBlue,
                  shape: BoxShape.circle,
                  border: Border.all(color: arcaneBlue, width: 1),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
