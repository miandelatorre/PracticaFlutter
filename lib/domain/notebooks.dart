import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  // Constructors
  Notebooks();

  Notebooks.testDataBuilder() {
    _notebooks.addAll(List.generate(
        100, (index) => Notebook.testDataBuilderWitTitle("Notebook $index")));
  }

  // Accesores
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Mutadores
  bool remove(Notebook notebook) {
    final n = _notebooks.remove(notebook);
    notifyListeners();
    return n;
  }

  Notebook removeAt(int index) {
    final Notebook n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }
}
