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



