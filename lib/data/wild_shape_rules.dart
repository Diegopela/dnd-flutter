class WildShapeRules {
  static String maxChallengeRating(int level) {
    if (level >= 8) return 'NP 1 (sin límite de velocidad de nado/vuelo)';
    if (level >= 4) return 'NP 1/2 (sin velocidad de vuelo)';
    if (level >= 2) return 'NP 1/4 (sin velocidad de nado ni vuelo)';
    return 'Todavía no tenés Forma Salvaje';
  }
}
