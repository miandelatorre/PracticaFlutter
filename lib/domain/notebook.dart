import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/extensions/date_time.dart';

class Notebook with ChangeNotifier {
  static final shared = Notebook("");

  final List<Note> _notes = [];

  int get length => _notes.length;

  String _title = "";

  String get title => _title;
  set title(String newTitle) {
    _title = newTitle;
    _modificationDate = DateTime.now();
  }

  DateTime _creationDate;
  DateTime get creationDate => _creationDate;
  DateTime _modificationDate;
  DateTime get modificationDate => _modificationDate;

  // Constructores
  //Notebook();

  Notebook(String title) : _title = title {
    _modificationDate = DateTime.now();
    _creationDate = DateTime.now();
  }

  Notebook.empty() : this("");

  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  Notebook.testDataBuilderWitTitle(String title) {
    _title = title;
    _notes.addAll(List.generate(100, (index) => Note("Item $index of $title")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Notebook &&
          (other.title == title) &&
          (other.creationDate.almostEqual(_creationDate)) &&
          (other.modificationDate.almostEqual(_modificationDate));
    }
  }

  @override
  int get hashCode {
    final proxy = DateTime(
        _creationDate.year,
        _creationDate.month,
        _creationDate.day,
        _creationDate.hour,
        _creationDate.minute,
        _creationDate.second);
    return proxy.hashCode;
  }
}
