class UserRecordingModel {

  static final tblUserRecordingModel = 'UserRecording';
	static final dbId = 'id';
	static final dbnotes = 'notes';
	static final dbsongKey = 'songKey';
	static final dbsong = 'song';
	static final dbscore = 'score';
	static final dbpitchAccuracy = 'pitchAccuracy';
	static final dbintervalAccuracy = 'intervalAccuracy';
	static final dbtimingAccuracy = 'timingAccuracy';
	static final dbwordAccuracy = 'wordAccuracy';

	int id;
	String notes;
	String songKey;
	int song;
	double score;
	int pitchAccuracy;
	int intervalAccuracy;
	int timingAccuracy;
	int wordAccuracy;

  UserRecordingModel({
    this.id,
		this.notes,
		this.songKey,
		this.song,
		this.score,
		this.pitchAccuracy,
		this.intervalAccuracy,
		this.timingAccuracy,
		this.wordAccuracy,

  });  

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[dbId]=id;
		map[dbnotes]= notes;
		map[dbsongKey]= songKey;
		map[dbsong]= song;
		map[dbscore]= score;
		map[dbpitchAccuracy]= pitchAccuracy;
		map[dbintervalAccuracy]= intervalAccuracy;
		map[dbtimingAccuracy]= timingAccuracy;
		map[dbwordAccuracy]= wordAccuracy;

    return map;
  }

  UserRecordingModel.fromMap(Map<String, dynamic> map) 
    : id= map[dbId],
		notes = map[dbnotes],
		songKey = map[dbsongKey],
		song = map[dbsong],
		score = map[dbscore],
		pitchAccuracy = map[dbpitchAccuracy],
		intervalAccuracy = map[dbintervalAccuracy],
		timingAccuracy = map[dbtimingAccuracy],
		wordAccuracy = map[dbwordAccuracy];

}

final List<UserRecordingModel> initialUserRecordingModels = [];

