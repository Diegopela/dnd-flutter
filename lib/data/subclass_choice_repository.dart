class SubclassChoiceOption {
  final String id;
  final String name;
  final String summary;
  const SubclassChoiceOption(this.id, this.name, this.summary);
}

class SubclassChoiceRepository {
  static const Map<String, List<SubclassChoiceOption>> choices = {
    'circle_shepherd': [
      SubclassChoiceOption('bear_spirit', 'Espíritu del Oso',
          'Tus invocaciones/aliados cercanos ganan PV temporales extra al entrar en combate.'),
      SubclassChoiceOption('hawk_spirit', 'Espíritu del Halcón',
          'Tus aliados cercanos ganan ventaja en tiradas de ataque cuando están junto al espíritu.'),
      SubclassChoiceOption('unicorn_spirit', 'Espíritu del Unicornio',
          'Tus conjuros de curación otorgan PV extra a quienes estén cerca del espíritu.'),
    ],
  };

  static List<SubclassChoiceOption> optionsFor(String subclassId) => choices[subclassId] ?? [];

  static SubclassChoiceOption? find(String subclassId, String optionId) {
    try {
      return optionsFor(subclassId).firstWhere((o) => o.id == optionId);
    } catch (_) {
      return null;
    }
  }
}
