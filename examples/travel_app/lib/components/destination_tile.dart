import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/destination.dart';
import 'package:flutter/material.dart';


class DestinationTile  extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final DestinationModel destinationModel;
	final Function(DestinationModel, bool) selectDestinationModel;

  const DestinationTile({Key key, this.changeScreen, this.destinationModel, this.selectDestinationModel, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Padding(
		padding: const EdgeInsets.all(8.0),
		child:Container(
			decoration:BoxDecoration(
				color: Colors.blue,
				border: new Border.all(
                color: Colors.green,
                width: 2.0,
                style: BorderStyle.solid
            ),
				borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
			),
			child:ListTile(
				onTap: (){selectDestinationModel(destinationModel, false); changeScreen(SCREEN.DESTINATION);},
				subtitle: Text(destinationModel.country),
				title: Text(destinationModel.name),
			),
		),
	);
  }


}

