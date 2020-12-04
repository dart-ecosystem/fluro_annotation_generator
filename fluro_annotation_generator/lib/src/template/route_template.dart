const String route_template = '''
import 'package:fluro/fluro.dart' as fluro;
{{{imports}}}

fluro.FluroRouter createFluroRouter({
  fluro.TransitionType defaultTransitionType,
}) {
  var router = fluro.FluroRouter();
  {{{routes}}}
  return router;
}
''';
