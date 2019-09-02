class SongModel {

  static final tblSongModel = 'Song';
	static final dbId = 'id';
	static final dbname = 'name';
	static final dbartist = 'artist';
	static final dbsongKey = 'songKey';
	static final dbattempts = 'attempts';
	static final dbavgScore = 'avgScore';
	static final dblastTenScore = 'lastTenScore';

	int id;
	String name;
	String artist;
	String songKey;
	int attempts=0;
	double avgScore=0.0;
	double lastTenScore=0.0;

  SongModel({
    this.id,
		this.name,
		this.artist,
		this.songKey,
		this.attempts,
		this.avgScore,
		this.lastTenScore,

  });  

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[dbId]=id;
		map[dbname]= name;
		map[dbartist]= artist;
		map[dbsongKey]= songKey;
		map[dbattempts]= attempts;
		map[dbavgScore]= avgScore;
		map[dblastTenScore]= lastTenScore;

    return map;
  }

  SongModel.fromMap(Map<String, dynamic> map) 
    : id= map[dbId],
		name = map[dbname],
		artist = map[dbartist],
		songKey = map[dbsongKey],
		attempts = map[dbattempts],
		avgScore = map[dbavgScore],
		lastTenScore = map[dblastTenScore];

}

List<String> keys = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
final List<SongModel> initialSongModels = [

  SongModel(
    name: "Unsteady",
    artist: "X Ambassadors",
    songKey: "C"
  ),
  SongModel(
    name: "Piano Man",
    artist: "Billy Joel",
    songKey: "C"
  ),
  SongModel(
    name: "Walking In Memphis",
    artist: "Marc Cohn",
    songKey: "C"
  ),
  SongModel(
    name: "Superman",
    artist: "Five For Fighting",
    songKey: "C"
  ),

];

