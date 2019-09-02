import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/destination.dart';
import 'package:flutter/material.dart';


class DestinationScreen  extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final DestinationModel destinationModel;
	final Function(DestinationModel, bool) selectDestinationModel;

  const DestinationScreen({Key key, this.changeScreen, this.destinationModel, this.selectDestinationModel, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }


}

