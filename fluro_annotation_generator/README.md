# Fluro Annotation Generator
Enable annotation support for fluro, which automatically generate fluro routes for you.

## Usage
1. decorate route with `@FRoute()`
2. decorate entry widget with `@EnableFluroRouter()`

## Rule
1. all optional parameters are not required
2. route should have a no-argument constructor or a single-argument constructor which accepts Map<String, List<String>>

## Example
```dart
// file: mail.dart
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

// file: page1.dart
@FRoute(
  "/", 
  // transitionType: TransitionType.native,
  // handlerType: HandlerType.route,
  // handlerFunc: (BuildContext ctx, Map<String, List<String>> parameters) => Page1(),
)
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page 1");
  }
}
```

## Recipe
### 1. Set default transition effect
TBD
