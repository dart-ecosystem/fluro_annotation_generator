import 'package:build/build.dart';
import 'package:fluro_annotation_generator/src/collector/route_collector.dart';
import 'package:fluro_annotation_generator/src/writer/route_writer.dart';
import 'package:source_gen/source_gen.dart';

Builder collector(BuilderOptions options) => LibraryBuilder(
      RouteCollector(),
      generatedExtension: '.fluro_annotation_generator_cache.dart',
    );

Builder writer(BuilderOptions options) => LibraryBuilder(
      RouteWriter(),
      generatedExtension: '.router.g.dart',
    );

//PostProcessBuilder writer(BuilderOptions options) => RouteWriter();
