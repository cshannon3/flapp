import "package:flutter/material.dart";
import "package:singing_app/state_manager/state_manager.dart";
class HomeScreen extends StatefulWidget {
   	final Function(SCREEN) changeScreen;

      
  const HomeScreen({Key key, this.changeScreen, }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
		width: double.infinity,
		height: double.infinity,
		color: Colors.red,
		child:Container(
			width: 100.0,
			height: 50.0,
		),
	);
  }
}

    