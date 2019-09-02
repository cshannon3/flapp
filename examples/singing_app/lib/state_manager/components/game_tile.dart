import "package:flutter/material.dart";
import 'package:singing_app/data_manager/models/game.dart';
import "package:singing_app/state_manager/state_manager.dart";
class GameTile extends StatelessWidget {
  final Function(SCREEN) changeScreen;
	final GameModel gameModel;
	final Function(GameModel, bool) selectGameModel;

  
  const GameTile({Key key, this.changeScreen, this.gameModel, this.selectGameModel, }) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
		onTap: (){selectGameModel(gameModel, false); changeScreen(SCREEN.GAME);},
		title: Text(gameModel.name),
	);
  }
}
