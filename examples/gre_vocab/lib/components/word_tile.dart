import 'package:gre_vocab/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/models/word.dart';


class WordTile  extends StatelessWidget {
  	final WordModel wordModel;
	final Function(WordModel, bool) selectWordModel;
	final Function(SCREEN) changeScreen;

  const WordTile({Key key, this.wordModel, this.selectWordModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Padding(
		padding: const EdgeInsets.all(8.0),
		child:Container(
			decoration:BoxDecoration(
				color: Colors.white,
				border: new Border.all(
                color: Colors.green,
                width: 2.0,
                style: BorderStyle.solid
            ),
				borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
			),
			child:ListTile(
				onTap: (){selectWordModel(wordModel, false); changeScreen(SCREEN.WORD);},
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${wordModel.word}"),
              Text(  "type:${wordModel.type}"),
              IconButton(
                icon: Icon(wordModel.know? Icons.check:Icons.check_box_outline_blank),
                onPressed: (){
                  
                },
              )
            ],
          ),
        ),  
				subtitle: Column(
				  children: <Widget>[
				    Padding(
				      padding: const EdgeInsets.all(8.0),
				      child: Text("Syns: ${wordModel.synonyms.toString().substring(1,wordModel.synonyms.toString().length-1)}"),
				    ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(wordModel.definition),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(wordModel.example),
            ),
				  ],
				),
				
			),
		),
	);
  }


}

