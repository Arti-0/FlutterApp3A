class Film {
  final String title;
  final String director;
  final String releaseDate;

  Film({required this.title, required this.director, required this.releaseDate});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      director: json['director'],
      releaseDate: json['release_date'],
    );
  }
}
