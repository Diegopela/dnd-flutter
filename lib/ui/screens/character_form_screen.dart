import '../../models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/character.dart';
import '../../models/enums.dart';
import '../../data/race_repository.dart';
import '../../data/subclass_repository.dart';
import '../../data/background_repository.dart';
import '../../providers/character_provider.dart';

/// Wrapper que busca el personaje por id en el provider y arma la pantalla
/// en modo edición (usado desde main.dart para no acoplar la navegación
/// al provider directamente).
class CharacterFormScreenFromProvider extends StatelessWidget {
  final String characterId;
  final void Function(String id) onSaved;

  const CharacterFormScreenFromProvider({super.key, required this.characterId, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    final existing = context.watch<CharacterProvider>().byId(characterId);
    if (existing == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return CharacterFormScreen(existingCharacter: existing, onSaved: onSaved);
  }
}

class CharacterFormScreen extends StatefulWidget {
  final CharacterEntity? existingCharacter;
  final void Function(String id) onSaved;

  const CharacterFormScreen({super.key, this.existingCharacter, required this.onSaved});

  @override
  State<CharacterFormScreen> createState() => _CharacterFormScreenState();
}

class _CharacterFormScreenState extends State<CharacterFormScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _levelCtrl;
  late TextEditingController _maxHpCtrl;
  late TextEditingController _currentHpCtrl;
  late TextEditingController _armorClassCtrl;
  late TextEditingController _strCtrl, _dexCtrl, _conCtrl, _intCtrl, _wisCtrl, _chaCtrl;
  late TextEditingController _customBackgroundCtrl;

  DndClass _dndClass = DndClass.sorcerer;
  String _raceId = '';
  String _subraceId = '';
  String _subclassId = '';
  String _backgroundId = '';

  bool get _isEditing => widget.existingCharacter != null;

  @override
  void initState() {
    super.initState();
    final c = widget.existingCharacter;
    _nameCtrl = TextEditingController(text: c?.name ?? '');
    _levelCtrl = TextEditingController(text: (c?.level ?? 1).toString());
    _maxHpCtrl = TextEditingController(text: (c?.maxHp ?? 8).toString());
    _currentHpCtrl = TextEditingController(text: (c?.currentHp ?? 8).toString());
    _armorClassCtrl = TextEditingController(text: (c?.armorClass ?? 10).toString());
    _strCtrl = TextEditingController(text: (c?.abilities.str ?? 10).toString());
    _dexCtrl = TextEditingController(text: (c?.abilities.dex ?? 10).toString());
    _conCtrl = TextEditingController(text: (c?.abilities.con ?? 10).toString());
    _intCtrl = TextEditingController(text: (c?.abilities.intel ?? 10).toString());
    _wisCtrl = TextEditingController(text: (c?.abilities.wis ?? 10).toString());
    _chaCtrl = TextEditingController(text: (c?.abilities.cha ?? 10).toString());
    _customBackgroundCtrl = TextEditingController(text: c?.customBackgroundText ?? '');
    _dndClass = c?.dndClass ?? DndClass.sorcerer;
    _raceId = c?.raceId ?? '';
    _subraceId = c?.subraceId ?? '';
    _subclassId = c?.subclassId ?? '';
    _backgroundId = c?.backgroundId ?? '';
  }

  @override
  void dispose() {
    for (final ctrl in [
      _nameCtrl, _levelCtrl, _maxHpCtrl, _currentHpCtrl, _armorClassCtrl,
      _strCtrl, _dexCtrl, _conCtrl, _intCtrl, _wisCtrl, _chaCtrl, _customBackgroundCtrl,
    ]) {
      ctrl.dispose();
    }
    super.dispose();
  }

  int _int(TextEditingController c, int fallback) => int.tryParse(c.text) ?? fallback;

  void _save() {
    final level = _int(_levelCtrl, 1).clamp(1, 20);
    final maxHp = _int(_maxHpCtrl, 8);
    final provider = context.read<CharacterProvider>();

    final base = widget.existingCharacter ??
        CharacterEntity(name: '', dndClass: _dndClass, level: level);

    final character = base.copyWith(
      name: _nameCtrl.text.trim().isEmpty ? 'Sin nombre' : _nameCtrl.text.trim(),
      dndClass: _dndClass,
      level: level,
      raceId: _raceId,
      subraceId: _subraceId,
      subclassId: _subclassId,
      backgroundId: _backgroundId,
      customBackgroundText: _backgroundId == 'custom' ? _customBackgroundCtrl.text : '',
      maxHp: maxHp,
      currentHp: _int(_currentHpCtrl, maxHp).clamp(0, maxHp),
      armorClass: _int(_armorClassCtrl, 10),
      abilities: AbilityScores(
        str: _int(_strCtrl, 10),
        dex: _int(_dexCtrl, 10),
        con: _int(_conCtrl, 10),
        intel: _int(_intCtrl, 10),
        wis: _int(_wisCtrl, 10),
        cha: _int(_chaCtrl, 10),
      ),
    );

    provider.saveCharacter(character);
    widget.onSaved(character.id);
  }

  @override
  Widget build(BuildContext context) {
    final selectedRace = RaceRepository.byId(_raceId);
    final availableSubraces = selectedRace?.subraces ?? const [];
    final availableSubclasses = SubclassRepository.forClass(_dndClass);
    final selectedBackground = _backgroundId == 'custom'
        ? null
        : (_backgroundId.isNotEmpty ? BackgroundRepository.byId(_backgroundId) : null);

    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Editar personaje' : 'Nuevo personaje')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Nombre', border: OutlineInputBorder())),
            const SizedBox(height: 12),

