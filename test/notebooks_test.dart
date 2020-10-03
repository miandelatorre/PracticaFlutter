import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebooks singleton", () {
      expect(Notebooks.shared, isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Notebook n = Notebook("hola soy un notebook");
      Notebooks.shared.add(n);
      expect(() => Notebooks.shared.removeAt(0), returnsNormally);

      Notebooks.shared.add(n);
      expect(Notebooks.shared.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebooks();
      final nb2 = Notebooks();
      final n = Notebook("Lorem Ipsum Notebook");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
