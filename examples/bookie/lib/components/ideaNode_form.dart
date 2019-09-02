import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/book.dart';

import '../shared.dart';


class IdeaNodeForm  extends StatefulWidget {
	final Function(IdeaNodeModel) saveIdeaNodeModel;
	//final Function(SCREEN) changeScreen;

  const IdeaNodeForm({Key key, this.saveIdeaNodeModel }) : super(key: key);

  @override
  _IdeaNodeState createState() => _IdeaNodeState();
}

class _IdeaNodeState extends State<IdeaNodeForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  IdeaNodeModel ideaModel= IdeaNodeModel();

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
    //  showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
      print(ideaModel.category);
      widget.saveIdeaNodeModel(ideaModel);

   
    }
  }  
      @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                    new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Note',
                      labelText: 'Note',
                    ),
                    onSaved: (val) => ideaModel.text = val,
                  ),
                  new DropdownButton(
                    value: (categories.contains(ideaModel.category))?categories.indexOf(ideaModel.category):0,
                      hint: new Text('Select Category'),
                      items: List.generate(categories.length, (i)=>
                      DropdownMenuItem(
                        child: new Text(categories[i]),
                        value: i,
                      )),
                      onChanged: (value){
                        setState(() {
                          ideaModel.category=categories[value];
                        });
                      },
                      isExpanded: true,
                    ),
                   new DropdownButton(
                    value: (categories.contains(ideaModel.type))?types.indexOf(ideaModel.type):0,
                      hint: new Text('Select Type'),
                      items: List.generate(types.length, (i)=>
                      DropdownMenuItem(
                        child: new Text(types[i]),
                        value: i,
                      )),
                      onChanged: (value){
                        setState(() {
                          ideaModel.type=types[value];
                        });
                      },
                      isExpanded: true,
                    ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Chapter',
                      labelText: 'chapter',
                    ),
                    onSaved: (val) => ideaModel.chapter = int.parse(val),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Page',
                      labelText: 'Page',
                    ),
                    onSaved: (val) => ideaModel.page = int.parse(val),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: _submitForm,
                      )),
                ]
      ),
    );
  }
}

/*
List<DropdownMenuItem<int>>.generate(categories.length, (i){
                        return DropdownMenuItem(
                            child: new Text(categories[i]),
                            value: i,
                          );
                      }),
                      value: (ideaModel.category!=null)?categories.indexOf(ideaModel.category):0,
                      onChanged: (value) {
                        setState(() {
                          ideaModel.category = categories[value];
                        });
                      },
*/