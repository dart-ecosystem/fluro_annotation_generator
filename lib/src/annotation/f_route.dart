import 'package:fluro/src/common.dart' show HandlerType, HandlerFunc;

import 'base_annotation.dart';

class FRoute extends FRouteBase {
  final String url;
  final HandlerType handlerType;
  final HandlerFunc handlerFunc;

  const FRoute(
    this.url, {
    this.handlerType,
    this.handlerFunc,
  });
}
