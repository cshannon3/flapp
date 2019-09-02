import 'package:bookie/components/ideaNode_form.dart';
import 'package:bookie/components/ideaNode_tile.dart';
import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/shared.dart';
import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/book.dart';

class BookScreen  extends StatefulWidget {
  	final BookModel bookModel;
    final List<IdeaNodeModel> bookIdeas;
	final Function(IdeaNodeModel, bool) selectIdeaNodeModel;
	final Function(SCREEN) changeScreen;

  const BookScreen({Key key, this.bookModel, this.selectIdeaNodeModel, this.changeScreen, this.bookIdeas, }) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool formOpen=false;

  saveIdeaNodeModel(IdeaNodeModel newIdea){
    newIdea.bookId=widget.bookModel.id;
    newIdea.bookTitle=widget.bookModel.title;
    setState(() {
      widget.bookIdeas.add(newIdea); 
    });
    widget.selectIdeaNodeModel(newIdea, true);
  }
      @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
		color: themeBackground,
    child: Column(
      children: <Widget>[
        Text(widget.bookModel.title),
        Text(widget.bookModel.author),
         formOpen?Container():Container(
              height: 150.0,
              width: 100.0,
              child: new Image.asset(
                widget.bookModel.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
  
            Text("Notes"),
            ExpansionTile(
              onExpansionChanged: (isOpen){
                setState(() {
                  formOpen=isOpen;
                });
              },
              title: Text("New Note"),
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: double.infinity,
                  child: IdeaNodeForm(saveIdeaNodeModel:(model) =>saveIdeaNodeModel(model),))
              ],


            ),
            Expanded(
              child: Container(
                child: ListView(
                  	children: List.generate(widget.bookIdeas.length, (i){return IdeaNodeTile( ideaNodeModel: widget.bookIdeas[i], selectIdeaNodeModel: widget.selectIdeaNodeModel,  changeScreen: widget.changeScreen);}),
		),
              ),
            )
      ],
    ),
	);
  }
}

