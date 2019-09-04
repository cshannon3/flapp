//import '../libraries/params_lib.dart';
import '../libraries/widget_tree_lib.dart' as  w;
import '../params.dart';
import '../utils.dart' as u;
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
    className = u.capWord(baseName) + u.capWord(componentType);
    packages.addAll([
      PacMan(fileName: "state_controller"),
      PacMan(dirName: "package:flutter/material", local: false)
    ]);

    String libName = u.capWord(componentType);
    if (modelBased) {
      libName = "model" + libName;
      packages.add(PacMan(fileName: baseName, dirName: "models"));
    }

    widgetTree = componentData["widgetTree"] ??
     u.getWidgetTreeFromLib(key:libName, baseName:baseName, data:componentData);

    componentData["params"]
        ?.forEach((pname, pdata) => params.add(Param(pname, pdata)));
    if (params.isEmpty) params = u.getParamsFromLib(libName, baseName);


    classHeader = u.paramsHeader(params: params);
    classConstructor = u.constructor(className: className, params: params);
    classBody = w.createBuildMethod(widgetTree); //body();
    superClassName = "StatelessWidget";
  }

// TODO PARAMS
  update(){
    classHeader = u.paramsHeader(params: params);
    classConstructor = u.constructor(className: className, params: params);
    classBody = w.createBuildMethod(widgetTree); //body();
    superClassName = "StatelessWidget";

  }

}

