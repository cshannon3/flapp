class Param{
    String name;
    String type;
    String value;
    String valueIn;

    Param(String _name, Map _data){
      name = _name;
      type = _data["type"];
      value = _data["value"]??null;
      valueIn = _data["valueIn"]??null;
      
    }
  }
