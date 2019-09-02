

class IdeaNodeModel  {
  static final tblIdeaNode = 'IdeaNode';
	static final dbId = 'id';
	static final dbtext = 'text';
  static final dbbookTitle = 'bookTitle';
	static final dbbookId = 'bookId';
	static final dbpage = 'page';
	static final dbchapter = 'chapter';
	static final dbtype = 'type';
	static final dbcategory = 'category';
	static final dbassociatons = 'associatons';


	int id;
  String text;
	String bookTitle;
	int bookId;
	int page;
	int chapter;
	String type;
	String category;
	List<int> associatons;


  IdeaNodeModel({this.id, this.text, this.bookTitle, this.bookId, this.page, this.chapter, this.type="", this.category="", this.associatons=const[], });
      
    Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    map['Id']=id;
		map['text']=text;
    map['bookTitle']=bookTitle;
		map['bookId']=bookId;
		map['page']=page;
		map['chapter']=chapter;
		map['type']=type;
		map['category']=category;
		map['associatons']=associatons;

    return map;
  }
  
    IdeaNodeModel.fromDBMap(Map<String, dynamic> map) 
    : id= map[dbId],
		text = map[dbtext],
    bookTitle = map[dbbookTitle],
		bookId = map[dbbookId],
		page = map[dbpage],
		chapter = map[dbchapter],
		type = map[dbtype],
		category = map[dbcategory],
		associatons = map[dbassociatons];
  

}
final List<IdeaNodeModel> initialIdeaNodeList = [

IdeaNodeModel(
  id: 1,
  text: "Test example",
  bookTitle: "Meditations",
  bookId: 6,
  page: 5,
  chapter: 1,
)
];
