import 'package:flutter/material.dart';
import '../../models/character.dart';
import '../../models/weapon.dart';
import '../../util/calculations.dart';
import '../../util/dice_roller.dart';
import '../theme/colors.dart';

class AttackBar extends StatefulWidget {
  final List<Weapon> weapons;
  final AbilityScores abilities;
  final int proficiencyBonus;
  final void Function(String weaponId) onRemoveWeapon;

  const AttackBar({
    super.key,
    required this.weapons,
    required this.abilities,
    required this.proficiencyBonus,
    required this.onRemoveWeapon,
  });

  @override
  State<AttackBar> createState() => _AttackBarState();
}

class _AttackBarState extends State<AttackBar> {
  String? lastResult;

  Future<void> _confirmRemove(Weapon w) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('¿Quitar ${w.name}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Quitar')),
        ],
      ),
    );
    if (confirmed == true) widget.onRemoveWeapon(w.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lastResult != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(lastResult!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: parchmentGold)),
          ),
        Text('Tocá para atacar · mantené presionado para quitar', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 6),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.weapons.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final weapon = widget.weapons[i];
              final hitBonus = Calculations.attackBonus(weapon, widget.abilities, widget.proficiencyBonus);
              final dmgFormula = Calculations.damageFormula(weapon, widget.abilities);
              return GestureDetector(
                onTap: () {
                  final roll = DiceRoller.rollD20();
                  final total = roll + hitBonus;
                  final dmgRoll = DiceRoller.rollDiceFormula(weapon.damageDice) + Calculations.damageBonus(weapon, widget.abilities);
                  final critText = roll == 20 ? ' ¡CRÍTICO!' : (roll == 1 ? ' (pifia)' : '');
                  setState(() {
                    lastResult = '${weapon.name}: ataque $roll${Calculations.modifierString(hitBonus)} = $total$critText · daño: $dmgRoll';
                  });
                },
                onLongPress: () => _confirmRemove(weapon),
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: surfaceDark, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(weapon.name, style: Theme.of(context).textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text('Ataque: ${Calculations.modifierString(hitBonus)}', style: Theme.of(context).textTheme.bodySmall),
                      Text(dmgFormula, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
