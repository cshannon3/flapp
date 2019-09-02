import '../params.dart';
import '../templates/screen.dart';
import '../utils.dart';
import '../file_tree_model.dart';

Map<String, dynamic> controllerLib = {
  "data_controller": {
    "classHeader":()=>"AppDatabase appDB = AppDatabase.get();",
    "classBody":(FileTreeRoot rootFileTree) {
          String out = "";
          rootFileTree.branchDirs["models"].branchFiles.forEach((baseName, modelTemplate) {
            
            if (modelTemplate.sourceTypes.contains("localdb")) {
              out += modelLocalDBFunction("appDB", baseName);
              out += "\n"; //m.functionsStr;
            } else if (modelTemplate.sourceTypes.contains("jsonData")) {
              out += modelJsonFunction(baseName);
              out += "\n"; //m.functionsStr;
            }
          });
          return out;
  },

  },

  "state_controller":{
    "classHeader":() => '''
    DataController dataController = DataController();
    SCREEN currentScreen = SCREEN.HOME;
    Widget currentScreenWidget = Container();
''',
    "classBody":(FileTreeRoot rootFileTree){
      Map  screens = rootFileTree.branchDirs["screens"].branchFiles;
       Map  models = rootFileTree.branchDirs["models"].branchFiles;

      return '''

    ${buildModelsVars(models)}

    initialize() async {
      ${buildModelsInit(models)}
    }

    AppBar get appbar => buildAppBar();
    void changeScreen(SCREEN newScreen) {
      if (newScreen != currentScreen) {
        currentScreen = newScreen;
        switch (currentScreen) {
          case SCREEN.HOME:
            currentScreenWidget = Container(); 
          break;

${buildScreenCases(screens)}
        }
        notifyListeners();
      }
    }
    ${buildAppBar()}

    ${buildModelFunctions(models)}
    ''';
    }

  }
};




String modelLocalDBFunction(String sourceVar, String className) {
    return '''
    Future<List<${capWord(className)}Model>> get${capWord(className)}List() async{
      List<${capWord(className)}Model> em = await $sourceVar.get${capWord(className)}List();
      if(em.isEmpty && initial${capWord(className)}List.isNotEmpty){await $sourceVar.add${capWord(className)}List(initial${capWord(className)}List); return initial${capWord(className)}List;}
      return em;
    }
    add${capWord(className)}(${capWord(className)}Model new${capWord(className)}) async{
      await $sourceVar.add${capWord(className)}(new${capWord(className)});return;
    }
    ''';
  }
  String modelJsonFunction(String className) {
    return '''

    Future<List<${capWord(className)}Model>> get${capWord(className)}List() async{
      List<${capWord(className)}Model> em = [];
      String data = await rootBundle.loadString("assets/$className.json");
      final jsonData = json.decode(data);
      jsonData.forEach((item){
        em.add(${capWord(className)}Model.fromMap(item));
      });
      return em;
    }
    add${capWord(className)}(${capWord(className)}Model new${capWord(className)}) async{}
    ''';
  }

    String buildModelsVars(Map models) {
    String out = "";
    models.forEach((modelBaseName, modelTemplate) {
      //packages.add(PacMan(fileName: modelBaseName, dirName: "models"));
      String m = capWord(modelBaseName);
      out += "\t${m}Model current$m;\n";
      out += "\tList<${m}Model> ${m.toLowerCase()}List = List();\n";
    });
    return out;
  }

  String buildModelsInit(Map models) {
    String out = "";
    models.forEach((modelBaseName, modelTemplate) {
      String m = capWord(modelBaseName);
      out += "\t${m.toLowerCase()}List = await dataController.get${m}List();\n";
    });
    return out;
  }

  String buildModelFunctions(Map models) {
    String out = "";
    models.forEach((modelBaseName, modelTemplate) {
      out += buildModelFunction(modelBaseName, modelTemplate);
    });
    return out;
  }

  String buildModelFunction(String modelBaseName, dynamic modelTemplate) {
    String m = capWord(modelBaseName);
    return '''

  changeCurrent$m(${m}Model new$m,bool updateSource) {

    current$m=new$m;
    if(updateSource){
      dataController.add$m(new$m);
      ${m.toLowerCase()}List.add(new$m);
      }
      notifyListeners();
    }
      ''';
  }

  String buildScreenCases(Map screens) {
    String out = "";
    screens.forEach((screenFileName, screenTemplate) {
      out += getScreenCase(screenTemplate);
    });

    return out;
  }
  String getScreenCase(ScreenTemplate screenTemplate) {
    return '''
        case SCREEN.${screenTemplate.enumName}:
          currentScreenWidget = ${screenTemplate.className}(
            ${buildScreenParams(screenTemplate.params)}
          ); 
          break;
''';
  }

  String buildScreenParams(List<Param> params) {
    String out = '';
    params.forEach((param) {
      if (param.valueIn != null) {
        out += "${param.name}: ${param.valueIn},\n";
      }
    });
    return out;
  }

  // todo replace w/ widget stuff
  // String buildScreenParams(List<Param> params) {
  //   String out = '';
  //   params.forEach((param) {
  //     if (param.valueIn != null) {
  //       out += "${param.name}: ${param.valueIn},\n";
  //     }
  //   });
  //   return out;
  // }

   String buildAppBar() {
    return '''
  Widget buildAppBar() {
    return AppBar(
      title: Text("App Title"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
           // changeScreen(SCREENS.);
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
          },
        ),
      ],
    );
  }
    ''';
  }


  
// Map<String, dynamic> controllerLib = {
//   "data_controller":  (Map models) {
//     String out = "";
//     models.forEach((baseName, modelTemplate) {
      
//       if (modelTemplate.sourceTypes.contains("localdb")) {
//         out += modelLocalDBFunction("appDB", baseName);
//         out += "\n"; //m.functionsStr;
//       } else if (modelTemplate.sourceTypes.contains("jsonData")) {
//         out += modelJsonFunction(baseName);
//         out += "\n"; //m.functionsStr;
//       }
//     });
//     return out;
//   },
//   "state_controller":(Map screens, Map models)=>'''

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
//     '''
// };