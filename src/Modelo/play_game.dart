import 'cell.dart';
import 'game.dart';

class PlayGame{

  List<Cell> cells = [];

  PlayGame(){
    for(int i = 0; i < 9; i++)
      cells.add(Cell());
    Game.turn = "X";
  }
}