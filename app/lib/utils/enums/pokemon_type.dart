/// Pokemon type
enum PokemonType {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
  stellar,
  typeless,
}

extension PokemonTypeExtension on PokemonType {
  String get name => toString().split('.').last;

  static PokemonType fromString(String type) {
    return PokemonType.values.firstWhere(
      (e) => e.name == type.toLowerCase(),
      orElse: () => PokemonType.typeless,
    );
  }

  bool get isStellar => this == PokemonType.stellar;
}