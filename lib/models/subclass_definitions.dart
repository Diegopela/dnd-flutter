import 'enums.dart';
import 'class_definitions.dart';

class SubclassDefinition {
  final String id;
  final String name;
  final DndClass dndClass;
  final String sourceBook;
  final List<FeatureDefinition> features;

  const SubclassDefinition(this.id, this.name, this.dndClass, this.sourceBook, this.features);
}
