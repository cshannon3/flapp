import 'package:bookie/shared.dart';
import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/book.dart';
import 'package:bookie/components/book_tile.dart';


class BookListScreen  extends StatelessWidget {
  	final Function(BookModel, bool) selectBookModel;
	final List<BookModel> bookModelList;
	final Function(SCREEN) changeScreen;

  const BookListScreen({Key key, this.selectBookModel, this.bookModelList, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
      color: themeBackground,
      child: new GridView.builder(
        itemCount: bookModelList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return BookGrid(selectBookModel: selectBookModel,bookModel: bookModelList[index],changeScreen: changeScreen,);
        },
      )
		
	//	child:ListView(
	//children: List.generate(bookModelList.length, (i){return BookTile( bookModel: bookModelList[i], selectBookModel:selectBookModel,  changeScreen: changeScreen);}),
		//),
	);
  }


}

