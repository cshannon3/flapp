import 'libraries/params_lib.dart';
import 'libraries/widget_tree_lib.dart';
import 'params.dart';
import 'widget_model.dart';

String capWord(String word) {
  if (!word.contains("_")) return word[0].toUpperCase() + word.substring(1);
  String out = "";
  word.split("_").forEach((w) => out += capWord(w));
  return out;
}

String toModel(String baseName) => capWord(baseName) + "Model";
String toModelVar(String baseName) => baseName + "Model";

String constructor(
    {String className,
    List<Param> params = const [],
    bool withKey = true,
    bool isOptional = true,
    bool withID=false}) {

  String paramsStr = (withID)?"this.id, ":'';
  params?.forEach((p) {
    paramsStr += "this.${p.name}, ";
  });

  return (withKey)
      ? "const $className({Key key, " + paramsStr + "}) : super(key: key);"
      : (isOptional && paramsStr != '')
          ? "$className({" + paramsStr + "});"
          : "$className(" + paramsStr + ");";
}

Map getWidgetTreeFromLib({String key, String baseName, Map data}) {
  if(widgetTreeLib.containsKey(key))return widgetTreeLib[key](baseName,data) ;
  return widgetTreeLib["default"]();
}

List getParamsFromLib(String key, String baseName) =>
    paramsLib[key](baseName) ?? paramsLib["default"]();

String buildWidgetTree({Map widgetTree, int indents = 2}) {
  WidgetTreeNode widgetModel = WidgetTreeNode(widgetTree, indents);
  return widgetModel.code;
}

String paramsHeader({List<Param> params,}) {
  String out = "";
  params?.forEach((p) {
    out += "\tfinal ${p.type} ${p.name};\n";
  });
  return out;
}

String importStr(String path) => "import '$path.dart'";

/*

  if (withKey) {
    out += "const $className({Key key, ";

    out += "}) : super(key: key);";
  } else {
    out += "$className({";
    params?.forEach((p) {
      out += "this.${p.name}, ";
    });
    out += "});";
  }

  return out;
 */
