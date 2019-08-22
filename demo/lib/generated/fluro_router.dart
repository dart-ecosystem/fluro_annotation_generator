import 'package:fluro/fluro.dart';

import '../src/page1.dart';
import '../src/page2.dart';

Router createFluroRouter({
  TransitionType defaultTransitionType = TransitionType.cupertino,
}) {
  var router = Router();
  router.define(
    "/",
    handler: Handler(handlerFunc: (_, para) => Page1()),
    transitionType: defaultTransitionType,
  );
  router.define(
    "/page/2",
    handler: Handler(handlerFunc: (_, para) => Page2()),
    transitionType: defaultTransitionType,
  );
  return router;
}
