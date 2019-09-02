import '../libraries/sources_lib.dart';
import '../utils.dart';
import '../widget_info.dart';

class DataSourceTemplate extends WidgetInfo {
  DataSourceTemplate({String sourceType, Map models}) {
    classHeader = sourceHeaderLib[sourceType](models) ?? "";
    switch (sourceType) {
      case "localdb":
        className = "AppDatabase";
        //addGeneralDB();
        classBody = sourceLib[sourceType](models) ?? "";
        packages.addAll([
          PacMan(dirName: "package:path/path", local: false),
          PacMan(dirName: "package:sqflite/sqflite", local: false),
          PacMan(dirName: "package:path_provider/path_provider", local: false),
          PacMan(dirName: "dart:async", local: false, asIs: true),
          PacMan(dirName: "dart:io", local: false, asIs: true)
        ]);
        models.forEach((modelBaseName, modelTemplate) =>
            packages.add(PacMan(fileName: modelBaseName, dirName: "models")));

        break;
      default:
        break;
    }
  }
}

/*
  String addGeneralDB() => '''
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

  ''';

  String body(Map models) => '''
 ${onCreate(models)}

 ${addAllModelFunctions(models)}
''';

  String onCreate(Map models) {
    String out = "\n\tvoid _onCreate(Database db, int version) async {";
    models.forEach((modelBaseName, modelTemplate) {
      packages.add(PacMan(fileName: modelBaseName, dirName: "models"));
      out += "\n\tawait _create${capWord(modelBaseName)}Table(db);";
    });

    out += "\n\tdidInit = true;";
    out += "\n\tprint('Database was Created!');";
    out += "\n}";
    models.forEach((modelBaseName, modelTemplate) {
      out += createTable(modelBaseName, modelTemplate);
      //out+= addDBFunction(modelBaseName, modelTemplate );
    });

    return out;
  }

  String createTable(String modelBaseName, dynamic modelTemplate) {
    String out = "Future _create${capWord(modelBaseName)}Table(Database db,) {";
    out += "\n\treturn db.execute('''CREATE TABLE";
    out +=
        "\n\t\${${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}} (\n\tid INTEGER PRIMARY KEY,";
    modelTemplate.params.forEach((param) {
      out += "\n\t\${${toModel(modelBaseName)}.db${param.name}} TEXT,";
    });
    out += ")'''	);}\n\n";
    return out;
  }

  /*String addAllModelFunctions(Map models) {
    String out = "";
    models.forEach((modelBaseName, modelTemplate) {
      out += sourceLib[sourceType](modelBaseName) ?? "";
      //addDBFunction(modelBaseName, modelTemplate)+"\n\n";
    });

    return out;
  }*/
}



String addDBFunction(String modelBaseName, dynamic modelTemplate){

    return '''
	 Future<List< ${toModel(modelBaseName)}>> get${capWord(modelBaseName)}List() async{
  
		var db = await getDb();
    List<Map> res = await db.query(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)});
    return res.map((item) => ${toModel(modelBaseName)}.fromMap(item)).toList();
	
  }
	 Future add${capWord(modelBaseName)}(${toModel(modelBaseName)} item,) async{

		var db = await getDb();
    try {
      var res = await db
          .insert(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, item.toMap());
      print("Place added \$res");
      return res;
    }catch(e){
      var res = await update${capWord(modelBaseName)}(item);
      return res;
    }
	}
  Future<int> update${capWord(modelBaseName)}(${toModel(modelBaseName)} item,) async{
    var db = await getDb();
    var res = await db
        .update(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, item.toMap(), where: "id = ?", whereArgs: [item.id]);
    print("Updated \$res");
    return res;
  }

	 Future delete${capWord(modelBaseName)}(int itemID,) async{

		var db = await getDb();
		try {
      var res = await db
          .delete(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)},  where: "id = ?", whereArgs: [itemID]);
      print("deleted");
      return res;
    }catch(e){ var res = 1; return res;}
	}


   Future<List<int>> add${capWord(modelBaseName)}List(List<${toModel(modelBaseName)}> init${capWord(modelBaseName)}List) async  {
    var db = await getDb();
    List<int> ress = [];

    for (${toModel(modelBaseName)} e in init${capWord(modelBaseName)}List) {
       try {
       
        int res = await db.insert(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, e.toMap());
        ress.add(res);
      } catch (e) {
        int res = await update${capWord(modelBaseName)}(e);
        ress.add(res);
      }
    }
    return ress;
  }
  ''';
  }
 */
// ,Function({String fileName, String dirName}) getPackagePath })
//   :super(getPackagePath:getPackagePath)//, String importPath
//filePath = "$importPath/sources/$sourceType.dart";
