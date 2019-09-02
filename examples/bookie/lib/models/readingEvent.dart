

class ReadingEventModel  {
  static final tblReadingEvent = 'ReadingEvent';
	static final dbId = 'id';
	static final dbbookId = 'bookId';
	static final dbpageStart = 'pageStart';
	static final dbpageEnd = 'pageEnd';
	static final dbtimeStart = 'timeStart';
	static final dbtimeEnd = 'timeEnd';


	final int id;
	final int bookId;
	final int pageStart;
	final int pageEnd;
	final String timeStart;
	final String timeEnd;


  ReadingEventModel({this.id, this.bookId, this.pageStart, this.pageEnd, this.timeStart, this.timeEnd, });
      
    Map<String, dynamic> toDBMap(){
    var map = Map<String, dynamic>();
    map['Id']=id;
		map['bookId']=bookId;
		map['pageStart']=pageStart;
		map['pageEnd']=pageEnd;
		map['timeStart']=timeStart;
		map['timeEnd']=timeEnd;

    return map;
  }
  
    ReadingEventModel.fromDBMap(Map<String, dynamic> map) 
    : id= map[dbId],
		bookId = map[dbbookId],
		pageStart = map[dbpageStart],
		pageEnd = map[dbpageEnd],
		timeStart = map[dbtimeStart],
		timeEnd = map[dbtimeEnd];
  

}
final List<ReadingEventModel> initialReadingEventList = [];
