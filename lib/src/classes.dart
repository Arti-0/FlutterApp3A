class Book {
  final String name;
  final List<String> authors;
  final String released;

  Book({required this.name, required this.authors, required this.released});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      authors: (json['authors'] as List<dynamic>).cast<String>(),
      released: json['released'],
    );
  }
}

class Character {
  final String fullName;
  final String title;
  final String family;
  final String imageUrl;

  Character({required this.fullName, required this.title, required this.family, required this.imageUrl});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      fullName: json['fullName'],
      title: json['title'],
      family: json['family'],
      imageUrl: json['imageUrl'],
    );
  }
}

class House {
  final String name;
  final String region;

  House({required this.name, required this.region});

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      name: json['name'],
      region: json['region'],
    );
  }
}
