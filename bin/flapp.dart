////TOOOOODDDDDOOOOOOOOO
///1. figure Out best way to do templates for models and source types, and controllers
///2. add Templates in
///3. Add models, source types and controllers back in
///
/*
TEMPLATE RULES
1. Initiate
  During initiation: 
    Model gets model data, model basename
      screen gets modeldata, modelbasename, screenname, screen data
      component gets modeldata, modelbasename, componentname, component data
    SourceData gets source type modelBranches
    Data Controller gets jsondata
    Screen gets jsondata

  The templates for all of these need to have all info to build
  and have params, classname open

2. Build
  Imports are added during build(maybe)
*/
import 'dart:convert';
import 'dart:io';
import 'file_tree_model.dart';
import 'libraries/sources_lib.dart';
import 'main_generator.dart';
import 'templates/component.dart';
import 'templates/controller.dart';
import 'templates/data_model.dart';
import 'templates/screen.dart';
import 'templates/source.dart';


String baseJsonFolder = "./jsons";
String baseOutputFolder = "./lib";
String dirPath = "./lib";

void main(List<String> args) {
  var map = getJsonMap();
 // createFromJson();
 Main mainClass = Main(map);
 mainClass.create();
}

class Main{
  String appName;
  FileTreeRoot rootFileTree;
  Set sources= new Set();
  
  Main(var map){
  
    appName = map["AppName"];
    rootFileTree = FileTreeRoot(importPath: "package:$appName", dirPath: "./lib");
    //if (!map.containsKey("models"))return;
    rootFileTree.addBranchDirs(["models","sources","screens","components"]);
    // Add Models => screesn and components
    map["models"].forEach((modelBasename, modelData){
        addModel(modelBasename, modelData);
    });
    map["models"].forEach((modelBasename, modelData){
        addComponents(modelBasename, modelData);
        addScreens(modelBasename, modelData);
    });

    if(sources.isNotEmpty)sources.forEach((sourceName)=>addSource(sourceName)); 
    
    addController("data_controller");
    addController("state_controller");
  }

  create(){
    rootFileTree.createFile(mainGenerator(), "$dirPath/main.dart");
    rootFileTree.create();
  }

 

  addModel(String modelBasename, Map modelData){
    sources.addAll(modelData["sourceTypes"]);
    rootFileTree.branchDirs["models"].addBranchFile(
          modelBasename,
          DataModelTemplate(
            baseName:modelBasename, 
            modelData:modelData 
            )
        );
    }

  
  addSource(String sourceName){
    if(sourceHeaderLib.containsKey(sourceName)){
      Map sourceModels={};
          rootFileTree.branchDirs["models"].branchFiles.forEach((modelName, modelTemplate){
            if(modelTemplate.sourceTypes.contains(sourceName))sourceModels[modelName]=modelTemplate;
            });
          rootFileTree.branchDirs["sources"].addBranchFile(
              sourceName, 
              DataSourceTemplate(
                sourceType:sourceName, 
                models:sourceModels,
              )
        );
      }
    }

 
  addScreens(String modelBasename, Map modelData){
    modelData["screens"]?.forEach((screenName, screenData)=>
        addScreen( screenName, modelData, modelBasename)
    );
  }
  addScreen(String screenName, Map modelData, [String modelBasename]){
    rootFileTree.branchDirs["screens"].addBranchFile(
      (modelBasename!=null)?"${modelBasename}_$screenName":screenName, 
      ScreenTemplate(
        baseName:modelBasename, 
        screenType:screenName, 
        modelBased: true
        )
    );
    
  }
  addComponents(String modelBasename, Map modelData){
    modelData["components"]?.forEach((componentName, componentData)=>
        addComponent(componentName, modelData,modelBasename)
    );

  }

  addComponent(String componentName, Map modelData,[String modelBasename]){
    rootFileTree.branchDirs["components"].addBranchFile(
      (modelBasename!=null)?"${modelBasename}_$componentName":componentName, 
      ComponentTemplate(
        baseName:modelBasename, 
        componentType:componentName, 
        modelBased: true
        )
    );

  }

  addController(String controllerName){
    rootFileTree.addRootFile(
        controllerName,
        ControllerTemplate(
          type: controllerName,
          rootFileTree: rootFileTree,
        )
      );
  }
  
}

    
// import 'main_generator.dart';
// import 'manager.dart';
// import 'models/data_model.dart'; 
    // //if(modelData.containsKey("components"))
    // addComponents(modelBasename, modelData);
    
    // //if(modelData.containsKey("screens"))
    // addScreens(modelBasename, modelData);
      //if(!rootFileTree.branchDirs.containsKey("models"))
         // rootFileTree.addBranchDir("models");

    //rootFileTree.addBranchDir("components");
// bool createFromJson(){
  
//   var map = getJsonMap();
//   String appName = map["AppName"];
//   print(appName);
//   Set sources= new Set();

