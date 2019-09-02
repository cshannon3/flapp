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
}