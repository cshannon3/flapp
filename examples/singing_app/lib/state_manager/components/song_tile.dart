import "package:flutter/material.dart";
import "package:singing_app/data_manager/models/song.dart";
import "package:singing_app/state_manager/state_manager.dart";
class SongTile extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final SongModel songModel;
	final Function(SongModel, bool) selectSongModel;

  
  const SongTile({Key key, this.changeScreen, this.songModel, this.selectSongModel, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
		onTap: (){selectSongModel(songModel, false); changeScreen(SCREEN.SONG);},
		title: Text(songModel.name),
	);
  }
}
