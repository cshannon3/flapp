import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gre_vocab/models/word.dart';
import 'package:gre_vocab/sources/localdb.dart';


class DataController  {
  AppDatabase appDB = AppDatabase.get();
  DataController();
      Future<List<WordModel>> getWordList() async{
      List<WordModel> em = await appDB.getWordList();
      if(em.isEmpty){
            String data = await rootBundle.loadString("assets/word.json");
            final jsonData = json.decode(data);
            jsonData.forEach((item){
              em.add(WordModel.fromMap(item));
            });
            await appDB.addWordList(em); return em;
      }
      
      return em;
    }
    addWord(WordModel newWord) async{
      await appDB.addWord(newWord);return;
    }
    

}

