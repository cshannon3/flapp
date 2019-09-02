import "package:flutter/material.dart";
import 'package:singing_app/data_manager/models/game.dart';
import "package:singing_app/data_manager/models/song.dart";
import 'package:singing_app/state_manager/components/osc.dart';
import "package:singing_app/state_manager/state_manager.dart";
class GameScreen extends StatelessWidget {
  final Function(SCREEN) changeScreen;
	final GameModel gameModel;
	final Function(GameModel, bool) selectGameModel;

  const GameScreen({Key key, this.changeScreen, this.gameModel, this.selectGameModel,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
		width: double.infinity,
		height: double.infinity,
	//	color: Colors.red,
    child: VisualizerWidget(rootnote: 0,),
	);
  }
}
