//import '../libraries/params_lib.dart';
import '../libraries/widget_tree_lib.dart';
import '../params.dart';
import '../utils.dart';
import '../widget_info.dart';
//import '../widget_model.dart';

class ComponentTemplate extends WidgetInfo {
  String baseName;
  Map widgetTree;

  ComponentTemplate(
      {String baseName,
      String componentType,
      Map componentData,
      bool modelBased =false}) 
  {
    if(componentData==null)componentData={};

    this.baseName = baseName;
    className = capWord(baseName) + capWord(componentType);
    packages.addAll([
      PacMan(fileName: "state_controller"),
      PacMan(dirName: "package:flutter/material", local: false)
    ]);

    String libName = capWord(componentType);
    if (modelBased) {
      libName = "model" + libName;
      packages.add(PacMan(fileName: baseName, dirName: "models"));
    }

    widgetTree = componentData["widgetTree"] ??
     getWidgetTreeFromLib(key:libName, baseName:baseName, data:componentData);

    componentData["params"]
        ?.forEach((pname, pdata) => params.add(Param(pname, pdata)));
    if (params.isEmpty) params = getParamsFromLib(libName, baseName);


    classHeader = paramsHeader(params: params);
    classConstructor = constructor(className: className, params: params);
    classBody = createBuildMethod(widgetTree); //body();
    superClassName = "StatelessWidget";
  }

// TODO PARAMS
  update(){
    classHeader = paramsHeader(params: params);
    classConstructor = constructor(className: className, params: params);
    classBody = createBuildMethod(widgetTree); //body();
    superClassName = "StatelessWidget";

  }

}



/*
//,Function({String fileName, String dirName}) getPackagePath })
  //  :super(getPackagePath:getPackagePath)//, String importPath
else {
//String libName = baseName + capWord(screenType);
widgetTree = widgetTreeLib[capWord(componentType)](baseName) ??
widgetTreeLib["default"]();
if (componentData.containsKey("params"))
componentData["params"]
    .forEach((pname, pdata) => params.add(Param(pname, pdata)));
else
params = paramsLib[capWord(componentType)](baseName) ??
paramsLib["defaultScreen"]();
}
widgetTree =
widgetTreeLib[libName](baseName) ?? widgetTreeLib["default"]();
if (componentData.containsKey("params"))
componentData["params"].forEach((pname, pdata) => params.add(Param(pname, pdata)));
else
params = paramsLib[libName](baseName) ?? paramsLib["defaultScreen"]();


 List<Param> getWidgetParams(
      {bool single = false, bool list = false, bool select = true}) {
    List<Param> widgetParams = [
      Param("changeScreen", {"type": "Function(SCREEN)"})
    ];
    if (single)
      widgetParams
          .add(Param(toModelVar(baseName), {"type": toModel(baseName)}));
    if (select)
      widgetParams.add(Param("select${toModel(baseName)}",
          {"type": "Function(${toModel(baseName)}, bool)"}));
    if (list)
      widgetParams.add(Param(
          "${toModelVar(baseName)}s", {"type": "List<${toModel(baseName)}>"}));

    return widgetParams;
  }
    widgetTree = widgetTreeLib["default"]();
    switch (componentType) {
      case "form":
        params = getWidgetParams(single: true);
        widgetTree = widgetTreeLib["default"]();
        // isStateless=false; TODO
        break;
      case "chart":
        params = getWidgetParams(single: true);
        widgetTree = widgetTreeLib["default"]();
        break;
      case "tile":
        params = getWidgetParams(single: true);
        widgetTree = widgetTreeLib["modelTile"](
          baseName: baseName,
          subtitle: "subtitle",
          title: "title",
          color: "blue",
        );
        break;
      default:
        break;
    }
String body()=>
    '''
    @override
  Widget build(BuildContext context) {
    return ${buildWidgetTree(widgetTree:widgetTree)};
  }

''';
*/
// filePath= "$importPath/components/${baseName}_$componentType.dart";
// importsSet.addAll([
//   importStr(getPackagePath(fileName:"state_controller")),
//   importStr(getPackagePath(fileName:baseName, dirName: "models")),
//   "import 'package:flutter/material.dart'"
//   ]);
// importsSet.add("import '$importPath/state_controller.dart'");
// importsSet.add("import '$importPath/models/$baseName.dart'");
// importsSet.add("import 'package:flutter/material.dart'");

// String buildWidgetTree(){
//   WidgetTreeNode widgetModel = WidgetTreeNode(widgetTree, 2);
//   return widgetModel.code;
// }
// String addParams(){
//   String out = "";
//   params?.forEach((p){
//       out+= "\tfinal ${p.type} ${p.name};\n";
//   });
//   return out;
// }

// String addConstructor({String className, List<Param> params}){
//   String out = '';
//   if(params.isNotEmpty){
//     out+="const $className({Key key, ";
//         params?.forEach((p){
//       out+= "this.${p.name}, ";
//     });
//     out+="}) : super(key: key);";
//   }
//   return out;
// }
