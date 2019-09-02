import "package:flutter/material.dart";
import 'package:singing_app/data_manager/models/game.dart';
import "package:singing_app/data_manager/models/userRecording.dart";
import "package:singing_app/data_manager/models/song.dart";
import "package:singing_app/data_manager/models/note.dart";
import "package:singing_app/data_manager/data_manager.dart";
import 'package:singing_app/state_manager/screens/charts.dart';
import 'package:singing_app/state_manager/screens/game.dart';
import 'package:singing_app/state_manager/screens/games.dart';
import "package:singing_app/state_manager/state_manager.dart";
import "package:singing_app/state_manager/screens/home.dart";
import "package:singing_app/state_manager/screens/songs.dart";
import "package:singing_app/state_manager/screens/song.dart";
import 'package:charts_flutter/flutter.dart' as charts;
enum SCREEN { HOME, SONGS, SONG, GAME, GAMES }

class StateManager extends ChangeNotifier {
  StateManager();

  DataManager dataManager = DataManager();
  SCREEN currentScreen = SCREEN.HOME;
  Widget currentScreenWidget = HomeScreen();

  UserRecordingModel currentUserRecordingModel;
  List<UserRecordingModel> allUserRecordingModels = List();
  SongModel currentSongModel;
  List<SongModel> allSongModels = List();
  NoteModel currentNoteModel;
  List<NoteModel> allNoteModels = List();
  GameModel currentGameModel;
  List<GameModel> allGameModels = List();

  initialize() async {
    allUserRecordingModels = await dataManager.getUserRecordingModels();
    allSongModels = await dataManager.getSongModels();
    allNoteModels = await dataManager.getNoteModels();
    allGameModels = initialGameModels;
    currentGameModel = allGameModels[0];
  }

  AppBar get appbar => buildAppBar();
  void changeScreen(SCREEN newScreen) {
    if (newScreen != currentScreen) {
      currentScreen = newScreen;
      switch (currentScreen) {
        case SCREEN.HOME:
          currentScreenWidget = HomeScreen(
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.SONGS:
          currentScreenWidget = SongsScreen(
            changeScreen: changeScreen,
            songModels: allSongModels,
            selectSongModel: changeCurrentSongModel,
          );
          break;
        case SCREEN.SONG:
          currentScreenWidget = SongScreen(
            changeScreen: changeScreen,
            selectSongModel: changeCurrentSongModel,
          );
          break;

        case SCREEN.GAME:
         currentScreenWidget = GameScreen(
            changeScreen: changeScreen,
            gameModel: currentGameModel,
            
           
          );
          // TODO: Handle this case.
          break;
        case SCREEN.GAMES:
        
      
         currentScreenWidget = GamesScreen(
            changeScreen: changeScreen,
            gameModels: allGameModels,
            selectGameModel: changeCurrentGameModel,
          );
          // TODO: Handle this case.
          break;
      }
      notifyListeners();
    }
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text("Music"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {
          changeScreen(SCREEN.HOME);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            changeScreen(SCREEN.SONGS);
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            changeScreen(SCREEN.GAMES);
          },
        ),
      ],
    );
  }

  changeCurrentGameModel(
    GameModel newGameModel,
    bool updateSource,
  ) {
    currentGameModel = newGameModel;
    notifyListeners();
  }

  changeCurrentUserRecordingModel(
    UserRecordingModel newUserRecordingModel,
    bool updateSource,
  ) {
    currentUserRecordingModel = newUserRecordingModel;
    if (updateSource) {
      dataManager.addUserRecordingModel(newUserRecordingModel);
      allUserRecordingModels.add(newUserRecordingModel);
    }
    notifyListeners();
  }

  changeCurrentSongModel(
    SongModel newSongModel,
    bool updateSource,
  ) {
    currentSongModel = newSongModel;
    if (updateSource) {
      dataManager.addSongModel(newSongModel);
      allSongModels.add(newSongModel);
    }
    notifyListeners();
  }

  changeCurrentNoteModel(
    NoteModel newNoteModel,
    bool updateSource,
  ) {
    currentNoteModel = newNoteModel;
    if (updateSource) {
      dataManager.addNoteModel(newNoteModel);
      allNoteModels.add(newNoteModel);
    }
    notifyListeners();
  }
}
