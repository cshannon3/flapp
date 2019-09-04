

class BookModel  {
  
	final int id;
	final String isbn;
	final String title;
	final String author;
	final int year;
	final String ownershipStatus;
	final String readingStatus;
	final String imgUrl;
	final List<String> chapters;
	final List<int> readingEvents;
	final List<int> ideaNodes;
	final String recommendedBy;


  BookModel({this.id, this.isbn, this.title, this.author, this.year, this.ownershipStatus, this.readingStatus, this.imgUrl, this.chapters, this.readingEvents, this.ideaNodes, this.recommendedBy, });
      
    BookModel.fromMap(Map<String, dynamic> map) 
    : id= map['Id'],
		isbn = map['isbn'],
		title = map['title'],
		author = map['author'],
		year = map['year'],
		ownershipStatus = map['ownershipStatus'],
		readingStatus = map['readingStatus'],
		imgUrl = map['imgUrl'],
		chapters = map['chapters'],
		readingEvents = map['readingEvents'],
		ideaNodes = map['ideaNodes'],
		recommendedBy = map['recommendedBy'];
  

}
final List<BookModel> initialBookList = [];
