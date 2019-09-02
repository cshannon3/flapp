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
/*

    //FileTreeBranch modelBranch = rootFileTree.branchDirs["models"];
    //

   // classHeader = controllerHeaderLib[type]();
    // dataControllerClassHeader();
    //classBody = controllerLib["data_controller"](modelBranch.branchFiles) ?? "";
 
String dataControllerClassHeader() =>
      "AppDatabase appDB = AppDatabase.get();";

  String stateControllerClassHeader() => '''
    DataController dataController = DataController();
    SCREEN currentScreen = SCREEN.HOME;
    Widget currentScreenWidget = Container();
    
''';
*/
   // switch (type) {
    //   case "data_controller":
    //     classHeader = dataControllerClassHeader();
    //     classConstructor = constructor(className: className, withKey: false);
    //     classBody = controllerLib["data_controller"](modelBranch.branchFiles) ?? "";
    //     //classBody = dataControllerBody(modelBranch.branchFiles);
    //     break;
    //   case "state_controller":
      
    //     FileTreeBranch screenBranch = rootFileTree.branchDirs["screens"];
    //     superClassName = "ChangeNotifier";
    //     header = stateControllerHeader(screenBranch.branchFiles);
    //     classHeader = stateControllerClassHeader();
    //     classConstructor = constructor(className: className, withKey: false);
    //     classBody = controllerLib["state_controller"](screenBranch.branchFiles, modelBranch.branchFiles) ?? "";
    //     // classBody = stateControllerBody(
    //     //     screenBranch.branchFiles, modelBranch.branchFiles);
    //     break;
    //   default:
    // }
 //packages.add(PacMan(fileName: className, dirName: "models"));
        //packages.add(PacMan(fileName: "localdb", dirName: "sources"));
//modelBranch.branchFiles.forEach((modelBaseName, modelTemplate) =>
    //         packages.add(PacMan(fileName: modelBaseName, dirName: "models")));

//  String buildAppBar() {
//     return '''
//   Widget buildAppBar() {
//     return AppBar(
//       title: Text("Music"),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_left),
//         onPressed: () {
//         },
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.home),
//           onPressed: () {
           
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//           },
//         ),
//       ],
//     );
//   }
//     ''';
//   }
 // String dataControllerBody(Map models) {
  //   String out = "";
  //   models.forEach((baseName, modelTemplate) {
  //     packages.add(PacMan(fileName: baseName, dirName: "models"));
  //     if (modelTemplate.sourceTypes.contains("localdb")) {
  //       out += modelLocalDBFunction("appDB", baseName);
  //       out += "\n"; //m.functionsStr;
  //     } else if (modelTemplate.sourceTypes.contains("jsonData")) {
  //       out += modelJsonFunction(modelTemplate.assetName, capWord(baseName));
  //       out += "\n"; //m.functionsStr;
  //     }
  //   });
  //   return out;
  // }

// String modelLocalDBFunction(String sourceVar, String className) {
//     return '''
//     Future<List<${capWord(className)}Model>> get${capWord(className)}List() async{
//       List<${capWord(className)}Model> em = await $sourceVar.get${capWord(className)}List();
//       if(em.isEmpty && initial${capWord(className)}List.isNotEmpty){await $sourceVar.add${capWord(className)}List(initial${capWord(className)}List); return initial${capWord(className)}List;}
//       return em;
//     }
//     add${capWord(className)}(${capWord(className)}Model new${capWord(className)}) async{
//       await $sourceVar.add${capWord(className)}(new${capWord(className)});return;
//     }
//     ''';
//   }

//   String modelJsonFunction(String assetName, String className) {
//     return '''

//     Future<List<${capWord(className)}Model>> get${capWord(className)}List() async{
//       List<${capWord(className)}Model> em = [];
//       String data = await rootBundle.loadString("assets/data.json");
//       final jsonData = json.decode(data);
//       jsonData['$assetName']?.forEach((item){
//         em.add(${capWord(className)}Model.fromMap(item));
//       });
//       return em;
//     }
//     add${capWord(className)}(${capWord(className)}Model new${capWord(className)}) async{}
//     ''';
//   }

// String addModelImports(List<DataModel> datamodels){
//     String out = "";

//     datamodels.forEach((model){
//        out+="import 'models/${model.fileTree.baseName}.dart';\n";
//     });
//     return out;

// }
// String addDefaultImports(){
//     String out = "";
//     imports.forEach((i){
//        out+="import '$i';\n";
//     });
//     return out;
// }
// String addImports(){
//     String out = "import 'package:flutter/material.dart';\n";
//     out+="import 'data_manager.dart';\n";
//     //TODO Add in screens
//     //  screens.forEach((screen){
//     //     out+= "import '${screen.importPath}.dart';\n";
//     //   });
//     models?.forEach((m){
//       out+= "import 'models/${m.fileTree.className.toLowerCase()}.dart';\n";

//     });
//     return out+"\n\n";
//   }
//  String stateControllerBody(Map screens, Map models) {
//     return '''

//     ${buildModelsVars(models)}

//     initialize() async {
//       ${buildModelsInit(models)}
//     }

//     AppBar get appbar => buildAppBar();
//     void changeScreen(SCREEN newScreen) {
//       if (newScreen != currentScreen) {
//         currentScreen = newScreen;
//         switch (currentScreen) {
//           case SCREEN.HOME:
//             currentScreenWidget = Container(); 
//           break;

// ${buildScreenCases(screens)}
//         }
//         notifyListeners();
//       }
//     }
//     ${buildAppBar()}

//     ${buildModelFunctions(models)}
//     ''';
//   }

//   String buildModelsVars(Map models) {
//     String out = "";
//     models.forEach((modelBaseName, modelTemplate) {
//       packages.add(PacMan(fileName: modelBaseName, dirName: "models"));
//       String m = capWord(modelBaseName);
//       out += "\t${m}Model current$m;\n";
//       out += "\tList<${m}Model> ${m.toLowerCase()}List = List();\n";
//     });
//     return out;
//   }

//   String buildModelsInit(Map models) {
//     String out = "";
//     models.forEach((modelBaseName, modelTemplate) {
//       String m = capWord(modelBaseName);
//       out += "\t${m.toLowerCase()}List = await dataController.get${m}List();\n";
//     });
//     return out;
//   }

//   String buildModelFunctions(Map models) {
//     String out = "";
//     models.forEach((modelBaseName, modelTemplate) {
//       out += buildModelFunction(modelBaseName, modelTemplate);
//     });
//     return out;
//   }

//   String buildModelFunction(String modelBaseName, dynamic modelTemplate) {
//     String m = capWord(modelBaseName);
//     return '''

//   changeCurrent$m(${m}Model new$m,bool updateSource) {

//     current$m=new$m;
//     if(updateSource){
//       dataController.add$m(new$m);
//       ${m.toLowerCase()}List.add(new$m);
//       }
//       notifyListeners();
//     }
//       ''';
//   }

//   String buildScreenCases(Map screens) {
//     String out = "";
//     screens.forEach((screenFileName, screenTemplate) {
//       out += screenTemplate.getScreenCase();
//     });

//     return out;
//   }

//   // todo replace w/ widget stuff
//   String buildScreenParams(List<Param> params) {
//     String out = '';
//     params.forEach((param) {
//       if (param.valueIn != null) {
//         out += "${param.name}: ${param.valueIn},\n";
//       }
//     });
//     return out;
//   }