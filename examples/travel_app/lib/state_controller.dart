import 'package:travel_app/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/screens/destination_list_screen.dart';
import 'package:travel_app/screens/place_screen.dart';
import 'package:travel_app/screens/place_list_screen.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/models/place.dart';

enum SCREEN { DESTINATION, DESTINATIONLIST, PLACE, PLACELIST,  }
class StateController  extends ChangeNotifier {
      DataController dataController = DataController();
    SCREEN currentScreen = SCREEN.PLACE;
    Widget currentScreenWidget = Container();
    

  StateController();
  
    	DestinationModel currentDestination;
	List<DestinationModel> destinationList = List();
	PlaceModel currentPlace;
	List<PlaceModel> placeList = List();


    initialize() async {
      	destinationList = await dataController.getDestinationList();
	      placeList = await dataController.getPlaceList();

    }

    AppBar get appbar => buildAppBar();
    void changeScreen(SCREEN newScreen) {
      if (newScreen != currentScreen) {
        currentScreen = newScreen;
        switch (currentScreen) {
        case SCREEN.DESTINATION:
          currentScreenWidget = DestinationScreen(
            changeScreen: changeScreen,
            selectDestinationModel: changeCurrentDestination,
            destinationModel: currentDestination,
          ); 
          break;
        case SCREEN.DESTINATIONLIST:
          currentScreenWidget = DestinationListScreen(
            selectDestinationModel: changeCurrentDestination,
            changeScreen: changeScreen,
            destinationModelList: destinationList,
          ); 
          break;
        case SCREEN.PLACE:
          currentScreenWidget = PlaceScreen(
            changeScreen: changeScreen,
            selectPlaceModel: changeCurrentPlace,
            placeModel: currentPlace,
          ); 
          break;
        case SCREEN.PLACELIST:
          currentScreenWidget = PlaceListScreen(
            changeScreen: changeScreen,
            selectPlaceModel: changeCurrentPlace,
            placeModelList: placeList,
            destinationModelList: destinationList,
          ); 
          break;

        }
        notifyListeners();
      }
    }
      Widget buildAppBar() {
    return AppBar(
      title: Text("Music"),
      leading: IconButton(
        icon: Icon(Icons.arrow_left),
        onPressed: () {
          changeScreen(SCREEN.DESTINATIONLIST);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
           
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
             changeScreen(SCREEN.PLACELIST);
          },
        ),
      ],
    );
  }
    

    
  changeCurrentDestination(DestinationModel newDestination,bool updateSource) {

    currentDestination=newDestination;
    if(updateSource){
      dataController.addDestination(newDestination);
      destinationList.add(newDestination);
      }
      notifyListeners();
    }
      
  changeCurrentPlace(PlaceModel newPlace,bool updateSource) {

    currentPlace=newPlace;
    if(updateSource){
      dataController.addPlace(newPlace);
      placeList.add(newPlace);
      }
      notifyListeners();
    }
      
    
}

