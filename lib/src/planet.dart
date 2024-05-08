class Planet {
  final String name;
  final String population;
  final String climate;

  Planet({required this.name, required this.population, required this.climate});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      population: json['population'],
      climate: json['climate'],
    );
  }
}