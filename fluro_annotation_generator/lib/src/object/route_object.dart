class RouteObject {
  final String url;
  final String classPrefix;
  final String className;
  final String transitionType;
  final String handlerType;
  final String handlerFuncName;
  final String handlerFuncPrefix;

  const RouteObject({
    this.url,
    this.className,
    this.classPrefix,
    this.transitionType,
    this.handlerType,
    this.handlerFuncName,
    this.handlerFuncPrefix,
  });

  @override
  String toString() {
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

    return '''
router.define(
  "$url",
  handler: fluro.Handler(
    type: $handlerTypeCode,
    handlerFunc: $handlerFuncCode,
  ),
  transitionType: $transitionTypeCode,
);''';
  }
}
