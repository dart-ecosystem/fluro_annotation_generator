abstract class CacheUtils {
  static String encode({
    String path,
    String handlerPath,
    String url,
    String className,
    String transitionType,
    String handlerType,
    String handlerFuncName,
  }) {
    return _encodeString([
      path,
      handlerPath,
      url,
      className,
      transitionType,
      handlerType,
      handlerFuncName,
      "-----end-----"
    ].join("\n"));
  }
  
  static List<List<String>> decodeAll(String content) {
    List<List<String>> res = [];
    List<String> contents = content.split("-----end-----");
    contents.removeLast();
    for (String c in contents) {
      res.add(decode(c));
    }
    return res;
  }

  static List<String> decode(String content) {
    return _decodeString(content.split("-----end-----").first)
        .split("\n")
        .map((e) => e == "null" ? null : e)
        .toList();
  }

  static String _encodeString(String content) {
    return content
        .split("\n")
        .where((e) => e != "")
        .map((e) => "//> $e")
        .join("\n");
  }

  static String _decodeString(String content) {
    return content
        .split("\n")
        .where((e) => e.startsWith("//> "))
        .map((e) => e.replaceFirst("//> ", ""))
        .join("\n");
  }

  static String cleanUp(String content) {
    return content.split("\n").where((e) => e.startsWith("//> ")).join("\n");
  }
}
