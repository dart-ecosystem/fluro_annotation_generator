import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fluro_annotation_generator/src/annotation/base_annotation.dart';
import 'package:fluro_annotation_generator/src/utils/cache_utils.dart';
import 'package:source_gen/source_gen.dart';

class RouteCollector extends GeneratorForAnnotation<FRouteBase> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final String path = assetToPackageUrl(buildStep.inputId.uri).toString();

    // transition type
    final String transitionTypeValue = [
      "native",
      "nativeModal",
      "inFromLeft",
      "inFromRight",
      "inFromBottom",
      "fadeIn",
      "custom", // if using custom then you must also provide a transition
      "material",
      "materialFullScreenDialog",
      "cupertino",
      "cupertinoFullScreenDialog",
    ].firstWhere(
      (type) =>
          annotation.peek("transitionType")?.objectValue?.getField(type) !=
          null,
      orElse: () => null,
    );

    // handler type
    final String handlerTypeValue = ["route", "function"].firstWhere(
      (type) =>
          annotation.peek("handlerType")?.objectValue?.getField(type) != null,
      orElse: () => null,
    );

    // handler function
    final Element handlerFuncElement =
        annotation.peek("handlerFunc")?.objectValue?.type?.element;
    final Uri handlerFuncUri = handlerFuncElement?.source?.uri == null
        ? null
        : assetToPackageUrl(handlerFuncElement?.source?.uri);
    final String handlerFuncName = handlerFuncElement?.name;
    // routes
    final String url = annotation.peek("url").stringValue;

    return CacheUtils.encode(
      path: path,
      handlerPath: handlerFuncUri?.toString(),
      url: url,
      className: element.name,
      transitionType: transitionTypeValue,
      handlerType: handlerTypeValue,
      handlerFuncName: handlerFuncName,
    );
  }
}

Uri assetToPackageUrl(Uri url) =>
    url.pathSegments.isNotEmpty && url.pathSegments[1] == 'lib'
        ? url.replace(
            scheme: 'package',
            pathSegments: [url.pathSegments.first]
              ..addAll(url.pathSegments.skip(2)))
        : url;
