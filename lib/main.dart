import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/Scenes/books_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/note.dart';

final Notebook model = Notebook.testDataBuilder();
final Notebooks modelBooks = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class Index {
  final int _index;
  int get index => _index;

  Index(int newIndex) : _index = newIndex;
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF388E3C),
        accentColor: Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      routes: {
        BooksWidget.routeBooks: (context) => BooksWidget(),
        NotesWidget.routeNotes: (context) => NotesWidget(),
      },
      initialRoute: BooksWidget.routeBooks,
    );
  }
}

class BooksWidget extends StatelessWidget {
  static final routeBooks = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.noteBooks),
      ),
      body: BooksListView(modelBooks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modelBooks.add(Notebook("Un nuevo notebook"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  static final routeNotes = "/notes";

  @override
  Widget build(BuildContext context) {
    final Index index = ModalRoute.of(context).settings.arguments as Index;

    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.notes),
      ),
      body: NotesListView(modelBooks[index.index]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modelBooks[index.index].add(Note("Una nueva nota"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
