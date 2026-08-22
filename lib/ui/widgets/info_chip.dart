import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const InfoChip({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall, maxLines: 1, softWrap: false),
          Text(value, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, softWrap: false),
        ],
      ),
    );
  }
}
