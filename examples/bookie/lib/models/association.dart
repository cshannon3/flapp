

class AssociationModel  {
  static final tblAssociation = 'Association';
	static final dbId = 'id';
	static final dbbookFromId = 'bookFromId';
	static final dbchapterFrom = 'chapterFrom';
	static final dbideaNodeFromId = 'ideaNodeFromId';
	static final dbbookToId = 'bookToId';
	static final dbchapterTo = 'chapterTo';
	static final dbideaNodeToId = 'ideaNodeToId';
	static final dbstrength = 'strength';


	final int id;
	final int bookFromId;
	final String chapterFrom;
	final int ideaNodeFromId;
	final int bookToId;
	final String chapterTo;
	final int ideaNodeToId;
	final double strength;


  AssociationModel({this.id, this.bookFromId, this.chapterFrom, this.ideaNodeFromId, this.bookToId, this.chapterTo, this.ideaNodeToId, this.strength, });
      
    Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    map['Id']=id;
		map['bookFromId']=bookFromId;
		map['chapterFrom']=chapterFrom;
		map['ideaNodeFromId']=ideaNodeFromId;
		map['bookToId']=bookToId;
		map['chapterTo']=chapterTo;
		map['ideaNodeToId']=ideaNodeToId;
		map['strength']=strength;

    return map;
  }
  
    AssociationModel.fromDBMap(Map<String, dynamic> map) 
    : id= map[dbId],
		bookFromId = map[dbbookFromId],
		chapterFrom = map[dbchapterFrom],
		ideaNodeFromId = map[dbideaNodeFromId],
		bookToId = map[dbbookToId],
		chapterTo = map[dbchapterTo],
		ideaNodeToId = map[dbideaNodeToId],
		strength = map[dbstrength];
  

}
final List<AssociationModel> initialAssociationList = [];
