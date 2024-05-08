import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models.dart';

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
        title: Text('Game of Thrones Library'),
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
                          subtitle: Text(snapshot.data![index].isbn),
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
                future: ApiService.fetchCharacters(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final character = snapshot.data![index];
                        return ListTile(
                          title: Text(character.fullName),
                          subtitle: Text(character.title),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
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
