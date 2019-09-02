

class WidgetTreeNode {

  String widgetName;
  List imports=[];
  Map params = {};
  String code="";
  Map data;
  int indents;

  WidgetTreeNode(Map data, int indents){
    this.widgetName = data["WidgetName"];
    this.indents = indents??0;
    this.code = "$widgetName(\n";
    
    this.data = data;
    addParams();

  code+="\t"*(indents-1)+")";
  }


  addParams(){
    data["params"]?.forEach((paramName,paramVal){
        if(paramVal is Map){
         if (paramVal.containsKey("WidgetName")) {
          WidgetTreeNode childWidget= WidgetTreeNode(paramVal, indents+1);
            imports.addAll(childWidget.imports);
            code+= "\t"*indents +"$paramName:${childWidget.code},\n";
         }
        }
        else if(paramVal is List){}
        else {
          code+=("\t"*indents) +"$paramName: $paramVal," +"\n";
          params[paramName]=paramVal;
        } 
    });
  }


}





// class WidgetBuilder{
//   String className;
//   List<Param> params=[];
//   Map widgetTree;
//   bool isStateless=true;
//   String
//     customSlot1="",
//     customSlot2="", 
//     customSlot3="";

//   WidgetBuilder({this.className, this.params, this.widgetTree, this.isStateless});

//   String addParams(){
//     String out = "";
//     params?.forEach((p){
//         out+= "\tfinal ${p.type} ${p.name};\n";
//     });
//     return out;
//   }

//   String addConstructor(){
//     String out = '';
//     if(params.isNotEmpty){
//       out+="const $className({Key key, ";
//           params?.forEach((p){
//         out+= "this.${p.name}, ";
//       });
//       out+="}) : super(key: key);";
//     }
//     return out;
//   }
  
//   String build(){
//     return isStateless
//             ? buildStateless()
//             : buildStateful();
//   }

//   String buildWidgetTree(){
//     WidgetModel widgetModel = WidgetModel(widgetTree, 2);
//     return widgetModel.code;
//   }

// String buildStateful({String customSlot1="", String customSlot2="", String customSlot3=""}){
//     return '''
// class $className extends StatefulWidget {
//    ${addParams()}
//   $customSlot1
//   ${addConstructor()}
//   @override
//   _${className}State createState() => _${className}State();
// }

// class _${className}State extends State<$className> {
//   $customSlot2
//   @override
//   Widget build(BuildContext context) {
//     $customSlot3
//     return ${buildWidgetTree()};
//   }
// }

//     ''';
//   }
//   String buildStateless({String customSlot1="", String customSlot2="", String customSlot3=""}){
//      return '''
// class $className extends StatelessWidget {
//   ${addParams()}
//   $customSlot1
//   ${addConstructor()}
//   $customSlot2
//   @override
//   Widget build(BuildContext context) {
//     $customSlot3
//     return ${buildWidgetTree()};
//   }
// }
// ''';
//   }
// }
