import 'package:fluro_annotation_generator/src/helper/import_helper.dart';
import 'package:fluro_annotation_generator/src/template/route_template.dart';
import 'package:fluro_annotation_generator/src/utils/cache_utils.dart';

abstract class TemplateUtils {
  static String buildFromCacheList(List<String> caches) {
    List<String> importTemplates = [];
    List<String> routeTemplates = [];
    ImportHelper importHelper = ImportHelper();
    for (String cache in caches) {
      List<String> decodedCache = CacheUtils.decode(cache);
      // register path
      String path = decodedCache[0];
      final pathImport = importHelper.addPath(path);
      if (!importTemplates.contains(pathImport.toString())) {
        importTemplates.add(pathImport.toString());
      }

      // register handler path if exists
      String handlerPath = decodedCache[1];
      final handlerImport = importHelper.addPath(handlerPath);
      if (handlerImport != null &&
          !importTemplates.contains(pathImport.toString())) {
        importTemplates.add(handlerImport.toString());
      }
      routeTemplates.add(buildRouteTemplate(
        url: decodedCache[2],
        className: decodedCache[3],
        classPrefix: pathImport.prefix,
        transitionType: decodedCache[4],
        handlerType: decodedCache[5],
        handlerFuncName: decodedCache[6],
        handlerFuncPrefix: handlerImport?.prefix,
      ));
    }
    return route_template
        .replaceAll("{{{imports}}}", importTemplates.join("\n"))
        .replaceAll("{{{routes}}}", routeTemplates.join("\n"));
  }

  static String buildRouteTemplate({
    String url,
    String className,
    String classPrefix,
    String transitionType,
    String handlerType,
    String handlerFuncName,
    String handlerFuncPrefix,
  }) {
    String classFullName =
        classPrefix == null ? className : "$classPrefix.$className";

    String handlerFuncFullName = handlerFuncPrefix == null
        ? handlerFuncName
        : "$handlerFuncPrefix.$handlerFuncName";

    String handlerFuncCode = handlerFuncName == null
        ? "(_, para) => $classFullName()"
        : handlerFuncFullName;

    String transitionTypeCode = transitionType == null
        ? "defaultTransitionType"
        : "fluro.TransitionType.$transitionType";

    String handlerTypeCode =
        handlerType == null ? "null" : "fluro.HandlerType.$handlerType";

    return '''router.define(
  "$url",
  handler: fluro.Handler(
    type: $handlerTypeCode,
    handlerFunc: $handlerFuncCode,
  ),
  transitionType: $transitionTypeCode,
);''';
  }
}
