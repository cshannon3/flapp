import '../params.dart';
import '../utils.dart';

Param modelVar(String baseName) =>
    Param(toModelVar(baseName), {"type": toModel(baseName), "valueIn":"current${capWord(baseName)}"});
Param selectModel(String baseName) => Param("select${toModel(baseName)}",
    {"type": "Function(${toModel(baseName)}, bool)", "valueIn":"changeCurrent${capWord(baseName)}"});
Param changeScreen() => Param("changeScreen", {"type": "Function(SCREEN)",  "valueIn":"changeScreen"});
Param modelList(String baseName) => Param(
    "${toModelVar(baseName)}List", {"type": "List<${toModel(baseName)}>", "valueIn":"${baseName.toLowerCase()}List"});

Map<String, dynamic> paramsLib = {
  "defaultScreen": () => [changeScreen()],
  "modelListScreen": (String baseName) =>
      [selectModel(baseName), modelList(baseName), changeScreen()],
  "modelScreen": (String baseName) =>
      [modelVar(baseName), selectModel(baseName), changeScreen()],
  "modelForm": (String baseName) =>
      [modelVar(baseName), selectModel(baseName), changeScreen()],
  "modelTile": (String baseName) =>
      [modelVar(baseName), selectModel(baseName), changeScreen()],
  "modelChart": (String baseName) => [modelList(baseName), changeScreen()],
};
