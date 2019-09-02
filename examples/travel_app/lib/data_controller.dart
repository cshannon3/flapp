import 'package:travel_app/models/destination.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/sources/localdb.dart';


class DataController  {
  AppDatabase appDB = AppDatabase.get();
  DataController();
      Future<List<DestinationModel>> getDestinationList() async{
      //List<DestinationModel> em = await appDB.getDestinationList();
     // if(em.isEmpty && initialDestinationList.isNotEmpty){await appDB.addDestinationList(initialDestinationList);
       return initialDestinationList;//}
     // return em;
    }
    addDestination(DestinationModel newDestination) async{
      await appDB.addDestination(newDestination);return;
    }
    
    Future<List<PlaceModel>> getPlaceList() async{
      //List<PlaceModel> em = await appDB.getPlaceList();
     // if(em.isEmpty && initialPlaceList.isNotEmpty){await appDB.addPlaceList(initialPlaceList); 
      return initialPlaceList;
      //}
      //return em;
    }
    addPlace(PlaceModel newPlace) async{
      await appDB.addPlace(newPlace);return;
    }
    

}