//   FileTreeRoot rootFileTree = FileTreeRoot(importPath: "package:$appName", dirPath: "./lib");
//   rootFileTree.createFile(mainGenerator(), "$dirPath/main.dart");
  
//   addScreen(String screenName, Map modelData, [String modelBasename]){
//     rootFileTree.branchDirs["screens"].addBranchFile(
//       (modelBasename!=null)?"${modelBasename}_$screenName":screenName, 
//       ScreenTemplate(
//         baseName:modelBasename, 
//         modelData:modelData, 
//         screenType:screenName, 
//         )
//     );
    
//   }

//   addComponent(String componentName, Map modelData,[String modelBasename]){
//     rootFileTree.branchDirs["components"].addBranchFile(
//       (modelBasename!=null)?"${modelBasename}_$componentName":componentName, 
//       ComponentTemplate(
//         baseName:modelBasename, 
//         modelData:modelData, 
//         componentType:componentName, 
//         )
//     );

//   }
  
//   addModel(String modelBasename, Map modelData){
//     sources.addAll(modelData["sourceTypes"]);
//     rootFileTree.branchDirs["models"].addBranchFile(
//           modelBasename, 
//           DataModelTemplate(modelBasename, modelData)
//     );

//     if(modelData.containsKey("components")){
//       rootFileTree.addBranchDir("components");
//       modelData["components"]?.forEach((componentName, componentData){
//         addComponent(componentName, modelData,modelBasename);
//       });

//     }
//     if(modelData.containsKey("screens")){
//       rootFileTree.addBranchDir("screens");
//       modelData["screens"]?.forEach((screenName, screenData){
//         addScreen( screenName, modelData, modelBasename);
//       });
//     }
//   }


//   if (map.containsKey("models")){
//       rootFileTree.addBranchDir("models");
//       map["models"].forEach((modelBasename, modelData){
//         addModel(modelBasename, modelData);
//       });
//       if(sources.isNotEmpty){
//         rootFileTree.addBranchDir("sources");
       
//         sources.forEach((sourceName){
//             Map sourceModels={};
//             rootFileTree.branchDirs["models"].branchFiles.forEach((modelName, modelTemplate){
//               if(modelTemplate.sourceTypes.contains(sourceName))sourceModels[modelName]=modelTemplate;
//               });
//             rootFileTree.branchDirs["sources"].addBranchFile(
//                 sourceName, 
//                 DataSourceTemplate(
//                   sourceName, 
//                   sourceModels
//                 )
//           );
//         });
//       }
//   }
//   rootFileTree.addRootFile(
//     "data_controller",
//     ControllerTemplate(
//       type: "data_controller",
//       rootFileTree: rootFileTree
//     )
//   );
//   rootFileTree.addRootFile(
//     "state_controller",
//     ControllerTemplate(
//       type: "state_controller",
//       rootFileTree: rootFileTree
//     )
//   );

//   rootFileTree.create();
//   return true;
// }




Map getJsonMap(){
  var jsonlist = Directory(baseJsonFolder).listSync(recursive: true);
  if(jsonlist.isEmpty) return null;
  var f = jsonlist[0];
  if (FileSystemEntity.isFileSync(f.path)) {
    File file = File(f.path);
    var map = json.decode(file.readAsStringSync());
    return map;
  }
  return null;
}



// map["models"]
//             .where((modelName, modelData)=> modelData["sourceTypes"]?.contains(sourceName))
//             .forEach((modelName, modelData)=> sourceModels.add(Mod(modelName, modelData)));

  //FileTreeModel rootFileTree = FileTreeModel(importPath: "package:$appName", dirPath: "./lib");

 // Manager manager = Manager(rootFileTree, map);
  // rootFileTree.branchFile("main").createFile(mainGenerator());
 

  // manager.build();

// String baseJsonFolder = "./jsons";
// String baseOutputFolder = "./lib";
// String dirPath = "./lib";

// void main(List<String> args) {
//   createFromJson();
// }
// bool createFromJson(){
  
//   var map = getJsonMap();
//   String appName = map["AppName"];
//   print(appName);

//   //FileTreeModel rootFileTree = FileTreeModel(importPath: "package:$appName", dirPath: "./lib");

//  // Manager manager = Manager(rootFileTree, map);
//   // rootFileTree.branchFile("main").createFile(mainGenerator());
 

//   // manager.build();
  
//   return true;
// }




// Map getJsonMap(){
//   var jsonlist = Directory(baseJsonFolder).listSync(recursive: true);
//   if(jsonlist.isEmpty) return null;
//   var f = jsonlist[0];
//   if (FileSystemEntity.isFileSync(f.path)) {
//     File file = File(f.path);
//     var map = json.decode(file.readAsStringSync());
//     return map;
//   }
//   return null;
// }




