import 'package:flutter/material.dart';
import '../theme/colors.dart';

class FeatureRow {
  final String id;
  final String name;
  final String description;
  final bool isToggle;
  const FeatureRow({required this.id, required this.name, required this.description, required this.isToggle});
}

class FeatureList extends StatelessWidget {
  final List<FeatureRow> features;
  final Set<String> activeToggles;
  final void Function(String id) onToggleFeature;

  const FeatureList({
    super.key,
    required this.features,
    required this.activeToggles,
    required this.onToggleFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: features.map((f) {
        final isActive = activeToggles.contains(f.id);
        final bg = (f.isToggle && isActive) ? arcaneBlue : surfaceDark;
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Material(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: f.isToggle ? () => onToggleFeature(f.id) : null,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f.name, style: Theme.of(context).textTheme.bodyMedium),
                          Text(f.description, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    if (f.isToggle) Text(isActive ? 'ON' : 'off', style: Theme.of(context).textTheme.labelSmall),
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
