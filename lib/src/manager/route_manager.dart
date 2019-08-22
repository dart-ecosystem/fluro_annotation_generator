import 'package:fluro_annotation_generator/src/object/route_object.dart';

abstract class RouteManager {
  static List<RouteObject> routes = [];

  static void register(RouteObject routeObject) {
    routes.removeWhere((e) => e.url == routeObject.url);
    routes.add(routeObject);
  }

  static String getTemplate() {
    return routes.map((e) => e.toString()).join("\n");
  }
}
