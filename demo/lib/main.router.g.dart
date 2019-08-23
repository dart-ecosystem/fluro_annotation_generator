// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RouteWriter
// **************************************************************************

import 'package:fluro/fluro.dart' as fluro;
import "package:demo/src/page1.dart" as id1;
import "package:demo/src/page2.dart" as id2;
import "package:demo/src/page3.dart" as id3;

fluro.Router createFluroRouter({
  fluro.TransitionType defaultTransitionType = fluro.TransitionType.cupertino,
}) {
  var router = fluro.Router();
  router.define(
    "/",
    handler: fluro.Handler(handlerFunc: (_, para) => id1.Page1()),
    transitionType: defaultTransitionType,
  );
  router.define(
    "/page/2",
    handler: fluro.Handler(handlerFunc: (_, para) => id2.Page2()),
    transitionType: defaultTransitionType,
  );
  router.define(
    "/page/3",
    handler: fluro.Handler(handlerFunc: (_, para) => id3.Page3()),
    transitionType: defaultTransitionType,
  );
  return router;
}
