import '../libraries/model_lib.dart';
import '../params.dart';
import '../utils.dart';
import '../widget_info.dart';

class DataModelTemplate extends WidgetInfo {
  List sourceTypes = [];

  DataModelTemplate({String baseName, Map modelData}) {
    className = toModel(baseName);
    modelData["params"]
        .forEach((pname, pdata) => params.add(Param(pname, pdata)));
    sourceTypes = modelData["sourceTypes"] ?? ["default"];
    
    
    classHeader = generateHeader(baseName);
    classConstructor =
        constructor(className: className, params: params, withKey: false, withID: true);
    classBody = body(baseName);
    footer =
        "final List<${toModel(baseName)}> initial${capWord(baseName)}List = [];";


  }

  String generateHeader(String baseName) {
    // Gets the var header from model lib
    String out = "";
    sourceTypes.forEach((sourceType) {
      if (modelHeaderLib.containsKey(sourceType))
          out += modelHeaderLib[sourceType](capWord(baseName), params) + "\n";
    });
    out += modelHeaderLib["default"](className, params) + "\n";
    return out;
  }

  String body(String baseName) {
    String out = "";
    sourceTypes.forEach((sourceType) {
      out += modelLib[sourceType](className, params) + "\n";
    });
    return out;
  }
}




/*
//mapTo()+fromMap();
//filePath="$importPath/models/$baseName.dart";
    String out = "";

    if (sourceTypes.contains("localdb")) {
      out += "static final tbl${capWord(baseName)} = '${capWord(baseName)}';\n";
      out += "\tstatic final dbId = 'id';\n";
      params.forEach((p) {
        out += "\tstatic final db${p.name} = '${p.name}';\n";
      });
    }
    out += "\n\tfinal int id;\n";
    params.forEach((p) {
      out += "\tfinal ${p.type} ${p.name};\n";
    });
    return out;
  String constructor() => '''
    $className({
      ${generateConstructor()}
    });
''';
  String generateConstructor() {
    String out = "";
    out += "this.id,\n";
    params.forEach((p) {
      out += "\t\tthis.${p.name},\n";
    });
    return out;
  }*/

/*
String fromMap()=>
    '''
    $className.fromMap(Map<String, dynamic> map) 
    : ${generateMapFrom()}
  ''';

String generateMapFrom(){
  String out = "id= map['id'],\n";
  params.forEach((p){
    out+="\t\t${p.name} = map['${p.name}'],\n";
  });
  out = out.substring(0, out.lastIndexOf(",")) + ";";
  return out;
}
String mapTo()=>(sourceTypes.contains("localdb"))?
'''
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    ${generateMapTo()}
    return map;
  }
  ''':"";
String generateMapTo(){

  String out = "map[dbId]=id;\n";
  params.forEach((p){
    out+="\t\tmap[db${p.name}]= ${p.name};\n";
  });
  return out;
}
*/
