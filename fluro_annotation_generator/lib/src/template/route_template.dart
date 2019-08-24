const String route_template = '''
import 'package:fluro/fluro.dart' as fluro;
{{{imports}}}

fluro.Router createFluroRouter({
  fluro.TransitionType defaultTransitionType,
}) {
  var router = fluro.Router();
  {{{routes}}}
  return router;
}
''';
