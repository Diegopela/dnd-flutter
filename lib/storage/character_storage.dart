import 'package:hive_flutter/hive_flutter.dart';
import '../models/character.dart';

class CharacterStorage {
  static const String boxName = 'characters';
  late Box<Map> box;

  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox<Map>(boxName);
  }

  List<CharacterEntity> getAll() {
    return box.values
        .map((m) => CharacterEntity.fromMap(Map<dynamic, dynamic>.from(m)))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  CharacterEntity? getById(String id) {
    final m = box.get(id);
    if (m == null) return null;
    return CharacterEntity.fromMap(Map<dynamic, dynamic>.from(m));
  }

  Future<void> save(CharacterEntity character) async {
    await box.put(character.id, character.toMap());
  }

  Future<void> delete(CharacterEntity character) async {
    await box.delete(character.id);
  }
}
