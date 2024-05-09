import 'package:flutter/material.dart';
import 'src/api.dart';
import 'src/classes.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Game of Thrones',
            style: TextStyle(
              fontFamily: 'GameOfThrones',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 194, 144),
            ),
          ),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.auto_stories), text: 'Books'),
              Tab(icon: Icon(Icons.groups), text: 'Characters'),
              Tab(icon: Icon(Icons.shield), text: 'Houses'),
            ],
            labelColor: Colors.deepPurpleAccent,
          ),
          notificationPredicate: (notification) => notification.depth == 1,
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
        ),
        body: TabBarView(
          children: [
            _buildBooksTab(),
            _buildCharactersTab(),
            _buildHousesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildBooksTab() {
    return FutureBuilder<List<Book>>(
      future: books,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(snapshot.data![index].released));
              return ListTile(
                title: Text(snapshot.data![index].name),
                subtitle: Text('${snapshot.data![index].authors.join(", ")} - $formattedDate',),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildCharactersTab() {
    return FutureBuilder<List<Character>>(
      future: characters,
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
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildHousesTab() {
    return FutureBuilder<List<House>>(
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
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
