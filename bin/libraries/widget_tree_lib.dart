import '../params.dart';
import '../utils.dart';

String createBuildMethod(Map widgetTree) => '''
    @override
  Widget build(BuildContext context) {
    return ${buildWidgetTree(widgetTree: widgetTree)};
  }

''';
Param modelVar(String baseName) =>
    Param(toModelVar(baseName), {"type": toModel(baseName), "valueIn":"current${capWord(baseName)}"});
Param selectModel(String baseName) => Param("select${toModel(baseName)}",
    {"type": "Function(${toModel(baseName)}, bool)", "valueIn":"changeCurrent${capWord(baseName)}"});
Param changeScreen() => Param("changeScreen", {"type": "Function(SCREEN)",  "valueIn":"changeScreen"});
Param modelList(String baseName) => Param(
    "${toModelVar(baseName)}List", {"type": "List<${toModel(baseName)}>", "valueIn":"${baseName.toLowerCase()}List"});





Map<String, dynamic> widgetLib = {
  "default": {

    "widgetTree":() => {
        "WidgetName": "Container",
        "params": {"color": "Colors.blue"}
      }
  },
  "modelListScreen":{
    "params":(String baseName) =>
      [selectModel(baseName), modelList(baseName), changeScreen()],
  "widgetTree": (String baseName,Map data) =>widgetTreeLib["modelListScreen"](baseName,data)
  },
  "modelChart":{
    "params": (String baseName) => [modelList(baseName), changeScreen()],
  },
  "modelForm":{
    "stateless":false,
    "classHeader":"",
    "params":(String baseName) =>
      [modelVar(baseName), selectModel(baseName), changeScreen()],
    "widgetTree":{
    }
  },
  "modelTile": {
   "params": (String baseName) =>
      [modelVar(baseName), selectModel(baseName), changeScreen()],
  "widgetTree":(
    String baseName,
    Map data) => widgetTreeLib["modelTile"](baseName,data)
  }
  
};


Map<String, dynamic> widgetTreeLib = {
  "default": () => {
        "WidgetName": "Container",
        "params": {"color": "Colors.blue"}
      },
  "modelListScreen": (
    String baseName,
    Map data
  ) =>
      {
        "WidgetName": "Container",
        "params": {
          "color": "Colors.red",
          "child": {
            "WidgetName": "ListView",
            "params": {
              "children":
                  "List.generate(${toModelVar(baseName)}List.length, (i){return ${capWord(baseName)}Tile( ${toModelVar(baseName)}: ${toModelVar(baseName)}List[i], select${toModel(baseName)}:select${toModel(baseName)},  changeScreen: changeScreen);})"
            }
          }
        }
      },
  "modelTile": (
    String baseName,
    Map data
  ) =>
      {
        "WidgetName": "Padding",
        "params": {
          "padding": "const EdgeInsets.all(8.0)",
          "child": {
            "WidgetName": "Container",
            "params": {
              "decoration": {
                "WidgetName": "BoxDecoration",
                "params": {
                  "color": "Colors.${data["color"]??"blue"}",
                  "border": '''new Border.all(
                color: Colors.green,
                width: 2.0,
                style: BorderStyle.solid
            )''',
                  "borderRadius":
                      "new BorderRadius.all(new Radius.circular(20.0))"
                }
              },
              "child": {
                "WidgetName": "ListTile",
                "params": {
                  "onTap":
                      "(){select${toModel(baseName)}(${toModelVar(baseName)}, false); changeScreen(SCREEN.${baseName.toUpperCase()});}",
                  "subtitle": "Text('subtitle')",
                  "title": "Text('title')"
                }
              }
            }
          }
        },
      },
};
