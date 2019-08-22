class RouteObject {
  final String url;
  final String classPrefix;
  final String className;

  const RouteObject({
    this.url,
    this.className,
    this.classPrefix,
  });

  @override
  String toString() {
    String classFullName =
        classPrefix == null ? className : "$classPrefix.$className";

    return '''
router.define(
  "$url",
  handler: fluro.Handler(handlerFunc: (_, para) => $classFullName()),
  transitionType: defaultTransitionType,
);
    ''';
  }
}
