

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


