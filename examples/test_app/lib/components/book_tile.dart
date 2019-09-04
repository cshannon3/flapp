import 'package:test_app/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/book.dart';


class BookTile  extends StatelessWidget {
  	final BookModel bookModel;
	final Function(BookModel, bool) selectBookModel;
	final Function(SCREEN) changeScreen;

  const BookTile({Key key, this.bookModel, this.selectBookModel, this.changeScreen, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
    return Padding(
		padding: const EdgeInsets.all(8.0),
		child:Container(
			decoration:BoxDecoration(
				color: Colors.blue,
				border: new Border.all(
                color: Colors.green,
                width: 2.0,
                style: BorderStyle.solid
            ),
				borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
			),
			child:ListTile(
				onTap: (){selectBookModel(bookModel, false); changeScreen(SCREEN.BOOK);},
				subtitle: Text('subtitle'),
				title: Text('title'),
			),
		),
	);
  }


}

