


import 'package:flutter/material.dart';

import "package:singing_app/data_manager/models/game.dart";
import "package:singing_app/state_manager/state_manager.dart";
import "package:singing_app/state_manager/components/game_tile.dart";
class GamesScreen extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final List<GameModel> gameModels;
	final Function(GameModel, bool) selectGameModel;

  
  const GamesScreen({Key key, this.changeScreen, this.gameModels, this.selectGameModel, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
		width: double.infinity,
		height: double.infinity,
		color: Colors.red,
		child:ListView(
			children: List.generate(gameModels.length, (i){return GameTile( gameModel: gameModels[i], selectGameModel:selectGameModel,  changeScreen: changeScreen);}),
		),
	);
  }
}



// games will be stay on note,
// get the interval 
// stepper