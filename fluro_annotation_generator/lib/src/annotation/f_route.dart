import 'package:fluro/src/common.dart'
    show HandlerType, HandlerFunc, TransitionType;

import 'base_annotation.dart';

class FRoute extends FRouteBase {
  final String url;
  final HandlerType handlerType;
  final HandlerFunc handlerFunc;
  final TransitionType transitionType;

  const FRoute(
    this.url, {
    this.handlerType,
    this.handlerFunc,
    this.transitionType,
  });
}
