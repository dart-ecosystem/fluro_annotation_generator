class ImportObject {
  final String path;
  final String prefix;

  const ImportObject(this.path, this.prefix);

  @override
  String toString() {
    if (prefix == null) {
      return "import \"$path\";";
    }

    return "import \"$path\" as $prefix;";
  }
}
