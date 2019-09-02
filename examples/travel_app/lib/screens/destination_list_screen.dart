import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/destination_tile.dart';

class DestinationListScreen extends StatelessWidget {
  final Function(SCREEN) changeScreen;
  final Function(DestinationModel, bool) selectDestinationModel;
  final List<DestinationModel> destinationModelList;

  const DestinationListScreen({
    Key key,
    this.changeScreen,
    this.selectDestinationModel,
    this.destinationModelList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListView(
        children: List.generate(destinationModelList.length, (i) {
          return DestinationTile(
              destinationModel: destinationModelList[i],
              selectDestinationModel: selectDestinationModel,
              changeScreen: changeScreen);
        }),
      ),
    );
  }
}
