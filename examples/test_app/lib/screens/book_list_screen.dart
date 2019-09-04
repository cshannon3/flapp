import 'package:test_app/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/book.dart';
import 'package:test_app/components/book_tile.dart';


class BookListScreen  extends StatelessWidget {
  	final Function(BookModel, bool) selectBookModel;
	final List<BookModel> bookModelList;
	final Function(SCREEN) changeScreen;

  const BookListScreen({Key key, this.selectBookModel, this.bookModelList, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.red,
		child:ListView(
			children: List.generate(bookModelList.length, (i){return BookTile( bookModel: bookModelList[i], selectBookModel:selectBookModel,  changeScreen: changeScreen);}),
		),
	);
  }


}

