class NoteModel {

  static final tblNoteModel = 'Note';
	static final dbId = 'id';
	static final dbduration = 'duration';
	static final dbnote = 'note';
	static final dbdeviation = 'deviation';
  static final dbsamples = 'samples';


	int id;
  int duration;
	String note;
	double deviation;
  int samples;


  NoteModel({
    this.id,
    this.deviation,
    this.duration,
    this.note,
    this.samples
  });  

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[dbId]=id;
		map[dbduration]= duration;
		map[dbnote]= note;
		map[dbdeviation]= deviation;
    map[dbsamples]= samples;

    return map;
  }

  NoteModel.fromMap(Map<String, dynamic> map) 
    : id= map[dbId],
		duration = map[dbduration],
		note= map[dbnote],
		deviation= map[dbdeviation],
    samples = map[dbsamples];

}

final List<NoteModel> initialNoteModels = [];

