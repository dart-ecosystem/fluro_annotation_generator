class RouteObject {
  final String url;
  final String classPrefix;
  final String className;
  final String transitionType;

  const RouteObject({
    this.url,
    this.className,
    this.classPrefix,
    this.transitionType,
  });

  @override
  String toString() {
    String classFullName =
        classPrefix == null ? className : "$classPrefix.$className";

    String transitionTypeCode = transitionType == null
        ? "defaultTransitionType"
        : "fluro.TransitionType.$transitionType";

    return '''
router.define(
  "$url",
  handler: fluro.Handler(handlerFunc: (_, para) => $classFullName()),
  transitionType: $transitionTypeCode,
);''';
  }
}
