

class PlaceModel  {
  static final tblPlace = 'Place';
	static final dbId = 'id';
	static final dbname = 'name';
	static final dbdestination = 'destination';
	static final dbrating = 'rating';
	static final dbprice = 'price';
	static final dbaddress = 'address';
	static final dburl = 'url';
	static final dbreservation = 'reservation';
	static final dbimagePath = 'imagePath';

	final int id;
	final String name;
	final String destination;
	final double rating;
	final double price;
	final String address;
	final String url;
	final bool reservation;
	final String imagePath;

      PlaceModel({
      this.id,
		this.name,
		this.destination,
		this.rating,
		this.price,
		this.address,
		this.url,
		this.reservation,
		this.imagePath,

    });

    Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[dbId]=id;
		map[dbname]= name;
		map[dbdestination]= destination;
		map[dbrating]= rating;
		map[dbprice]= price;
		map[dbaddress]= address;
		map[dburl]= url;
		map[dbreservation]= reservation;
		map[dbimagePath]= imagePath;

    return map;
  }
      PlaceModel.fromMap(Map<String, dynamic> map) 
    : id= map['id'],
		name = map['name'],
		destination = map['destination'],
		rating = map['rating'],
		price = map['price'],
		address = map['address'],
		url = map['url'],
		reservation = map['reservation'],
		imagePath = map['imagePath'];
  
}

