import 'package:travel_app/models/destination.dart';
import 'package:travel_app/models/place.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';


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
	await _createDestinationTable(db);
	await _createPlaceTable(db);
	didInit = true;
	print('Database was Created!');
}Future _createDestinationTable(Database db,) {
	return db.execute('''CREATE TABLE
	${DestinationModel.tblDestination} (
	id INTEGER PRIMARY KEY,
	${DestinationModel.dbbackdropAssetPath} TEXT,
	${DestinationModel.dbflagAssetPath} TEXT,
	${DestinationModel.dbname} TEXT,
	${DestinationModel.dbcountry} TEXT,
	${DestinationModel.dblat} TEXT,
	${DestinationModel.dblong} TEXT,
	${DestinationModel.dborder} TEXT,
	${DestinationModel.dbstayLength} TEXT)'''	);}

Future _createPlaceTable(Database db,) {
	return db.execute('''CREATE TABLE
	${PlaceModel.tblPlace} (
	id INTEGER PRIMARY KEY,
	${PlaceModel.dbname} TEXT,
	${PlaceModel.dbdestination} TEXT,
	${PlaceModel.dbrating} TEXT,
	${PlaceModel.dbprice} TEXT,
	${PlaceModel.dbaddress} TEXT,
	${PlaceModel.dburl} TEXT,
	${PlaceModel.dbreservation} TEXT,
	${PlaceModel.dbimagePath} TEXT)'''	);}



 	 Future<List< DestinationModel>> getDestinationList() async{
  
		var db = await getDb();
    List<Map> res = await db.query(DestinationModel.tblDestination);
    return res.map((item) => DestinationModel.fromMap(item)).toList();
	
  }
	 Future addDestination(DestinationModel item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(DestinationModel.tblDestination, item.toMap());
      print("Place added $res");
      return res;
    }catch(e){
      var res = await updateDestination(item);
      return res;
    }
	}
  Future<int> updateDestination(DestinationModel item,) async{
    var db = await getDb();
    var res = await db
        .update(DestinationModel.tblDestination, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated $res");
    return res;
  }

	 Future deleteDestination(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(DestinationModel.tblDestination,  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> addDestinationList(List<DestinationModel> initDestinationList) async  {
    var db = await getDb();
    List<int> ress = [];

    for (DestinationModel e in initDestinationList) {
       try {
       
        int res = await db.insert(DestinationModel.tblDestination, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await updateDestination(e);
        ress.add(res);
      }
    }
    return ress;
  }
  

	 Future<List< PlaceModel>> getPlaceList() async{
  
		var db = await getDb();
    List<Map> res = await db.query(PlaceModel.tblPlace);
    return res.map((item) => PlaceModel.fromMap(item)).toList();
	
  }
	 Future addPlace(PlaceModel item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(PlaceModel.tblPlace, item.toMap());
      print("Place added $res");
      return res;
    }catch(e){
      var res = await updatePlace(item);
      return res;
    }
	}
  Future<int> updatePlace(PlaceModel item,) async{
    var db = await getDb();
    var res = await db
        .update(PlaceModel.tblPlace, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated $res");
    return res;
  }

	 Future deletePlace(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(PlaceModel.tblPlace,  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> addPlaceList(List<PlaceModel> initPlaceList) async  {
    var db = await getDb();
    List<int> ress = [];

    for (PlaceModel e in initPlaceList) {
       try {
       
        int res = await db.insert(PlaceModel.tblPlace, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await updatePlace(e);
        ress.add(res);
      }
    }
    return ress;
  }
  



}

