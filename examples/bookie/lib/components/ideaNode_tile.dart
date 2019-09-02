import 'package:bookie/shared.dart';
import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/ideaNode.dart';


class IdeaNodeTile  extends StatelessWidget {
  	final IdeaNodeModel ideaNodeModel;
	final Function(IdeaNodeModel, bool) selectIdeaNodeModel;
	final Function(SCREEN) changeScreen;

  const IdeaNodeTile({Key key, this.ideaNodeModel, this.selectIdeaNodeModel, this.changeScreen, }) : super(key: key);
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
				onTap: (){selectIdeaNodeModel(ideaNodeModel, false); changeScreen(SCREEN.IDEANODE);},
				subtitle: Text(ideaNodeModel.text),
        leading: Container(child: typeIcons[ideaNodeModel.type]??Icon(Icons.question_answer),),
				title: Text("${ideaNodeModel.category}  ${ideaNodeModel.bookTitle}"),
			),
		),
	);
  }


}

