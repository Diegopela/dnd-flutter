import 'package:flutter/material.dart';
import '../theme/colors.dart';

class HpAcBar extends StatelessWidget {
  final int currentHp;
  final int maxHp;
  final int tempHp;
  final int armorClass;
  final void Function(int amount) onDamage;
  final void Function(int amount) onHeal;
  final void Function(int amount) onSetTempHp;

  const HpAcBar({
    super.key,
    required this.currentHp,
    required this.maxHp,
    required this.tempHp,
    required this.armorClass,
    required this.onDamage,
    required this.onHeal,
    required this.onSetTempHp,
  });

  Color _hpColor() {
    if (maxHp <= 0 || currentHp <= maxHp / 4) return dangerRed;
    if (currentHp <= maxHp / 2) return const Color(0xFFCC8A1E);
    return const Color(0xFF3E9B4F);
  }

  Future<void> _showAmountDialog(BuildContext context, String title, void Function(int) onConfirm, {int initial = 0}) async {
    final controller = TextEditingController(text: initial > 0 ? '$initial' : '');
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Cantidad'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          TextButton(
            onPressed: () {
              onConfirm(int.tryParse(controller.text) ?? 0);
              Navigator.pop(ctx);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: surfaceDark, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Puntos de Golpe', style: Theme.of(context).textTheme.labelMedium),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$currentHp', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: _hpColor())),
                  Text(' / $maxHp', style: Theme.of(context).textTheme.bodyMedium),
                  if (tempHp > 0)
                    Text('  +$tempHp temp', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: arcaneBlue)),
                ],
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                children: [
                  OutlinedButton(
                    onPressed: () => _showAmountDialog(context, 'Recibir daño', onDamage),
                    child: const Text('Daño'),
                  ),
                  OutlinedButton(
                    onPressed: () => _showAmountDialog(context, 'Curar', onHeal),
                    child: const Text('Curar'),
                  ),
                  OutlinedButton(
                    onPressed: () => _showAmountDialog(context, 'Establecer PV temporales', onSetTempHp, initial: tempHp),
                    child: const Text('PV temp'),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CA', style: Theme.of(context).textTheme.labelMedium),
              Text('$armorClass', style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ],
      ),
    );
  }
}
