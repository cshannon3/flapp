
import 'params.dart';

class PacMan{
  String fileName; String dirName;bool local;bool asIs;String pubspecStr;
  PacMan({this.fileName, this.dirName="", this.local=true, this.asIs=false, this.pubspecStr=""});
}

abstract class WidgetInfo{
  List<Param> params=[];
  //Function({String fileName, String dirName}) getPackagePath;
  //String filePath;
  List<PacMan> packages=[];
  bool stateless=true;
  String statefulConstructor="", statefulClassHeader="";
  String 
    header="",
      className,
      superClassName="",
        classHeader="",
        classConstructor="",
        classBody="",
    footer="";

    WidgetInfo({this.className="", });//this.getPackagePath });//this.filePath=""

    String build(String importsStr){
      
     return 
     (stateless)?
'''
$importsStr
$header
class $className ${getSuperClass()} {
  $classHeader
  $classConstructor
  $classBody
}
$footer
''':
'''
$importsStr
$header
class $className extends StatefulWidget {
  $statefulClassHeader
  $statefulConstructor
  @override
  _${className}State createState() => _${className}State();
}
class _${className}State extends State<$className> {
  $classHeader
  $classConstructor
  $classBody

$footer
'''
;
  }

 
  String getSuperClass()=>(superClassName!="")?" extends $superClassName":"";
 // String getPath()=>"$filePath.dart";

      
}

 // String addImports(){
  //   String out="";
  //   packages.forEach((p){
  //     String s = p.dirName;
  //     if (p.local){
  //       s= getPackagePath(fileName:p.fileName, dirName:p.dirName);
  //     }
  //      out+="import '$s.dart';\n";
  //   });
  //   return out;
  //   // var _import=importsSet.join(";\r\n");
  //   // _import+=_import.isEmpty?"":";";
  //   // return _import;
  // }
