import '../utils.dart';

Map<String, dynamic> sourceHeaderLib = {
  "localdb": (Map models) =>(addGeneralDB()+"\n\n"+ onCreate(models)+"\n")

};
Map<String, dynamic> sourceLib = {
  "localdb": (Map models) {
    String out = "";
    models.forEach((modelBaseName, modelTemplate) {
      out += dbFunctions(modelBaseName);
    });
    return out;
  }
};

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
String onCreate(Map models) {
  String out = "\n\tvoid _onCreate(Database db, int version) async {";
  models.forEach((modelBaseName, modelTemplate) {
    out += "\n\tawait _create${capWord(modelBaseName)}Table(db);";
  });
  out += "\n\tdidInit = true;\n\tprint('Database was Created!');\n}\n\n";
  models.forEach((modelBaseName, modelTemplate) {
    out += createTable(modelBaseName, modelTemplate);
  });

  return out;
}

String createTable(String modelBaseName, dynamic modelTemplate) {
  String out = "Future _create${capWord(modelBaseName)}Table(Database db,) {";
  out += "\n\treturn db.execute('''CREATE TABLE";
  out +=
      "\n\t\${${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}} (\n\tid INTEGER PRIMARY KEY,";
  modelTemplate.params.forEach((param) {
    out += "\n\t\${${toModel(modelBaseName)}.db${param.name}} ${getDBType(param.type)},";
  });
  out = out.substring(0, out.lastIndexOf(",")) + ")'''	);}\n\n";
  return out;
}

String dbFunctions(String modelBaseName) {
  String getAll() => '''
Future<List< ${toModel(modelBaseName)}>> get${capWord(modelBaseName)}List() async{

  var db = await getDb();
  List<Map> res = await db.query(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)});
  return res.map((item) => ${toModel(modelBaseName)}.fromDBMap(item)).toList();

}
''';

  String addOne() => '''
Future add${capWord(modelBaseName)}(${toModel(modelBaseName)} item,) async{

var db = await getDb();
try {
var res = await db
    .insert(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, item.toDBMap());
print("Place added \$res");
return res;
}catch(e){
var res = await update${capWord(modelBaseName)}(item);
return res;
}
}
''';
  updateOne() => '''
Future<int> update${capWord(modelBaseName)}(${toModel(modelBaseName)} item,) async{
var db = await getDb();
var res = await db
    .update(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, item.toDBMap(), where: "id = ?", whereArgs: [item.id]);
print("Updated \$res");
return res;
}
''';
  String deleteOne() => '''
Future delete${capWord(modelBaseName)}(int itemID,) async{

var db = await getDb();
try {
var res = await db
    .delete(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)},  where: "id = ?", whereArgs: [itemID]);
print("deleted");
return res;
}catch(e){ var res = 1; return res;}
}

''';
  String addAll() => '''
Future<List<int>> add${capWord(modelBaseName)}List(List<${toModel(modelBaseName)}> init${capWord(modelBaseName)}List) async  {
var db = await getDb();
List<int> ress = [];

for (${toModel(modelBaseName)} e in init${capWord(modelBaseName)}List) {
try {

int res = await db.insert(${toModel(modelBaseName)}.tbl${capWord(modelBaseName)}, e.toDBMap());
ress.add(res);
} catch (e) {
int res = await update${capWord(modelBaseName)}(e);
ress.add(res);
}
}
return ress;
}
''';

  return '''
 ${getAll()} 
 
 ${addOne()}
 
 ${addAll()}
 
 ${updateOne()}
 
 ${deleteOne()}
 
  ''';
}


String getDBType(String paramType){
  if (paramType=="int")return "INTEGER";
  if(paramType=="double")return "REAL";
  if(paramType.contains("List"))return "BLOB";
  return "TEXT";
}