class GameModel {

	int id;

	String name;



  GameModel({
    this.id,
    this.name,
  });  

}

final List<GameModel> initialGameModels = [
  GameModel(
    id: 0,
    name: "Scales"
  ),
    GameModel(
    id: 1,
    name: "Intervals"
  ),
  GameModel(
    id: 2,
    name: "Simon Sings"
  ),
  GameModel(
    id: 3,
    name: "Flappy Bird"
  ),

];

