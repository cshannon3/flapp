import 'package:travel_app/state_controller.dart';
import 'package:travel_app/models/place.dart';
import 'package:flutter/material.dart';


class PlaceTile  extends StatelessWidget {
  	final Function(SCREEN) changeScreen;
	final PlaceModel placeModel;
	final Function(PlaceModel, bool) selectPlaceModel;

  const PlaceTile({Key key, this.changeScreen, this.placeModel, this.selectPlaceModel, }) : super(key: key);
      @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap: (){
            selectPlaceModel(placeModel,false);
            changeScreen(SCREEN.PLACE);
          },
          child: new Container(

      padding: EdgeInsets.all(10.0),
      color: Colors.grey,
      child: Stack(
          children: <Widget>[
            new Container(
              height: 230.0,
              width: double.infinity,
              child: new Image.network(
                placeModel.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),

              height: 230.0,
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Expanded(
              child: new Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
              child: Container(
                // alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.web),
                  onPressed: (){
                  
                  },
                ),
              ),
            ),
    ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: new Container(
                          width: 250.0,
                          child: Text(placeModel.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                              color: Colors.white,
                              fontFamily: 'petita',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                          child: Container(
                            // alignment: Alignment.topRight,

                            child: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: (){
                              
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Address: ${placeModel.address}", style: TextStyle(color: Colors.white),),
                  Expanded(child: Container(),),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                            Icons.star),
                        new Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child:

                          new Text(placeModel.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),


                        Expanded(child: Container(),),
                        Icon(Icons.monetization_on),
                        new Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: new Text("${placeModel.price.toString()}/night",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),),
                        ),
                        Expanded(child: Container(),),
                        Icon(Icons.check_box_outline_blank),
                        new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text((placeModel.reservation==true) ? "Res Made" : "No Res",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),),
                        ),

                      ],
                    ), // Row
                  ), // Padding
                ],

              ), // Column

            ), // Container

          ],
      ), // Stack

    ),
        ); 
  }


}


// return Padding(
// 		padding: const EdgeInsets.all(8.0),
// 		child:Container(
// 			decoration:BoxDecoration(
// 				color: Colors.blue,
// 				border: new Border.all(
//                 color: Colors.green,
//                 width: 2.0,
//                 style: BorderStyle.solid
//             ),
// 				borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
// 			),
// 			child:ListTile(
// 				onTap: (){selectPlaceModel(placeModel, false); changeScreen(SCREEN.PLACE);},
// 				subtitle: Text(placeModel.name),
// 				title: Text(placeModel.price.toString()),
// 			),
// 		),
// 	);
//   }