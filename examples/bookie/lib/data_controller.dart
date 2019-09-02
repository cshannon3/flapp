import 'dart:convert';

import 'package:bookie/models/book.dart';
import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/models/association.dart';
import 'package:bookie/models/readingEvent.dart';
import 'package:bookie/sources/localdb.dart';
import 'package:flutter/services.dart';


class DataController  {
  AppDatabase appDB = AppDatabase.get();
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
    
    Future<List<IdeaNodeModel>> getIdeaNodeList() async{
      List<IdeaNodeModel> em = await appDB.getIdeaNodeList();
      if(em.isEmpty && initialIdeaNodeList.isNotEmpty){await appDB.addIdeaNodeList(initialIdeaNodeList); return initialIdeaNodeList;}
      return em;
    }
    addIdeaNode(IdeaNodeModel newIdeaNode) async{
      await appDB.addIdeaNode(newIdeaNode);return;
    }
    
    Future<List<AssociationModel>> getAssociationList() async{
      List<AssociationModel> em = await appDB.getAssociationList();
      if(em.isEmpty && initialAssociationList.isNotEmpty){await appDB.addAssociationList(initialAssociationList); return initialAssociationList;}
      return em;
    }
    addAssociation(AssociationModel newAssociation) async{
      await appDB.addAssociation(newAssociation);return;
    }
    
    Future<List<ReadingEventModel>> getReadingEventList() async{
      List<ReadingEventModel> em = await appDB.getReadingEventList();
      if(em.isEmpty && initialReadingEventList.isNotEmpty){await appDB.addReadingEventList(initialReadingEventList); return initialReadingEventList;}
      return em;
    }
    addReadingEvent(ReadingEventModel newReadingEvent) async{
      await appDB.addReadingEvent(newReadingEvent);return;
    }
    

}

