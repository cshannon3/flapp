import 'state_manager/state_manager.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  StateManager stateManager = StateManager();
 @override
  void initState() {
    super.initState();
    stateManager.initialize();
    // refresh when ui manager is called so that screen changes
    stateManager.addListener((){
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: stateManager.appbar,
      body:
       stateManager.currentScreenWidget
       );
  }
}


  