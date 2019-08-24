import 'package:demo/src/page2.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro_annotation_generator/fluro_annotation_generator.dart';

Widget handler(BuildContext _, Map<String, List<String>> para) => Page2();

@FRoute("/page/3", handlerType: HandlerType.function, handlerFunc: handler)
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      body: Container(
        child: FlatButton(
          child: Text("前往Page2"),
          onPressed: () => Navigator.of(context).pushNamed("/page/2"),
        ),
      ),
    );
  }
}
