import 'package:flutter/material.dart';
import 'src/api_service.dart';
import 'src/models.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Book>> books;
  late Future<List<Character>> characters;
  late Future<List<House>> houses;

  @override
  void initState() {
    super.initState();
    books = ApiService.fetchBooks();
    characters = ApiService.fetchCharacters();
    houses = ApiService.fetchHouses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game of Thrones Library',
          style: GoogleFonts.gabarito(),
        ),
        // Add your logo here if needed
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Books'),
                Tab(text: 'Characters'),
                Tab(text: 'Houses'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<List<Book>>(
                future: books,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].authors),
                          subtitle: Text(
                            snapshot.data![index].authors;
                            snapshot.data![index].publisher
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
              FutureBuilder<List<Character>>(
                future: characters,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final filteredCharacters = snapshot.data!.where((character) => character.fullName.isNotEmpty).toList();
                    print('Filtered characters: $filteredCharacters'); // Add this line for debugging
                    return ListView.builder(
                      itemCount: filteredCharacters.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCharacters[index].fullName),
                          subtitle: Text(filteredCharacters[index].title),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),





              FutureBuilder<List<House>>(
                future: houses,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].region),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
