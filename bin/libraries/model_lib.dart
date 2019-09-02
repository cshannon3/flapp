import '../params.dart';

String generateTo({List<Param> params, bool withID = true, String i = ""}) {
  String out = "map['${i}Id']=id;\n";
  params.forEach((p) {
    out += "\t\tmap['$i${p.name}']=${p.name};\n";
  });
 
  return out;
}

String generateFrom({List<Param> params, bool withID = true, String i = ""}) {
  String out = "id= map[${i}Id],\n";
  params.forEach((p){
    if (i=="db") out+="\t\t${p.name} = map[$i${p.name}],\n";
    else out+="\t\t${p.name} = map['$i${p.name}'],\n";
  });
  out = out.substring(0, out.lastIndexOf(",")) + ";";
  return out;
}

Map<String, dynamic> modelHeaderLib = {
  "default": (String baseName, List<Param> params) {
    String out = '';
    out += "\n\tfinal int id;\n";
    params.forEach((p) {
      out += "\tfinal ${p.type} ${p.name};\n";
    });
    return out;
  },
  "localdb": (String tableName, List<Param> params) {
    String out = '';
    out += "static final tbl$tableName = '$tableName';\n";
    out += "\tstatic final dbId = 'id';\n";
    params.forEach((p) {
      out += "\tstatic final db${p.name} = '${p.name}';\n";
    });
    return out;
  }
  // "fromJson",
};
Map<String, dynamic> modelLib = {
  "localdb": (String className, List<Param> params) => '''
    
    Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    ${generateTo(params: params)}
    return map;
  }
  
    $className.fromDBMap(Map<String, dynamic> map) 
    : ${generateFrom(params: params, i: "db")}
  ''',
  "jsonData": (String className, List<Param> params) => '''
    
    $className.fromMap(Map<String, dynamic> map) 
    : ${generateFrom(params: params)}
  '''



  // "fromJson",
};
/*
"toDBMap": (List<Param> params)=>  '''
  Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    ${generateDBTo(params)}
    return map;
  }
  ''',
  */
