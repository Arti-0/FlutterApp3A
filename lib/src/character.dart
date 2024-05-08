class Character {
  final String name;
  final String height;
  final String mass;
  final String species;

  Character({required this.name, required this.height, required this.mass, required this.species});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      species: json['species'],
    );
  }
}