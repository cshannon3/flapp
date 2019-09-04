import '../libraries/model_lib.dart';
import '../params.dart';
import '../utils.dart' as u;
import '../widget_info.dart';

class DataModelTemplate extends WidgetInfo {
  List sourceTypes = [];

  DataModelTemplate({String baseName, Map modelData}) {
    className = u.toModel(baseName);
    modelData["params"]
        .forEach((pname, pdata) => params.add(Param(pname, pdata)));
    sourceTypes = modelData["sourceTypes"] ?? ["default"];
    
    
    classHeader = generateHeader(baseName);
    classConstructor =
        u.constructor(className: className, params: params, withKey: false, withID: true);
    classBody = body(baseName);
    footer =
        "final List<${u.toModel(baseName)}> initial${u.capWord(baseName)}List = [];";


  }

  String generateHeader(String baseName) {
    // Gets the var header from model lib
    String out = "";
    sourceTypes.forEach((sourceType) {
      if (modelHeaderLib.containsKey(sourceType))
          out += modelHeaderLib[sourceType](u.capWord(baseName), params) + "\n";
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



