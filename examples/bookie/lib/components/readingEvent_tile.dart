import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/readingEvent.dart';


class ReadingEventTile  extends StatelessWidget {
  	final ReadingEventModel readingEventModel;
	final Function(ReadingEventModel, bool) selectReadingEventModel;
	final Function(SCREEN) changeScreen;

  const ReadingEventTile({Key key, this.readingEventModel, this.selectReadingEventModel, this.changeScreen, }) : super(key: key);
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
				onTap: (){selectReadingEventModel(readingEventModel, false); changeScreen(SCREEN.READINGEVENT);},
				subtitle: Text('subtitle'),
				title: Text('title'),
			),
		),
	);
  }


}

