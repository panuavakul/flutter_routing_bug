import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

void main() => runApp(MyApp());

/// Routers 

final router = Router();

var usersHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  /// Put break point here
  return MyOtherPage();
});

void defineRoutes(Router router) {
  router.define(MyOtherPage.routingPath, handler: usersHandler);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    defineRoutes(router);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: router.generator,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Test Fluro',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          router.navigateTo(context, MyOtherPage.routingPath);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}

class MyOtherPage extends StatelessWidget {
  static const routingPath = '/myOtherPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(),
      ),
    );
  }
}