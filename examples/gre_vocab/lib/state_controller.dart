import 'package:gre_vocab/models/word.dart';
import 'package:gre_vocab/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/screens/word_screen.dart';
import 'package:gre_vocab/screens/word_list_screen.dart';

enum SCREEN {
  HOME,
  WORD,
  WORDLIST,
}

class StateController extends ChangeNotifier {
  DataController dataController = DataController();
  SCREEN currentScreen = SCREEN.HOME;
  Widget currentScreenWidget = Container();

  StateController();

  WordModel currentWord;
  List<WordModel> wordList = List();

  initialize() async {
    wordList = await dataController.getWordList();
  }

  AppBar get appbar => buildAppBar();
  void changeScreen(SCREEN newScreen) {
    if (newScreen != currentScreen) {
      currentScreen = newScreen;
      switch (currentScreen) {
        case SCREEN.HOME:
          currentScreenWidget = Container();
          break;

        case SCREEN.WORD:
          currentScreenWidget = WordScreen(
            wordModel: currentWord,
            selectWordModel: changeCurrentWord,
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.WORDLIST:
          currentScreenWidget = WordListScreen(
            selectWordModel: changeCurrentWord,
            wordModelList: wordList,
            changeScreen: changeScreen,
          );
          break;
      }
      notifyListeners();
    }
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text("Vocab App"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: ()=>changeScreen(SCREEN.WORDLIST),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }

  changeCurrentWord(WordModel newWord, bool updateSource) {
    currentWord = newWord;
    if (updateSource) {
      dataController.addWord(newWord);
      wordList.add(newWord);
    }
    notifyListeners();
  }
}
