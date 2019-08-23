const String route_template = '''
import 'package:fluro/fluro.dart' as fluro;
{{{imports}}}

fluro.Router createFluroRouter({
  fluro.TransitionType defaultTransitionType = fluro.TransitionType.cupertino,
}) {
  var router = fluro.Router();
  {{{routes}}}
  return router;
}
''';
