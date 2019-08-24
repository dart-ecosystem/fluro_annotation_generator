class ImportHelper {
  int _id = 1;
  List<_ImportObject> _imports = [];

  _ImportObject addPath(String path) {
    if (path == null || path == "") {
      return null;
    }
    if (_imports.any((e) => e.path == path)) {
      return _imports.firstWhere((e) => e.path == path);
    }
    _ImportObject importObject = _ImportObject(path, "id$_id");
    _imports.add(importObject);
    _id++;
    return importObject;
  }

  String toString() {
    return _imports.map((e) => e.toString()).join("\n");
  }
}

class _ImportObject {
  final String path;
  final String prefix;
  const _ImportObject(this.path, this.prefix);
  @override
  String toString() {
    if (prefix == null) {
      return "import \"$path\";";
    }
    return "import \"$path\" as $prefix;";
  }
}
