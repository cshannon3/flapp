import 'package:bookie/shared.dart';
import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/components/ideaNode_tile.dart';


class IdeaNodeListScreen  extends StatelessWidget {
  	final Function(IdeaNodeModel, bool) selectIdeaNodeModel;
	final List<IdeaNodeModel> ideaNodeModelList;
	final Function(SCREEN) changeScreen;

  const IdeaNodeListScreen({Key key, this.selectIdeaNodeModel, this.ideaNodeModelList, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: themeBackground,
		child:ListView(
			children: List.generate(ideaNodeModelList.length, (i){return IdeaNodeTile( ideaNodeModel: ideaNodeModelList[i], selectIdeaNodeModel:selectIdeaNodeModel,  changeScreen: changeScreen);}),
		),
	);
  }


}

