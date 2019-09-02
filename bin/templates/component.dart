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

