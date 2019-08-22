import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fluro_annotation_generator/src/annotation/f_route.dart';
import 'package:fluro_annotation_generator/src/manager/import_manager.dart';
import 'package:fluro_annotation_generator/src/manager/route_manager.dart';
import 'package:fluro_annotation_generator/src/object/import_object.dart';
import 'package:fluro_annotation_generator/src/object/route_object.dart';
import 'package:source_gen/source_gen.dart';

class RouteCollector extends GeneratorForAnnotation<FRoute> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final String path = assetToPackageUrl(buildStep.inputId.uri).toString();
    ImportObject importObject = ImportManager.register(path);

    // routes
    final String url = annotation.peek("url").stringValue;
    RouteObject routeObject = RouteObject(
      url: url,
      className: element.name,
      classPrefix: importObject.prefix,
    );
    RouteManager.register(routeObject);
  }
}

Uri assetToPackageUrl(Uri url) =>
    url.pathSegments.isNotEmpty && url.pathSegments[1] == 'lib'
        ? url.replace(
            scheme: 'package',
            pathSegments: [url.pathSegments.first]
              ..addAll(url.pathSegments.skip(2)))
        : url;
