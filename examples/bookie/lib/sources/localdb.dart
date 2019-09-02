import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:bookie/models/ideaNode.dart';
import 'package:bookie/models/association.dart';
import 'package:bookie/models/readingEvent.dart';


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
        _database = await openDatabase(path, version: 3,onCreate: _onCreate);

      }

  


	void _onCreate(Database db, int version) async {
	await _createIdeaNodeTable(db);
	await _createAssociationTable(db);
	await _createReadingEventTable(db);
	didInit = true;
	print('Database was Created!');
}

Future _createIdeaNodeTable(Database db,) {
	return db.execute('''CREATE TABLE
	${IdeaNodeModel.tblIdeaNode} (
	id INTEGER PRIMARY KEY,
	${IdeaNodeModel.dbtext} TEXT,
	${IdeaNodeModel.dbbookId} INTEGER,
  ${IdeaNodeModel.dbbookTitle} TEXT,
	${IdeaNodeModel.dbpage} INTEGER,
	${IdeaNodeModel.dbchapter} INTEGER,
	${IdeaNodeModel.dbtype} TEXT,
	${IdeaNodeModel.dbcategory} TEXT,
	${IdeaNodeModel.dbassociatons} BLOB)'''	);}

Future _createAssociationTable(Database db,) {
	return db.execute('''CREATE TABLE
	${AssociationModel.tblAssociation} (
	id INTEGER PRIMARY KEY,
	${AssociationModel.dbbookFromId} INTEGER,
	${AssociationModel.dbchapterFrom} TEXT,
	${AssociationModel.dbideaNodeFromId} INTEGER,
	${AssociationModel.dbbookToId} INTEGER,
	${AssociationModel.dbchapterTo} TEXT,
	${AssociationModel.dbideaNodeToId} INTEGER,
	${AssociationModel.dbstrength} REAL)'''	);}

Future _createReadingEventTable(Database db,) {
	return db.execute('''CREATE TABLE
	${ReadingEventModel.tblReadingEvent} (
	id INTEGER PRIMARY KEY,
	${ReadingEventModel.dbbookId} INTEGER,
	${ReadingEventModel.dbpageStart} INTEGER,
	${ReadingEventModel.dbpageEnd} INTEGER,
	${ReadingEventModel.dbtimeStart} TEXT,
	${ReadingEventModel.dbtimeEnd} TEXT)'''	);}



  
   Future<List< IdeaNodeModel>> getIdeaNodeList() async{

  var db = await getDb();
  List<Map> res = await db.query(IdeaNodeModel.tblIdeaNode);
  return res.map((item) => IdeaNodeModel.fromDBMap(item)).toList();

}
 
 
 Future addIdeaNode(IdeaNodeModel item,) async{

var db = await getDb();
try {
var res = await db
    .insert(IdeaNodeModel.tblIdeaNode, item.toDBMap());
print("Place added $res");
return res;
}catch(e){
var res = await updateIdeaNode(item);
return res;
}
}

 
 Future<List<int>> addIdeaNodeList(List<IdeaNodeModel> initIdeaNodeList) async  {
var db = await getDb();
List<int> ress = [];

for (IdeaNodeModel e in initIdeaNodeList) {
try {

int res = await db.insert(IdeaNodeModel.tblIdeaNode, e.toDBMap());
ress.add(res);
} catch (e) {
int res = await updateIdeaNode(e);
ress.add(res);
}
}
return ress;
}

 
 Future<int> updateIdeaNode(IdeaNodeModel item,) async{
var db = await getDb();
var res = await db
    .update(IdeaNodeModel.tblIdeaNode, item.toDBMap(), where: "id = ?", whereArgs: [item.id]);
print("Updated $res");
return res;
}

 
 Future deleteIdeaNode(int itemID,) async{

var db = await getDb();
try {
var res = await db
    .delete(IdeaNodeModel.tblIdeaNode,  where: "id = ?", whereArgs: [itemID]);
print("deleted");
return res;
}catch(e){ var res = 1; return res;}
}


 
   Future<List< AssociationModel>> getAssociationList() async{

  var db = await getDb();
  List<Map> res = await db.query(AssociationModel.tblAssociation);
  return res.map((item) => AssociationModel.fromDBMap(item)).toList();

}
 
 
 Future addAssociation(AssociationModel item,) async{

var db = await getDb();
try {
var res = await db
    .insert(AssociationModel.tblAssociation, item.toDBMap());
print("Place added $res");
return res;
}catch(e){
var res = await updateAssociation(item);
return res;
}
}

 
 Future<List<int>> addAssociationList(List<AssociationModel> initAssociationList) async  {
var db = await getDb();
List<int> ress = [];

for (AssociationModel e in initAssociationList) {
try {

int res = await db.insert(AssociationModel.tblAssociation, e.toDBMap());
ress.add(res);
} catch (e) {
int res = await updateAssociation(e);
ress.add(res);
}
}
return ress;
}

 
 Future<int> updateAssociation(AssociationModel item,) async{
var db = await getDb();
var res = await db
    .update(AssociationModel.tblAssociation, item.toDBMap(), where: "id = ?", whereArgs: [item.id]);
print("Updated $res");
return res;
}

 
 Future deleteAssociation(int itemID,) async{

var db = await getDb();
try {
var res = await db
    .delete(AssociationModel.tblAssociation,  where: "id = ?", whereArgs: [itemID]);
print("deleted");
return res;
}catch(e){ var res = 1; return res;}
}


 
   Future<List< ReadingEventModel>> getReadingEventList() async{

  var db = await getDb();
  List<Map> res = await db.query(ReadingEventModel.tblReadingEvent);
  return res.map((item) => ReadingEventModel.fromDBMap(item)).toList();

}
 
 
 Future addReadingEvent(ReadingEventModel item,) async{

var db = await getDb();
try {
var res = await db
    .insert(ReadingEventModel.tblReadingEvent, item.toDBMap());
print("Place added $res");
return res;
}catch(e){
var res = await updateReadingEvent(item);
return res;
}
}

 
 Future<List<int>> addReadingEventList(List<ReadingEventModel> initReadingEventList) async  {
var db = await getDb();
List<int> ress = [];

for (ReadingEventModel e in initReadingEventList) {
try {

int res = await db.insert(ReadingEventModel.tblReadingEvent, e.toDBMap());
ress.add(res);
} catch (e) {
int res = await updateReadingEvent(e);
ress.add(res);
}
}
return ress;
}

 
 Future<int> updateReadingEvent(ReadingEventModel item,) async{
var db = await getDb();
var res = await db
    .update(ReadingEventModel.tblReadingEvent, item.toDBMap(), where: "id = ?", whereArgs: [item.id]);
print("Updated $res");
return res;
}

 
 Future deleteReadingEvent(int itemID,) async{

var db = await getDb();
try {
var res = await db
    .delete(ReadingEventModel.tblReadingEvent,  where: "id = ?", whereArgs: [itemID]);
print("deleted");
return res;
}catch(e){ var res = 1; return res;}
}


 
  
}

