import '../../models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/character.dart';
import '../../providers/character_provider.dart';
import '../theme/colors.dart';

class CharacterListScreen extends StatelessWidget {
  final void Function(String id) onOpenCharacter;
  final VoidCallback onCreateCharacter;

  const CharacterListScreen({super.key, required this.onOpenCharacter, required this.onCreateCharacter});

  Future<void> _confirmDelete(BuildContext context, CharacterEntity c) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('¿Eliminar a ${c.name}?'),
        content: const Text('Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Eliminar')),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await context.read<CharacterProvider>().deleteCharacter(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    final characters = context.watch<CharacterProvider>().characters;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis personajes')),
      floatingActionButton: FloatingActionButton(onPressed: onCreateCharacter, child: const Icon(Icons.add)),
      body: characters.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('Todavía no cargaste ningún personaje. Tocá + para crear el primero.', textAlign: TextAlign.center),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: characters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final c = characters[i];
                return Material(
                  color: surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => onOpenCharacter(c.id),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(c.name, style: Theme.of(context).textTheme.titleMedium),
                              Text('${c.dndClass.display} · Nivel ${c.level}', style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _confirmDelete(context, c),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
