import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BooksListView extends StatefulWidget {
  final Notebooks _model;

  const BooksListView(Notebooks model) : _model = model;

  @override
  _BooksListViewState createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return BookSliver(widget._model, index);
      },
    );
  }
}

class BookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const BookSliver(Notebooks notebooks, int index)
      : this.notebooks = notebooks,
        this.index = index;

  @override
  _BookSliverState createState() => _BookSliverState();
}

class _BookSliverState extends State<BookSliver> {
  @override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Notebook has been deleted!"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebooks[widget.index].title),
          onTap: () => {
            Navigator.pushNamed(context, NotesWidget.routeNotes,
                arguments: Index(widget.index))
          },
        ),
      ),
    );
  }
}
