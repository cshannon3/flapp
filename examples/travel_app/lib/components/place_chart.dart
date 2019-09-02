import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/place.dart';
import 'package:flutter/material.dart';


class PlaceChart  extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final PlaceModel placeModel;
	final Function(PlaceModel, bool) selectPlaceModel;

  const PlaceChart({Key key, this.changeScreen, this.placeModel, this.selectPlaceModel, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }


}

