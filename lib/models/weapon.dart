import 'enums.dart';

class Weapon {
  final String id;
  final String name;
  final String damageDice;
  final DamageType damageType;
  final Ability ability;
  final bool isFinesse;
  final bool isRanged;
  final bool isProficient;
  final int bonusToHit;
  final int bonusToDamage;
  final String? versatileDice;
  final String notes;

  const Weapon({
    required this.id,
    required this.name,
    required this.damageDice,
    required this.damageType,
    required this.ability,
    this.isFinesse = false,
    this.isRanged = false,
    this.isProficient = true,
    this.bonusToHit = 0,
    this.bonusToDamage = 0,
    this.versatileDice,
    this.notes = '',
  });

  Weapon copyWith({String? id}) => Weapon(
        id: id ?? this.id,
        name: name,
        damageDice: damageDice,
        damageType: damageType,
        ability: ability,
        isFinesse: isFinesse,
        isRanged: isRanged,
        isProficient: isProficient,
        bonusToHit: bonusToHit,
        bonusToDamage: bonusToDamage,
        versatileDice: versatileDice,
        notes: notes,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'damageDice': damageDice,
        'damageType': damageType.name,
        'ability': ability.name,
        'isFinesse': isFinesse,
        'isRanged': isRanged,
        'isProficient': isProficient,
        'bonusToHit': bonusToHit,
        'bonusToDamage': bonusToDamage,
        'versatileDice': versatileDice,
        'notes': notes,
      };

  factory Weapon.fromMap(Map<dynamic, dynamic> m) => Weapon(
        id: m['id'] as String,
        name: m['name'] as String,
        damageDice: m['damageDice'] as String,
        damageType: DamageType.values.firstWhere((d) => d.name == m['damageType']),
        ability: abilityFromName(m['ability'] as String),
        isFinesse: m['isFinesse'] as bool? ?? false,
        isRanged: m['isRanged'] as bool? ?? false,
        isProficient: m['isProficient'] as bool? ?? true,
        bonusToHit: m['bonusToHit'] as int? ?? 0,
        bonusToDamage: m['bonusToDamage'] as int? ?? 0,
        versatileDice: m['versatileDice'] as String?,
        notes: m['notes'] as String? ?? '',
      );
}

class WeaponPresets {
  static const unarmed = Weapon(
    id: 'unarmed',
    name: 'Ataque Desarmado',
    damageDice: '1d8',
    damageType: DamageType.bludgeoning,
    ability: Ability.str,
    notes: 'Manos libres.',
  );

  static const unarmedArmed = Weapon(
    id: 'unarmed_armed',
    name: 'Ataque Desarmado (con arma/escudo)',
    damageDice: '1d6',
    damageType: DamageType.bludgeoning,
    ability: Ability.str,
    notes: 'Con un arma o escudo empuñado en la otra mano.',
  );

  static const List<Weapon> presets = [
    unarmed,
    unarmedArmed,
    Weapon(id: 'dagger', name: 'Daga', damageDice: '1d4', damageType: DamageType.piercing, ability: Ability.dex, isFinesse: true),
    Weapon(id: 'shortsword', name: 'Espada Corta', damageDice: '1d6', damageType: DamageType.piercing, ability: Ability.dex, isFinesse: true),
    Weapon(id: 'longsword', name: 'Espada Larga', damageDice: '1d8', damageType: DamageType.slashing, ability: Ability.str, versatileDice: '1d10'),
    Weapon(id: 'greatsword', name: 'Mandoble', damageDice: '2d6', damageType: DamageType.slashing, ability: Ability.str),
    Weapon(id: 'rapier', name: 'Estoque', damageDice: '1d8', damageType: DamageType.piercing, ability: Ability.dex, isFinesse: true),
    Weapon(id: 'battleaxe', name: 'Hacha de Batalla', damageDice: '1d8', damageType: DamageType.slashing, ability: Ability.str, versatileDice: '1d10'),
    Weapon(id: 'greataxe', name: 'Hacha Grande', damageDice: '1d12', damageType: DamageType.slashing, ability: Ability.str),
    Weapon(id: 'handaxe', name: 'Hacha de Mano', damageDice: '1d6', damageType: DamageType.slashing, ability: Ability.str, isRanged: true),
    Weapon(id: 'warhammer', name: 'Martillo de Guerra', damageDice: '1d8', damageType: DamageType.bludgeoning, ability: Ability.str, versatileDice: '1d10'),
    Weapon(id: 'mace', name: 'Maza', damageDice: '1d6', damageType: DamageType.bludgeoning, ability: Ability.str),
    Weapon(id: 'quarterstaff', name: 'Bastón', damageDice: '1d6', damageType: DamageType.bludgeoning, ability: Ability.str, versatileDice: '1d8'),
    Weapon(id: 'shortbow', name: 'Arco Corto', damageDice: '1d6', damageType: DamageType.piercing, ability: Ability.dex, isRanged: true),
    Weapon(id: 'longbow', name: 'Arco Largo', damageDice: '1d8', damageType: DamageType.piercing, ability: Ability.dex, isRanged: true),
    Weapon(id: 'light_crossbow', name: 'Ballesta Ligera', damageDice: '1d8', damageType: DamageType.piercing, ability: Ability.dex, isRanged: true),
    Weapon(id: 'heavy_crossbow', name: 'Ballesta Pesada', damageDice: '1d10', damageType: DamageType.piercing, ability: Ability.dex, isRanged: true, notes: 'Pesada, desventaja para criaturas Pequeñas'),
    Weapon(id: 'spear', name: 'Lanza', damageDice: '1d6', damageType: DamageType.piercing, ability: Ability.str, versatileDice: '1d8', isRanged: true),
    Weapon(id: 'scimitar', name: 'Cimitarra', damageDice: '1d6', damageType: DamageType.slashing, ability: Ability.dex, isFinesse: true),
  ];
}
