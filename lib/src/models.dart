class Book {
  final String name;
  final String authors;
  final String publisher;

  Book({required this.name, required this.authors, required this.publisher});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      authors: json['authors'],
    );
  }
}

class Character {
  final String fullName;
  final String title;

  Character({required this.fullName, required this.title});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      fullName: json['fullName'],
      title: json['title'],
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
