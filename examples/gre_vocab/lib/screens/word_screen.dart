import 'package:gre_vocab/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/models/word.dart';


class WordScreen  extends StatelessWidget {
  	final WordModel wordModel;
	final Function(WordModel, bool) selectWordModel;
	final Function(SCREEN) changeScreen;

  const WordScreen({Key key, this.wordModel, this.selectWordModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }


}

