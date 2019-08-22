import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'generated/fluro_router.dart';
import 'package:fluro_annotation_generator/fluro_annotation_generator.dart';

void main() => runApp(MyApp());

@EnableFluroRouter()
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: createFluroRouter().generator,
      initialRoute: "/",
    );
  }
}
