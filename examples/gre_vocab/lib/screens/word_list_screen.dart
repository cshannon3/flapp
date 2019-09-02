import 'package:gre_vocab/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/models/word.dart';
import 'package:gre_vocab/components/word_tile.dart';

class WordListScreen extends StatelessWidget {
  final Function(WordModel, bool) selectWordModel;
  final List<WordModel> wordModelList;
  final Function(SCREEN) changeScreen;

  const WordListScreen({
    Key key,
    this.selectWordModel,
    this.wordModelList,
    this.changeScreen,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: ListView(
        children: List.generate(wordModelList.length, (i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: WordTile(
                wordModel: wordModelList[i],
                selectWordModel: selectWordModel,
                changeScreen: changeScreen),
          );
        }),
      ),
    );
  }
}
