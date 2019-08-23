import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fluro_annotation_generator/src/annotation/base_annotation.dart';
import 'package:fluro_annotation_generator/src/manager/import_manager.dart';
import 'package:fluro_annotation_generator/src/manager/route_manager.dart';
import 'package:fluro_annotation_generator/src/template/route_template.dart';
import 'package:source_gen/source_gen.dart';

class RouteWriter extends GeneratorForAnnotation<EnableFluroRouterBase> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return route_template
        .replaceAll("{{{imports}}}", ImportManager.getTemplate())
        .replaceAll("{{{routes}}}", RouteManager.getTemplate());
  }
}
