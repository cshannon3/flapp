import 'package:bookie/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookie/models/book.dart';

class BookGrid extends StatelessWidget {
  final BookModel bookModel;
	final Function(BookModel, bool) selectBookModel;
	final Function(SCREEN) changeScreen;

  const BookGrid({Key key, this.bookModel, this.selectBookModel, this.changeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: new GestureDetector(
              child:  new Image.asset(
                  bookModel.imgUrl,
                  fit: BoxFit.fill,
                ),
                	onTap: (){selectBookModel(bookModel, false); changeScreen(SCREEN.BOOK);},
      ),
    );
  }
}
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
      height: 100.0,
			decoration:BoxDecoration(
				color: Colors.blue,
				border: new Border.all(
                color: Colors.green,
                width: 2.0,
                style: BorderStyle.solid
            ),
			//	borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
			),
			child:ListTile(
        
        leading: Container(
              
              //width: 80.0,
              child: new Image.asset(
                bookModel.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
				onTap: (){selectBookModel(bookModel, false); changeScreen(SCREEN.BOOK);},
				subtitle: Text(bookModel.title),
				title: Padding(
				  padding: const EdgeInsets.all(8.0),
				  child: Text(bookModel.author),
				),
			),
		),
	);
  }


}

