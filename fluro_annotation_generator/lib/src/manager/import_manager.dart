import 'package:fluro_annotation_generator/src/object/import_object.dart';

abstract class ImportManager {
  static int _id = 1;

  static List<ImportObject> _imports = [];

  static ImportObject register(String path) {
    if (_imports.any((e) => e.path == path)) {
      return _imports.firstWhere((e) => e.path == path);
    }
    ImportObject importObject = ImportObject(path, "id$_id");
    _imports.add(importObject);
    _id++;
    return importObject;
  }

  static String getTemplate() {
    return _imports.map((e) => e.toString()).join("\n");
  }
}
