import "package:flutter/material.dart";
import "package:singing_app/data_manager/models/song.dart";
import 'package:singing_app/state_manager/components/osc.dart';
import "package:singing_app/state_manager/state_manager.dart";



class SongScreen extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final SongModel songModel;
	final Function(SongModel, bool) selectSongModel;

  const SongScreen({Key key, this.changeScreen, this.songModel, this.selectSongModel, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
		width: double.infinity,
		height: double.infinity,
		color: Colors.red,
    child: VisualizerWidget(rootnote: 0,),
	);
  }
}
