import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/ideaNode.dart';


class IdeaNodeScreen  extends StatelessWidget {
  	final IdeaNodeModel ideaNodeModel;
	final Function(IdeaNodeModel, bool) selectIdeaNodeModel;
	final Function(SCREEN) changeScreen;

  const IdeaNodeScreen({Key key, this.ideaNodeModel, this.selectIdeaNodeModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }
}

