import '../file_tree_model.dart';
import '../libraries/controllers_lib.dart';
import '../params.dart';
import '../utils.dart';
import '../widget_info.dart';

class ControllerTemplate extends WidgetInfo {
  Map data;

  String codeOut = ""; // TEMP

  ControllerTemplate({String type, FileTreeRoot rootFileTree}) {
    className = capWord(type);
    updatePackages(rootFileTree,type);
 
    Map classMap = controllerLib[type]??{};

    classHeader=classMap["classHeader"]()??"";
    classConstructor = constructor(className: className, withKey: false);
    classBody = classMap["classBody"](rootFileTree) ?? "";
    if(type=="state_controller"){
      header = stateControllerHeader(rootFileTree.branchDirs["screens"].branchFiles);
      superClassName = "ChangeNotifier";
    }

  }


  updatePackages(FileTreeRoot rootFileTree, String controllerType){
    rootFileTree.branchDirs["models"].branchFiles.forEach((modelBaseName, modelTemplate) =>
            packages.add(PacMan(fileName: modelBaseName, dirName: "models")));
    if(controllerType=="state_controller"){
      packages.addAll([
          PacMan(fileName: "data_controller"),
          PacMan(dirName: "package:flutter/material", local: false)
      ]);
    }
    else if (controllerType=="data_controller"){
      // TODO not assume localdb
      packages.add(PacMan(fileName: "localdb", dirName: "sources"));
      packages.add(PacMan(dirName: "package:flutter/services", local: false));
      packages.add(PacMan(dirName: "dart:convert", local: false,asIs: true));
    }
  }
  String stateControllerHeader(Map screens) =>
      "enum SCREEN { HOME, ${addScreenEnums(screens)} }";
  
 
  
  String addScreenEnums(Map screens) {
    String out = "";
    screens.forEach((screenFileName, screenTemplate) {
      packages.add(PacMan(fileName: screenFileName, dirName: "screens"));
      out += screenTemplate.enumName + ", ";
    });

    return out;
  }

 

 
}
