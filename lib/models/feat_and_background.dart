class FeatDefinition {
  final String id;
  final String name;
  final String prerequisite;
  final String summary;

  const FeatDefinition(this.id, this.name, this.prerequisite, this.summary);
}

class BackgroundDefinition {
  final String id;
  final String name;
  final String featureName;
  final String summary;

  const BackgroundDefinition(this.id, this.name, this.featureName, this.summary);
}