            DropdownButtonFormField<DndClass>(
              value: _dndClass,
              decoration: const InputDecoration(labelText: 'Clase', border: OutlineInputBorder()),
              items: DndClass.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.display)))
                  .toList(),
              onChanged: (v) => setState(() {
                _dndClass = v!;
                _subclassId = '';
              }),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _levelCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nivel (1-20)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),

            if (availableSubclasses.isNotEmpty) ...[
              DropdownButtonFormField<String>(
                value: _subclassId.isEmpty ? '' : _subclassId,
                decoration: const InputDecoration(labelText: 'Subclase', border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(value: '', child: Text('Sin elegir')),
                  ...availableSubclasses.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))),
                ],
                onChanged: (v) => setState(() => _subclassId = v ?? ''),
              ),
              const SizedBox(height: 12),
            ],

            DropdownButtonFormField<String>(
              value: _raceId.isEmpty ? '' : _raceId,
              decoration: const InputDecoration(labelText: 'Raza', border: OutlineInputBorder()),
              items: [
                const DropdownMenuItem(value: '', child: Text('Sin elegir')),
                ...RaceRepository.all.map((r) => DropdownMenuItem(value: r.id, child: Text('${r.name} (${r.sourceBook})'))),
              ],
              onChanged: (v) => setState(() {
                _raceId = v ?? '';
                _subraceId = '';
              }),
            ),
            const SizedBox(height: 12),

            if (availableSubraces.isNotEmpty) ...[
              DropdownButtonFormField<String>(
                value: _subraceId.isEmpty ? '' : _subraceId,
                decoration: const InputDecoration(labelText: 'Subraza', border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(value: '', child: Text('Sin elegir')),
                  ...availableSubraces.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name))),
                ],
                onChanged: (v) => setState(() => _subraceId = v ?? ''),
              ),
              const SizedBox(height: 12),
            ],

            DropdownButtonFormField<String>(
              value: _backgroundId.isEmpty ? '' : _backgroundId,
              decoration: const InputDecoration(labelText: 'Trasfondo', border: OutlineInputBorder()),
              items: [
                const DropdownMenuItem(value: '', child: Text('Sin elegir')),
                ...BackgroundRepository.all.map((b) => DropdownMenuItem(value: b.id, child: Text(b.name))),
                const DropdownMenuItem(value: 'custom', child: Text('Personalizado...')),
              ],
              onChanged: (v) => setState(() => _backgroundId = v ?? ''),
            ),
            if (_backgroundId == 'custom') ...[
              const SizedBox(height: 12),
              TextField(
                controller: _customBackgroundCtrl,
                minLines: 3,
                maxLines: 6,
                decoration: const InputDecoration(labelText: 'Descripción de tu trasfondo', border: OutlineInputBorder()),
              ),
            ] else if (selectedBackground != null) ...[
              const SizedBox(height: 4),
              Text('${selectedBackground.featureName}: ${selectedBackground.summary}',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
            const SizedBox(height: 16),

            Text('Combate', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: TextField(controller: _maxHpCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'PV máximos', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _currentHpCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'PV actuales', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _armorClassCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'CA', border: OutlineInputBorder()))),
            ]),
            const SizedBox(height: 16),

            Text('Características', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: TextField(controller: _strCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'FUE', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _dexCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'DES', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _conCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'CON', border: OutlineInputBorder()))),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: TextField(controller: _intCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'INT', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _wisCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'SAB', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: _chaCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'CAR', border: OutlineInputBorder()))),
            ]),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _save,
                child: Text(_isEditing ? 'Guardar cambios' : 'Crear personaje'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
