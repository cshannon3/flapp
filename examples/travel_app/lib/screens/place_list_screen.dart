import 'package:travel_app/models/destination.dart';
import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/place_tile.dart';

class PlaceListScreen extends StatelessWidget {
  final Function(SCREEN) changeScreen;
  final Function(PlaceModel, bool) selectPlaceModel;
  final List<PlaceModel> placeModelList;
  final List<DestinationModel> destinationModelList;

  const PlaceListScreen(
      {Key key,
      this.changeScreen,
      this.selectPlaceModel,
      this.placeModelList,
      this.destinationModelList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListView(
        children: countryTiles()
       
      ),
    );
  }

  List<Widget> countryTiles() {
    String lastcountry = destinationModelList[0].country;
    List<Widget> countrytiles = [];
    List<DestinationModel> countrydests = [];
    int i = 0;

    for (i; i < destinationModelList.length; i++) {
      if (destinationModelList[i].country == lastcountry) {
        countrydests.add(destinationModelList[i]);
      } else {
        countrytiles.add(_buildCountrytile(lastcountry, countrydests));
        lastcountry = destinationModelList[i].country;
        countrydests.clear();
        countrydests.add(destinationModelList[i]);
      }
      if (i == (destinationModelList.length - 1)) {
        countrytiles.add(_buildCountrytile(
          lastcountry,
          countrydests,
        ));
      }
    }
    return countrytiles;
  }

  Widget _buildCountrytile(String countryname, List<DestinationModel> cos) {
    return new ExpansionTile(
        title: Text(countryname),
        leading: Container(
          height: 50.0,
          width: 100.0,
          //color: Colors.red,
          child: new Image.asset(
            cos[0].flagAssetPath,
            fit: BoxFit.cover,
          ), //Image asset
        ), // Container,
        children:  buildDests(cos) 
        );
  }

  List<Widget> buildDests(List<DestinationModel> cos) {
    List<Widget> dests = [];
    cos.forEach((d) {
      dests.add(
        ExpansionTile(
      title: Text(d.name),
      children: buildPlaceTiles(d.name)
    ));   
  });
  return dests;
  }

  List<PlaceTile> buildPlaceTiles(String destName){
    List<PlaceTile> places=[];
    placeModelList.where((p)=>p.destination==destName).forEach((p){
      places.add(
        PlaceTile(
              placeModel: p,
               selectPlaceModel: selectPlaceModel,
               changeScreen: changeScreen)
         );
    });
    return places;
  }
}
// new destinationTile(
//         places: places,
//         dest: d.name,
//         onWebViewPressed: (String url) {
//           /*  Navigator.push(context,
//                     new MaterialPageRoute(
//                         builder: (_) =>
//                         new CustomWebView(
//                           url: url,
//                         )));*/
//         },
//         onDeletePressed: (int id) {
//           db.deletePlace(id);
//           loadDestinationsandPlaces();
//         },
//       ));
//     });
//     return dests;
//   }
//    List.generate(placeModelList.length, (i) {
//           return PlaceTile(
//               placeModel: placeModelList[i],
//               selectPlaceModel: selectPlaceModel,
//               changeScreen: changeScreen);
//         }),