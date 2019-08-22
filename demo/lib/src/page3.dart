import 'package:flutter/material.dart';
import 'package:fluro_annotation_generator/src/annotation/f_route.dart';

@FRoute("/page/3")
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
