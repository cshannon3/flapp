//import '../libraries/params_lib.dart';
import '../params.dart';
import '../utils.dart';
import '../widget_info.dart';
import '../libraries/widget_tree_lib.dart';

//import '../widget_model.dart';
class ScreenTemplate extends WidgetInfo {
  String enumName;
  String baseName;
  Map widgetTree;

  ScreenTemplate(
      {String baseName,
      String screenType,
      Map screenData,
      bool modelBased = false}) {
    this.baseName = baseName;
    if(screenData==null)screenData={};
    className = capWord(baseName) + capWord(screenType);
    enumName = className.toUpperCase().split("SCREEN")[0];
    
    updatePackages(modelBased, screenType);


    String libName = capWord(screenType);

    if (modelBased)libName = "model" + libName;
        screenData["params"]
        ?.forEach((pname, pdata) => params.add(Param(pname, pdata)));
    if (params.isEmpty)params= getParamsFromLib(libName, baseName);

      
    widgetTree =
        screenData["widgetTree"] ?? 
        getWidgetTreeFromLib(key:libName, baseName:baseName, data:screenData);


    classHeader = paramsHeader(params: params);
    classConstructor = constructor(className: className, params: params);
    classBody = createBuildMethod(widgetTree);
    superClassName = "StatelessWidget";
  }
  //}

  updatePackages(bool modelBased, String screenType){
    packages.addAll([
      PacMan(fileName: "state_controller"),
      PacMan(dirName: "package:flutter/material", local: false)
    ]);
    if (modelBased) {
      packages.add(PacMan(fileName: baseName, dirName: "models"));
      if(screenType=="list_screen")packages.add(PacMan(fileName: "${baseName}_tile", dirName: "components"));
    }

  }
/*
  String getScreenCase() {
    return '''
        case SCREEN.$enumName:
          currentScreenWidget = $className(
            ${buildScreenParams()}
          ); 
          break;
''';
  }

  String buildScreenParams() {
    String out = '';
    params.forEach((param) {
      if (param.valueIn != null) {
        out += "${param.name}: ${param.valueIn},\n";
      }
    });
    return out;
  }

// TODO PARAMS
*/
}

/*
// Set imports = Set();
  //String importPath


  //, Function({String fileName, String dirName}) getPackagePath })
  //   :super(getPackagePath:getPackagePath)
    //  widgetTree = widgetTreeLib["default"]();


 if (modelBased) {
      String libName = "model${capWord(screenType)}";
      packages.add(PacMan(fileName: baseName, dirName: "models"));
      widgetTree =
          widgetTreeLib[libName](baseName) ?? widgetTreeLib["default"]();
      if (screenData.containsKey("params"))
        screenData["params"]
            .forEach((pname, pdata) => params.add(Param(pname, pdata)));
      else
        params = paramsLib[libName](baseName) ?? paramsLib["defaultScreen"]();
    } else {
      //String libName = baseName + capWord(screenType);
      widgetTree = widgetTreeLib[capWord(screenType)](baseName) ??
          widgetTreeLib["default"]();
      if (screenData.containsKey("params"))
        screenData["params"]
            .forEach((pname, pdata) => params.add(Param(pname, pdata)));
      else
        params = paramsLib[capWord(screenType)](baseName) ??
            paramsLib["defaultScreen"]();
    }

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
      widgetParams.add(Param("${toModelVar(baseName)}List",
          {"type": "List<${toModel(baseName)}>"}));

    return widgetParams;
  }
switch (screenType) {
case "screen":
enumName = baseName.toUpperCase();
params = getWidgetParams(single: true);
widgetTree = widgetTreeLib["default"]();
break;
case "list_screen":
packages
    .add(PacMan(fileName: '${baseName}_tile', dirName: "components"));
enumName = (baseName + "list").toUpperCase();
params = getWidgetParams(list: true);
widgetTree = widgetTreeLib["modelListScreen"](baseName);
break;
case "home":
enumName = "HOME";
params = getWidgetParams(select: false);
widgetTree = widgetTreeLib["default"]();
break;
default:
break;
}*/

// importsSet.addAll([
//   importStr(getPackagePath(fileName:"state_controller")),
//   importStr(getPackagePath(fileName:baseName, dirName: "models")),
//   "import 'package:flutter/material.dart'"
//   ]);
//filePath = "$importPath/screens/${baseName}_$screenType.dart";
//importsSet.add("import '$importPath/state_controller.dart'");
// importsSet.add("import '$importPath/models/$baseName.dart'");
//importsSet.add("import 'package:flutter/material.dart'");

//List<Param> params=[];

//bool isStateless = true;
/// This part => widget builder needs

// widgetBuilder = WidgetBuilder(
//       className: className,
//       params: params,
//       widgetTree: screenData["widgetTree"] ?? widgetTree,
//       isStateless:isStateless,
// );
// String get modelName => capWord(baseName)+"Model";
// String get modelVarName => baseName+"Model";

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

// String addConstructor(){
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
