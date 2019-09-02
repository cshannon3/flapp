import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/readingEvent.dart';


class ReadingEventScreen  extends StatelessWidget {
  	final ReadingEventModel readingEventModel;
	final Function(ReadingEventModel, bool) selectReadingEventModel;
	final Function(SCREEN) changeScreen;

  const ReadingEventScreen({Key key, this.readingEventModel, this.selectReadingEventModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }
}

