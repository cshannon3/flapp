import "package:flutter/material.dart";
import "package:singing_app/data_manager/models/song.dart";
import "package:singing_app/state_manager/state_manager.dart";
import "package:singing_app/state_manager/components/song_tile.dart";
class SongsScreen extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final List<SongModel> songModels;
	final Function(SongModel, bool) selectSongModel;

  
  const SongsScreen({Key key, this.changeScreen, this.songModels, this.selectSongModel, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
		width: double.infinity,
		height: double.infinity,
		color: Colors.red,
		child:ListView(
			children: List.generate(songModels.length, (i){return SongTile(songModel:songModels[i], selectSongModel:selectSongModel,  changeScreen: changeScreen);}),
		),
	);
  }
}
