

class BookModel  {
  
	 int id;
	 String isbn;
	 String title;
	 String author;
	 int year;
	 String ownershipStatus;
	 String readingStatus;
	 String imgUrl;
	 List<String> chapters;
	 List<int> readingEvents;
	 List<int> ideaNodes;
	 String recommendedBy;


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
		chapters = [map['chapters']],
		readingEvents = [],//map['readingEvents'],
		ideaNodes = [],//map['ideaNodes'],
		recommendedBy = map['recommendedBy'];
  

}
 List<BookModel> initialBookList = [];
