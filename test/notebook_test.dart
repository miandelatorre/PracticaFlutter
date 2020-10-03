import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });

    test("Can create notebooks", () {
      expect(Notebook("a new notebook"), isNotNull);
      expect(Notebook.empty().title, "");
    });
  });

  group("dates", () {
    test("Modification is bigger than creation after modification", () {
      final n1 = Notebook.empty();
      n1.title = "Título nuevo";

      expect(n1.creationDate.isBefore(n1.modificationDate), isTrue);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note n = Note("hola");
      Notebook.shared.add(n);
      expect(() => Notebook.shared.removeAt(0), returnsNormally);

      Notebook.shared.add(n);
      expect(Notebook.shared.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebook("");
      final nb2 = Notebook("");
      final n = Note("Lorem Ipsum");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });

  group("Object Protocol", () {
    test("equality", () {
      final n = Notebook("Mi notebook");
      expect(n, n);
      expect(n, Notebook("Mi notebook"));
      expect(n != Notebook.empty(), isTrue);
    });

    test("hashCode", () {
      // dos objetos que son iguales, han de tener el mismo
      // hashCode
      final n1 = Notebook("Mi notebook");
      final n2 = Notebook("Mi notebook");

      expect(n1.hashCode, n2.hashCode);
    });
  });
}
