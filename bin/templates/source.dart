import '../libraries/sources_lib.dart';
import '../utils.dart';
import '../widget_info.dart';

class DataSourceTemplate extends WidgetInfo {
  DataSourceTemplate({String sourceType, Map models}) {
    classHeader = sourceHeaderLib[sourceType](models) ?? "";
    switch (sourceType) {
      case "localdb":
        className = "AppDatabase";
        //addGeneralDB();
        classBody = sourceLib[sourceType](models) ?? "";
        packages.addAll([
          PacMan(dirName: "package:path/path", local: false, pubspecStr: "path"),
          PacMan(dirName: "package:sqflite/sqflite", local: false, pubspecStr: "sqflite"),
          PacMan(dirName: "package:path_provider/path_provider", local: false, pubspecStr: "path_provider"),
          PacMan(dirName: "dart:async", local: false, asIs: true),
          PacMan(dirName: "dart:io", local: false, asIs: true)
        ]);
        models.forEach((modelBaseName, modelTemplate) =>
            packages.add(PacMan(fileName: modelBaseName, dirName: "models")));

        break;
      default:
        break;
    }
  }
}
