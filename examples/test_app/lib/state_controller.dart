import 'package:test_app/models/book.dart';
import 'package:test_app/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/book_screen.dart';
import 'package:test_app/screens/book_list_screen.dart';

enum SCREEN { HOME, BOOK, BOOKLIST,  }
class StateController  extends ChangeNotifier {
      DataController dataController = DataController();
    SCREEN currentScreen = SCREEN.HOME;
    Widget currentScreenWidget = Container();

  StateController();
  
    	BookModel currentBook;
	List<BookModel> bookList = List();


    initialize() async {
      	bookList = await dataController.getBookList();

    }

    AppBar get appbar => buildAppBar();
    void changeScreen(SCREEN newScreen) {
      if (newScreen != currentScreen) {
        currentScreen = newScreen;
        switch (currentScreen) {
          case SCREEN.HOME:
            currentScreenWidget = Container(); 
          break;

        case SCREEN.BOOK:
          currentScreenWidget = BookScreen(
            bookModel: currentBook,
selectBookModel: changeCurrentBook,
changeScreen: changeScreen,

          ); 
          break;
        case SCREEN.BOOKLIST:
          currentScreenWidget = BookListScreen(
            selectBookModel: changeCurrentBook,
bookModelList: bookList,
changeScreen: changeScreen,

          ); 
          break;

        }
        notifyListeners();
      }
    }
      Widget buildAppBar() {
    return AppBar(
      title: Text("App Title"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
           // changeScreen(SCREENS.);
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
          },
        ),
      ],
    );
  }
    

    
  changeCurrentBook(BookModel newBook,bool updateSource) {

    currentBook=newBook;
    if(updateSource){
      dataController.addBook(newBook);
      bookList.add(newBook);
      }
      notifyListeners();
    }
      
    
}

