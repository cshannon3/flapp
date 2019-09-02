import 'state_controller.dart';
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
 
  StateController stateController = StateController();
 @override
  void initState() {
    super.initState();
    stateController.initialize();
    // refresh when ui manager is called so that screen changes
    stateController.addListener((){
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: stateController.appbar,
      body: stateController.currentScreenWidget
       );
  }
}


  