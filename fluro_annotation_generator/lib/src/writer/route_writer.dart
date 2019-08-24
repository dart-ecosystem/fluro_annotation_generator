import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fluro_annotation_generator/src/annotation/base_annotation.dart';
import 'package:fluro_annotation_generator/src/utils/template_utils.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

class RouteWriter extends GeneratorForAnnotation<EnableFluroRouterBase> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final List<String> caches = [];
    final assetIds = await buildStep
        .findAssets(Glob("**/*.fluro_annotation_generator_cache.dart"))
        .toList();

    for (var assetId in assetIds) {
      caches.add((await buildStep.readAsString(assetId)).trim());
    }

    return TemplateUtils.buildFromCacheList(caches);
  }
}