final List<PlaceModel> initialPlaceList = [
    new PlaceModel(
    id: 10597,
    name: "Sophie's Hostel",
    destination: "Prague",
    price: 12.27,
    rating: 9.4,
    address: "Melounova 2, Prague, Czech Republic",
    url: "https://www.hostelworld.com/hosteldetails.php/Sophie-s-Hostel/Prague/10597",
    reservation: false,
    imagePath: "https://ucd.hwstatic.com/propertyimages/1/10597/11_80.jpg"
  ),
  new PlaceModel(
      id: 42948,
      name: "Podstel Bucharest",
      destination: "Bucharest",
      price: 14.62,
      rating: 9.6,
      address: "Olimpului Street No 13, Bucharest, Romania",
      url: "https://www.hostelworld.com/hosteldetails.php/Podstel-Bucharest/Bucharest/42948",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/4/42948/197_30.jpg"
  ),
  new PlaceModel(
      id: 73957,
      name: "Hostel Hikers Den",
      destination: "Zabljak",
      price: 16.38,
      rating: 9.6,
      address: "Zabljak Center b.b., Zabljak, Montenegro",
      url: "https://www.hostelworld.com/hosteldetails.php/Hostel-Hikers-Den/Zabljak/73957",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/7/73957/7_80.jpg"
  ),
  new PlaceModel(
      id: 42307,
      name: "Grandio Party Hostel",
      destination: "Budapest",
      price: 24.88,
      rating: 9.1,
      address: "Nagy Diofa Utca 8, Budapest, Hungary",
      url: "https://www.hostelworld.com/hosteldetails.php/Grandio-Party-Hostel/Budapest/42307",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/4/42307/3_80.jpg"
  ),
  new PlaceModel(
      id: 24308,
      name: "Carpe Noctem Original",
      destination: "Budapest",
      price: 29.49,
      rating: 9.7,
      address: "Szobi utca 5, 3/8a, Budapest, Hungary",
      url: "https://www.hostelworld.com/hosteldetails.php/Carpe-Noctem-Original/Budapest/24308",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/2/24308/9_80.jpg"
  ),
  new PlaceModel(
      id: 51589,
      name: "Retox Party Hostel",
      destination: "Budapest",
      price: 28.75,
      rating: 9.3,
      address: "O utca 41, Budapest, Budapest, Hungary",
      url: "https://www.hostelworld.com/hosteldetails.php/Retox-Party-Hostel/Budapest/51589",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/5/51589/17_30.jpg"
  ),

  new PlaceModel(
      id: 275977,
      name: "Whole Wide World Hostel",
      destination: "Zagreb",
      price: 21.20,
      rating: 9.3,
      address: "Fra Andrije Kaciceva Miosica 3b, Zagreb, Croatia",
      url: "https://www.hostelworld.com/hosteldetails.php/Whole-Wide-World-Hostel-and-Bar/Zagreb/275977",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/2/275977/26_80.jpg"
  ),
  new PlaceModel(
      id: 79685,
      name: "Hostel Vegabond Sarajevo",
      destination: "Sarajevo",
      price: 12.56,
      rating: 9.5,
      address: "Ferhadija 21, Sarajevo, Bosnia and Herzegovina",
      url: "https://www.hostelworld.com/hosteldetails.php/Hostel-Vagabond-Sarajevo/Sarajevo/79685",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/7/79685/502_80.jpg"
  ),

  new PlaceModel(
      id: 66316,
      name: "Balkan Han Hostel",
      destination: "Sarajevo",
      price: 11.76,
      rating: 9.6,
      address: "Dalmatinska 6, Sarajevo, Bosnia and Herzegovina",
      url: "https://www.hostelworld.com/hosteldetails.php/Balkan-Han-Hostel/Sarajevo/66316",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/6/66316/507_80.jpg"
  ),
  new PlaceModel(
      id: 73679,
      name: "Hostel Majdas",
      destination: "Mostar",
      price: 10.59,
      rating: 9.9,
      address: "Pere Lazetica 9, Mostar, Bosnia and Herzegovina",
      url: "https://www.hostelworld.com/hosteldetails.php/Hostel-Majdas/Mostar/73679",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/7/73679/5_80.jpg"
  ),
  new PlaceModel(
      id: 43649,
      name: "Taso's House",
      destination: "Mostar",
      price: 10.58,
      rating: 10.0,
      address: "Marsala Tita 187, Mostar, Bosnia and Herzegovina",
      url: "https://www.hostelworld.com/hosteldetails.php/Taso-s-House/Mostar/43649",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/4/43649/37_40.jpg"
  ),
  new PlaceModel(
      id: 278744,
      name: "Agape Farm Camp",
      destination: "Kotor",
      price: 15.13,
      rating: 10.0,
      address: "Ijesevici Village, Kotor, Montenegro",
      url: "https://www.hostelworld.com/hosteldetails.php/Agape-Farm-Camp/Kotor/278744",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/2/278744/34_40.jpeg"
  ),

  new PlaceModel(
      id: 35708,
      name: "Montenegro Hostel B&B Kotor",
      destination: "Kotor",
      price: 23.55,
      rating: 9.0,
      address: "Stari Grad b.b., Kotor, Montenegro",
      url: "https://www.hostelworld.com/hosteldetails.php/Montenegro-Hostel-B-and-B-Kotor/Kotor/35708",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/3/35708/39_40.jpg"
  ),
  new PlaceModel(
      id: 36975,
      name: "Montenegro Hostel B&B Budva",
      destination: "Budva",
      price: 23.55,
      rating: 9.5,
      address: "Vuka Karadia 12, Stari Grad Budva, Budva, Montenegro",
      url: "https://www.hostelworld.com/hosteldetails.php/Montenegro-Hostel-B-and-B-Budva/Budva/36975",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/3/36975/55_80.jpg"
  ),
  new PlaceModel(
      id: 51038,
      name: "Freedom Hostel Budva",
      destination: "Budva",
      price: 28.77,
      rating: 9.5,
      address: "Vuka Karadia 12, Stari Grad Budva, Budva, Montenegro",
      url: "https://www.hostelworld.com/hosteldetails.php/Freedom-Hostel-Budva/Budva/51038",
      reservation: false,
      imagePath: "https://ucd.hwstatic.com/propertyimages/5/51038/1_80.jpg"
  ),



];

