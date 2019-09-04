import 'package:test_app/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/book.dart';


class BookScreen  extends StatelessWidget {
  	final BookModel bookModel;
	final Function(BookModel, bool) selectBookModel;
	final Function(SCREEN) changeScreen;

  const BookScreen({Key key, this.bookModel, this.selectBookModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Container(
		color: Colors.blue,
	);
  }


}

