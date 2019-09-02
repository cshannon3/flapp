

class WordModel  {
  static final tblWord = 'Word';
	static final dbId = 'id';
	static final dbword = 'word';
	static final dbsynonyms = 'synonyms';
	static final dbdefinition = 'definition';
	static final dbtype = 'type';
	static final dbexample = 'example';
	static final dbknow = 'know';
	static final dbcorrectAttempts = 'correctAttempts';
	static final dbincorrectAttempts = 'incorrectAttempts';


	final int id;
	final String word;
	final List synonyms;
	final String definition;
	final String type;
	final String example;
	final bool know;
	final int correctAttempts;
	final int incorrectAttempts;


  WordModel({this.id, this.word, this.synonyms, this.definition, this.type, this.example, this.know, this.correctAttempts, this.incorrectAttempts, });
      
    Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    map['Id']=id;
		map['word']=word;
		map['synonyms']=synToStr();
		map['definition']=definition;
		map['type']=type;
		map['example']=example;
		map['know']=know?"1":"0";
		map['correctAttempts']=correctAttempts;
		map['incorrectAttempts']=incorrectAttempts;

    return map;
  }
  String synToStr(){
    String out="";
    synonyms?.forEach((s){
      out+=s+",";
    });
    if(out!="") out=out.substring(0, out.length-1);
    return out;
  }
  
    WordModel.fromDBMap(Map<String, dynamic> map) 
    : id= map[dbId],
		word = map[dbword],
		synonyms = map[dbsynonyms].split(","),
		definition = map[dbdefinition],
		type = map[dbtype],
		example = map[dbexample],
		know = map[dbknow]!="0",
		correctAttempts = map[dbcorrectAttempts],
		incorrectAttempts = map[dbincorrectAttempts];
  
    
    WordModel.fromMap(Map<String, dynamic> map) 
    : id= map['Id'],
		word = map['word'],
		synonyms = map['synonyms'],
		definition = map['definition'],
		type = map['type'],
		example = map['example'],
		know = false,
		correctAttempts = 0,
		incorrectAttempts = 0;
  

}
final List<WordModel> initialWordList = [];
