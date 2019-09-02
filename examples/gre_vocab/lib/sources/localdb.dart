import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:gre_vocab/models/word.dart';


class AppDatabase  {
      static final AppDatabase _instance = AppDatabase._internal();
      
      factory AppDatabase() => _instance;
      AppDatabase._internal();
      bool didInit = false;
      static Database _database;
      
      static AppDatabase get() { return _instance;}


      Future<Database> getDb() async{

        if (!didInit) await _init();
        return _database;
      }
      Future _init() async{

        Directory documentsDirectory = await getApplicationDocumentsDirectory();
        String path = join(documentsDirectory.path, 'main.db');
        _database = await openDatabase(path, version: 1,onCreate: _onCreate);

      }

  


	void _onCreate(Database db, int version) async {
	await _createWordTable(db);
	didInit = true;
	print('Database was Created!');
}

Future _createWordTable(Database db,) {
	return db.execute('''CREATE TABLE
	${WordModel.tblWord} (
	id INTEGER PRIMARY KEY,
	${WordModel.dbword} TEXT,
	${WordModel.dbsynonyms} BLOB,
	${WordModel.dbdefinition} TEXT,
	${WordModel.dbtype} TEXT,
	${WordModel.dbexample} TEXT,
	${WordModel.dbknow} TEXT,
	${WordModel.dbcorrectAttempts} INTEGER,
	${WordModel.dbincorrectAttempts} INTEGER)'''	);}



  
   Future<List< WordModel>> getWordList() async{

  var db = await getDb();
  List<Map> res = await db.query(WordModel.tblWord);
  return res.map((item) => WordModel.fromDBMap(item)).toList();

}
 
 
 Future addWord(WordModel item,) async{

var db = await getDb();
try {
var res = await db
    .insert(WordModel.tblWord, item.toDBMap());
print("Place added $res");
return res;
}catch(e){
var res = await updateWord(item);
return res;
}
}

 
 Future<List<int>> addWordList(List<WordModel> initWordList) async  {
var db = await getDb();
List<int> ress = [];

for (WordModel e in initWordList) {
try {

int res = await db.insert(WordModel.tblWord, e.toDBMap());
ress.add(res);
} catch (e) {
int res = await updateWord(e);
ress.add(res);
}
}
return ress;
}

 
 Future<int> updateWord(WordModel item,) async{
var db = await getDb();
var res = await db
    .update(WordModel.tblWord, item.toDBMap(), where: "id = ?", whereArgs: [item.id]);
print("Updated $res");
return res;
}

 
 Future deleteWord(int itemID,) async{

var db = await getDb();
try {
var res = await db
    .delete(WordModel.tblWord,  where: "id = ?", whereArgs: [itemID]);
print("deleted");
return res;
}catch(e){ var res = 1; return res;}
}


 
  
}

