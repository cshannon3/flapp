

class DestinationModel  {
  static final tblDestination = 'Destination';
	static final dbId = 'id';
	static final dbbackdropAssetPath = 'backdropAssetPath';
	static final dbflagAssetPath = 'flagAssetPath';
	static final dbname = 'name';
	static final dbcountry = 'country';
	static final dblat = 'lat';
	static final dblong = 'long';
	static final dborder = 'order';
	static final dbstayLength = 'stayLength';

	final int id;
	final String backdropAssetPath;
	final String flagAssetPath;
	final String name;
	final String country;
	final double lat;
	final double long;
	final int order;
	final int stayLength;

      DestinationModel({
      this.id,
		this.backdropAssetPath,
		this.flagAssetPath,
		this.name,
		this.country,
		this.lat,
		this.long,
		this.order,
		this.stayLength,

    });

    Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[dbId]=id;
		map[dbbackdropAssetPath]= backdropAssetPath;
		map[dbflagAssetPath]= flagAssetPath;
		map[dbname]= name;
		map[dbcountry]= country;
		map[dblat]= lat;
		map[dblong]= long;
		map[dborder]= order;
		map[dbstayLength]= stayLength;

    return map;
  }
      DestinationModel.fromMap(Map<String, dynamic> map) 
    : id= map['id'],
		backdropAssetPath = map['backdropAssetPath'],
		flagAssetPath = map['flagAssetPath'],
		name = map['name'],
		country = map['country'],
		lat = map['lat'],
		long = map['long'],
		order = map['order'],
		stayLength = map['stayLength'];
  
}

final List<DestinationModel> initialDestinationList = [
  new DestinationModel(
    backdropAssetPath: 'assets/madrid_cover.jpg',
    flagAssetPath: 'assets/spain.png',
    name: "Madrid",
    country: "Spain",
    lat: 40.4168,
    long: 3.7038,
    order: 1,
    stayLength: 5,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/spain_cover.jpg',
    flagAssetPath: 'assets/spain.png',
    name: "Barcelona",
    country: "Spain",
    lat: 41.3851,
    long: 2.1734,
    order: 2,
    stayLength: 5,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/hungary_cover.jpg',
    flagAssetPath: 'assets/hungary.png',
    name: "Budapest",
    country: "Hungary",
    lat: 47.4979,
    long: 19.0402,
    stayLength: 4,
    order: 3,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/zagreb_cover.jpg',
    flagAssetPath: 'assets/croatia.png',
    name: "Zagreb",
    country: "Croatia",
    lat: 45.8150,
    long: 15.9819,
    stayLength: 4,
    order: 4,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/sarajevo_cover.jpg',
    flagAssetPath: 'assets/bosnia.png',
    name: "Sarajevo",
    country: "Bosnia",
    lat: 43.8563,
    long: 18.4131,
    stayLength: 3,
    order: 5,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/bosnia_cover.jpg',
    flagAssetPath: 'assets/bosnia.png',
    name: "Mostar",
    country: "Bosnia",
    lat: 43.3438,
    long: 17.8078,
    stayLength: 4,
    order: 6,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/zabljak_cover.jpg',
    flagAssetPath: 'assets/montenegro.jpg',
    name: "Zabljak",
    country: "Montenegro",
    lat: 43.1555,
    long: 19.1226,
    stayLength: 4,
    order: 7,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/kotor_cover.jpg',
    flagAssetPath: 'assets/montenegro.jpg',
    name: "Kotor",
    country: "Montenegro",
    lat: 42.4247,
    long: 18.7712,
    stayLength: 2,
    order: 8,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/budva_cover.jpg',
    flagAssetPath: 'assets/montenegro.jpg',
    name: "Budva",
    country: "Montenegro",
    lat: 42.2911,
    long: 18.8403,
    stayLength: 2,
    order: 9,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/podgorica_cover.jpg',
    flagAssetPath: 'assets/montenegro.jpg',
    name: "Podgorica",
    country: "Montenegro",
    lat: 42.4304,
    long: 19.2594,
    stayLength: 1,
    order: 10,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/albania_cover.jpg',
    flagAssetPath: 'assets/albania.png',
    name: "Tirana",
    country: "Albania",
    lat: 41.3275,
    long: 19.8187,
    stayLength: 4,
    order: 11,

  ),


  new DestinationModel(
    backdropAssetPath: 'assets/macedonia_cover.jpg',
    flagAssetPath: 'assets/macedonia.png',
    name: "Ohrid",
    country: "Macedonia",
    lat: 41.1231,
    long:  20.8016,
    stayLength: 8,
    order: 7,

  ),
  new DestinationModel(
    backdropAssetPath: 'assets/skopje_cover.jpg',
    flagAssetPath: 'assets/macedonia.png',
    name: "Skopje",
    country: "Macedonia",
    lat: 41.9973,
    long:  21.4280,
    stayLength: 4,
    order: 13,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/sofia_cover.jpg',
    flagAssetPath: 'assets/bulgaria.png',
    name: "Sofia",
    country: "Bulgaria",
    lat: 42.6977,
    long:  23.3219,
    stayLength: 3,
    order: 14,


  ),
  new DestinationModel(
    backdropAssetPath: 'assets/romania_cover.jpg',
    flagAssetPath: 'assets/romania.png',
    name: "Bucharest",
    country: "Romania",
    lat: 44.4268,
    long: 26.1025,
    stayLength: 4,
    order: 15,


  ),


];
