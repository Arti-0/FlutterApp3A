import 'dart:convert';
import 'package:http/http.dart' as http;
import 'classes.dart';



class ApiService {
  static Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse('https://www.anapioficeandfire.com/api/books'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Book>.from(data.map((x) => Book.fromJson(x)));
    } else {
      throw Exception('Failed to load books from API');
    }
  }

  static Future<List<Character>> fetchCharacters() async {
  final response = await http.get(Uri.parse('https://www.thronesapi.com/api/v2/Characters'));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Character> characters = List<Character>.from(data.map((x) => Character.fromJson(x)));
    return characters;
  } else {
    throw Exception('Failed to load characters from API');
  }
}


  static Future<List<House>> fetchHouses() async {
    final response = await http.get(Uri.parse('https://www.anapioficeandfire.com/api/houses'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<House>.from(data.map((x) => House.fromJson(x)));
    } else {
      throw Exception('Failed to load houses from API');
    }
  }
}

