import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';


import '../models/userRecording.dart';
import '../models/song.dart';
import '../models/note.dart';


class AppDatabase {
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
    _database = await openDatabase(path, version: 2,onCreate: _onCreate);

  }



  
	void _onCreate(Database db, int version) async {
		await _createUserRecordingModelTable(db);
		await _createSongModelTable(db);
		await _createNoteModelTable(db);
		didInit = true;
		print('Database was Created!');
}

Future _createUserRecordingModelTable(Database db,) {
	return db.execute('''CREATE TABLE
	${UserRecordingModel.tblUserRecordingModel} (
	id INTEGER PRIMARY KEY,
	${UserRecordingModel.dbnotes} TEXT,
	${UserRecordingModel.dbsongKey} TEXT,
	${UserRecordingModel.dbsong} INTEGER,
	${UserRecordingModel.dbscore} REAL,
	${UserRecordingModel.dbpitchAccuracy} INTEGER,
	${UserRecordingModel.dbintervalAccuracy} INTEGER,
	${UserRecordingModel.dbtimingAccuracy} INTEGER,
	${UserRecordingModel.dbwordAccuracy} INTEGER)'''	
);
}

Future _createSongModelTable(Database db,) {
	return db.execute('''CREATE TABLE
	${SongModel.tblSongModel} (
	id INTEGER PRIMARY KEY,
	${SongModel.dbname} TEXT,
	${SongModel.dbartist} TEXT,
	${SongModel.dbsongKey} INTEGER,
	${SongModel.dbattempts} INTEGER,
	${SongModel.dbavgScore} REAL,
	${SongModel.dblastTenScore} REAL)'''	
);
}

Future _createNoteModelTable(Database db,) {
	return db.execute('''CREATE TABLE
	${NoteModel.tblNoteModel} (
	id INTEGER PRIMARY KEY,
	${NoteModel.dbdeviation} REAL,
	${NoteModel.dbduration} INTEGER,
  ${NoteModel.dbsamples} INTEGER,
	${NoteModel.dbnote} TEXT)'''	
);
}



  	 Future<List< UserRecordingModel >> getUserRecordingModels() async{
  
		var db = await getDb();
    List<Map> res = await db.query(UserRecordingModel.tblUserRecordingModel);
    return res.map((item) => UserRecordingModel.fromMap(item)).toList();
	
  }
	 Future addUserRecordingModel(UserRecordingModel item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(UserRecordingModel.tblUserRecordingModel, item.toMap());
      print("Place added $res");
      return res;
    }catch(e){
      var res = await updateUserRecordingModel(item);
      return res;
    }
	}
  Future<int> updateUserRecordingModel(UserRecordingModel item,) async{
    var db = await getDb();
    var res = await db
        .update(UserRecordingModel.tblUserRecordingModel, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated $res");
    return res;
  }

	 Future deleteUserRecordingModel(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(UserRecordingModel.tblUserRecordingModel,  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> addUserRecordingModels(List<UserRecordingModel> initUserRecordingModels) async  {
    var db = await getDb();
    List<int> ress = [];

    for (UserRecordingModel e in initUserRecordingModels) {
       try {
       
        int res = await db.insert(UserRecordingModel.tblUserRecordingModel, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await updateUserRecordingModel(e);
        ress.add(res);
      }
    }
    return ress;
  }
  	 Future<List< SongModel >> getSongModels() async{
  
		var db = await getDb();
    List<Map> res = await db.query(SongModel.tblSongModel);
    return res.map((item) => SongModel.fromMap(item)).toList();
	
  }
	 Future addSongModel(SongModel item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(SongModel.tblSongModel, item.toMap());
      print("Place added $res");
      return res;
    }catch(e){
      var res = await updateSongModel(item);
      return res;
    }
	}
  Future<int> updateSongModel(SongModel item,) async{
    var db = await getDb();
    var res = await db
        .update(SongModel.tblSongModel, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated $res");
    return res;
  }

	 Future deleteSongModel(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(SongModel.tblSongModel,  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> addSongModels(List<SongModel> initSongModels) async  {
    var db = await getDb();
    List<int> ress = [];

    for (SongModel e in initSongModels) {
       try {
       
        int res = await db.insert(SongModel.tblSongModel, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await updateSongModel(e);
        ress.add(res);
      }
    }
    return ress;
  }
  	 Future<List< NoteModel >> getNoteModels() async{
  
		var db = await getDb();
    List<Map> res = await db.query(NoteModel.tblNoteModel);
    return res.map((item) => NoteModel.fromMap(item)).toList();
	
  }
	 Future addNoteModel(NoteModel item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(NoteModel.tblNoteModel, item.toMap());
      print("Place added $res");
      return res;
    }catch(e){
      var res = await updateNoteModel(item);
      return res;
    }
	}
  Future<int> updateNoteModel(NoteModel item,) async{
    var db = await getDb();
    var res = await db
        .update(NoteModel.tblNoteModel, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated $res");
    return res;
  }

	 Future deleteNoteModel(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(NoteModel.tblNoteModel,  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> addNoteModels(List<NoteModel> initNoteModels) async  {
    var db = await getDb();
    List<int> ress = [];

    for (NoteModel e in initNoteModels) {
       try {
       
        int res = await db.insert(NoteModel.tblNoteModel, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await updateNoteModel(e);
        ress.add(res);
      }
    }
    return ress;
  }
  

  }
    