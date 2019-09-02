import 'package:bookie/models/book.dart';
import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/models/association.dart';
import 'package:bookie/models/readingEvent.dart';
import 'package:bookie/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/screens/book_screen.dart';
import 'package:bookie/screens/book_list_screen.dart';
import 'package:bookie/screens/ideaNode_screen.dart';
import 'package:bookie/screens/ideaNode_list_screen.dart';
import 'package:bookie/screens/readingEvent_screen.dart';
import 'package:bookie/screens/readingEvent_list_screen.dart';

enum SCREEN {
  HOME,
  BOOK,
  BOOKLIST,
  IDEANODE,
  IDEANODELIST,
  READINGEVENT,
  READINGEVENTLIST,
}

class StateController extends ChangeNotifier {
  DataController dataController = DataController();
  SCREEN currentScreen = SCREEN.HOME;
  

  StateController();
  Widget currentScreenWidget; //= HomeScreen();

  BookModel currentBook;
  List<BookModel> bookList = List();
  IdeaNodeModel currentIdeaNode;
  List<IdeaNodeModel> ideanodeList = List();
  AssociationModel currentAssociation;
  List<AssociationModel> associationList = List();
  ReadingEventModel currentReadingEvent;
  List<ReadingEventModel> readingeventList = List();

  initialize() async {
    currentScreenWidget = HomeScreen(changeScreen: changeScreen,);
    bookList = await dataController.getBookList();
    ideanodeList = await dataController.getIdeaNodeList();
    associationList = await dataController.getAssociationList();
    readingeventList = await dataController.getReadingEventList();
    //changeScreen(newScreen)
  }

  AppBar get appbar => buildAppBar();
  void changeScreen(SCREEN newScreen) {
    if (newScreen != currentScreen) {
      currentScreen = newScreen;
      switch (currentScreen) {
        case SCREEN.HOME:
          currentScreenWidget =HomeScreen(
            changeScreen: changeScreen,
          );
          break;

        case SCREEN.BOOK:
          currentScreenWidget = BookScreen(
            bookModel: currentBook,
            selectIdeaNodeModel: changeCurrentIdeaNode,
            changeScreen: changeScreen,
            bookIdeas: ideanodeList.where((ideaNode)=>ideaNode.bookId==currentBook.id).toList(),
          );
          break;
        case SCREEN.BOOKLIST:
          currentScreenWidget = BookListScreen(
            selectBookModel: changeCurrentBook,
            bookModelList: bookList,
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.IDEANODE:
          currentScreenWidget = IdeaNodeScreen(
            ideaNodeModel: currentIdeaNode,
            selectIdeaNodeModel: changeCurrentIdeaNode,
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.IDEANODELIST:
          currentScreenWidget = IdeaNodeListScreen(
            selectIdeaNodeModel: changeCurrentIdeaNode,
            ideaNodeModelList: ideanodeList,
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.READINGEVENT:
          currentScreenWidget = ReadingEventScreen(
            readingEventModel: currentReadingEvent,
            selectReadingEventModel: changeCurrentReadingEvent,
            changeScreen: changeScreen,
          );
          break;
        case SCREEN.READINGEVENTLIST:
          currentScreenWidget = ReadingEventListScreen(
            selectReadingEventModel: changeCurrentReadingEvent,
            readingEventModelList: readingeventList,
            changeScreen: changeScreen,
          );
          break;
      }
      notifyListeners();
    }
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text("Bookie"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {
          
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            changeScreen(SCREEN.HOME);
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }

  changeCurrentBook(BookModel newBook, bool updateSource) {
    currentBook = newBook;
    if (updateSource) {
      dataController.addBook(newBook);
      bookList.add(newBook);
    }
    notifyListeners();
  }

  changeCurrentIdeaNode(IdeaNodeModel newIdeaNode, bool updateSource) {
    currentIdeaNode = newIdeaNode;
    if (updateSource) {
      dataController.addIdeaNode(newIdeaNode);
      ideanodeList.add(newIdeaNode);
    }
    notifyListeners();
  }

  changeCurrentAssociation(AssociationModel newAssociation, bool updateSource) {
    currentAssociation = newAssociation;
    if (updateSource) {
      dataController.addAssociation(newAssociation);
      associationList.add(newAssociation);
    }
    notifyListeners();
  }

  changeCurrentReadingEvent(
      ReadingEventModel newReadingEvent, bool updateSource) {
    currentReadingEvent = newReadingEvent;
    if (updateSource) {
      dataController.addReadingEvent(newReadingEvent);
      readingeventList.add(newReadingEvent);
    }
    notifyListeners();
  }
}


class HomeScreen extends StatelessWidget {
  final Function(SCREEN) changeScreen;

  const HomeScreen({Key key, this.changeScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text("Book List"),
                  onPressed: ()=>changeScreen(SCREEN.BOOKLIST),
                ),
              ),
            ),
            ),
            Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text("Notes"),
                  onPressed: ()=>changeScreen(SCREEN.IDEANODELIST),
                ),
              ),
            ),
            ),
            Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text("Reading History"),
                  onPressed: ()=>changeScreen(SCREEN.READINGEVENT),
                ),
              ),
            ),
            ),
        ],
      ),
      
    );
  }
}