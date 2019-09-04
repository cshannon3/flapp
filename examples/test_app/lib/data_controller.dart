import 'package:test_app/models/book.dart';
//import '.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class DataController  {
  //AppDatabase appDB = AppDatabase.get();
  DataController();
  
    Future<List<BookModel>> getBookList() async{
      List<BookModel> em = [];
      String data = await rootBundle.loadString("assets/book.json");
      final jsonData = json.decode(data);
      jsonData.forEach((item){
        em.add(BookModel.fromMap(item));
      });
      return em;
    }
    addBook(BookModel newBook) async{}
    

}

