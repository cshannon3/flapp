import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/readingEvent.dart';
import 'package:bookie/components/readingEvent_tile.dart';


class ReadingEventListScreen  extends StatelessWidget {
  	final Function(ReadingEventModel, bool) selectReadingEventModel;
	final List<ReadingEventModel> readingEventModelList;
	final Function(SCREEN) changeScreen;

  const ReadingEventListScreen({Key key, this.selectReadingEventModel, this.readingEventModelList, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.red,
		child:ListView(
			children: List.generate(readingEventModelList.length, (i){return ReadingEventTile( readingEventModel: readingEventModelList[i], selectReadingEventModel:selectReadingEventModel,  changeScreen: changeScreen);}),
		),
	);
  }


}

